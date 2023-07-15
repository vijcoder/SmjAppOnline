using Domains.Models;
using Domains.Repository;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Paytm;
using SmjApp.ViewModels;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using SmjApp.Extensions;
using AutoMapper;

namespace SmjApp.Controllers
{
    //[Authorize(Roles = "User")]
    public class CheckoutController : Controller
    {
        private readonly IConfiguration configuration;
        private readonly IMembersRegistrationRepository _membersRegistrationRepository;
        private readonly IRegistrationTransactionRepository _registrationTransactionRepository;
        private readonly IContributionTransactionRepository _contributionTransactionRepository;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IMapper _mapper;
        public CheckoutController(IConfiguration configuration, IMembersRegistrationRepository membersRegistrationRepository
            , IRegistrationTransactionRepository registrationTransactionRepository,
            IContributionTransactionRepository contributionTransactionRepository,
            IHttpContextAccessor httpContextAccessor, IMapper mapper)
        {
            this.configuration = configuration;
            this._membersRegistrationRepository = membersRegistrationRepository;
            this._registrationTransactionRepository = registrationTransactionRepository;
            this._contributionTransactionRepository = contributionTransactionRepository;
            this._httpContextAccessor = httpContextAccessor;
            this._mapper = mapper;
        }
        /// <summary>  
        /// set the cookie  
        /// </summary>  
        /// <param name="key">key (unique indentifier)</param>  
        /// <param name="value">value to store in cookie object</param>  
        /// <param name="expireTime">expiration time</param>  
        public void SetCookies(string key, string value, int? expireTime)
        {
            CookieOptions option = new CookieOptions();
            if (expireTime.HasValue)
                option.Expires = DateTime.Now.AddMinutes(expireTime.Value);
            else
                option.Expires = DateTime.Now.AddMilliseconds(10);
            Response.Cookies.Append(key, value, option);
        }
        /// <summary>  
        /// Get the cookie  
        /// </summary>  
        /// <param name="key">Key </param>  
        /// <returns>string value</returns>  
        public string GetCookies(string key)
        {
            return Request.Cookies[key];
        }
        // GET: CheckoutController
        public async Task<ActionResult> Index(IFormCollection collection)
        {
            dynamic mymodel = new ExpandoObject();

            var amountConfig = Convert.ToInt32(configuration.GetSection("AmountConfiguration:Contribution").Value);
            //---members id for the payment
            string[] selectedMembers = collection["hfMembersSelected"].ToString().Split(",").ToArray();
            HttpContext.Session.SetString("MembersSelected", collection["hfMembersSelected"].ToString());
            SetCookies("hfMembersSelected", collection["hfMembersSelected"].ToString(), 30);

            //---members id/list who is expired
            //-----get data from the order transactions to check the member who's payment is paid
            // for the expired member and for whom's pending.
            var expiredMembersList = _membersRegistrationRepository.getExpiredMembersList(selectedMembers);

            var expMembersCode = string.Join(",", expiredMembersList.Select(x => x.MemberCode));
            string[] expMembersCode1 = expMembersCode.ToString().Split(",").ToArray();

            HttpContext.Session.SetString("MembersExpired", expMembersCode);
            SetCookies("MembersExpired", expMembersCode, 30);
            ContributionTransactions contributionTransaction = new ContributionTransactions();

            var alreadyPaidMembers = await _contributionTransactionRepository.GetPaidMembersList(selectedMembers.ToList(), expMembersCode1.ToList());
            string[] alreadyPaidMemArray = string.Join(",", alreadyPaidMembers.Select(x => x.MemberCode)).Split(",").Distinct().ToArray();
            SetCookies("alreadyPaidMemArray", string.Join(",", alreadyPaidMembers.Select(x => x.MemberCode)), 30);
            //string[] alreadyPaidExMemArray = string.Join(",", alreadyPaidMembers.Select(x => x.ExMemberCode)).Split(",").Distinct().ToArray();            
            SetCookies("alreadyPaidExMemArray", string.Join(",", alreadyPaidMembers.Select(x => x.ExMemberCode)), 30);
            ViewBag.AllPaidMember = (selectedMembers.Length == alreadyPaidMemArray.Length && selectedMembers.Length == expiredMembersList.Count() 
                && selectedMembers.Intersect(alreadyPaidMemArray).Count() == selectedMembers.Length);
            
            if (ViewBag.AllPaidMember)
            {
                mymodel.MembersRegistration = expiredMembersList;
                mymodel.ContributionTransaction = contributionTransaction;
                mymodel.AlreadyPaidMembers = alreadyPaidMembers;
                return View(mymodel);
            }

            //------------------------------
            int totalContribution = amountConfig * selectedMembers.Length * expMembersCode1.Length;
            if (alreadyPaidMembers.Count > 0)
                totalContribution -= (amountConfig * alreadyPaidMembers.Count);

            HttpContext.Session.SetString("TotalContribution", totalContribution.ToString());
            SetCookies("TotalContribution", totalContribution.ToString(), 30);
            Random rnd = new Random();
            string OrderId = rnd.Next(99999) + "_" + collection["hfMembersSelected"].ToString().Replace(",", "|") + "_" + expMembersCode.ToString().Replace(",", "|");
            HttpContext.Session.SetString("OrderId", OrderId);
            SetCookies("OrderId", OrderId, 30);

            //contributionTransaction.MemberCode

            mymodel.MembersRegistration = expiredMembersList;
            mymodel.ContributionTransaction = contributionTransaction;
            mymodel.AlreadyPaidMembers = alreadyPaidMembers;

            //string txnTokenResponse = PaytmTransaction(collection["hfMembersSelected"].ToString(), expMembersCode, totalContribution.ToString(), OrderId);
            //PayTmReqiestRootModel myDeserializedClass = JsonConvert.DeserializeObject<PayTmReqiestRootModel>(txnTokenResponse);
            //string txtToken = myDeserializedClass.body.txnToken;
            //HttpContext.Session.SetString("txtToken", txtToken);
            //SetCookies("txtToken", txtToken, 30);
            return View(mymodel);
        }
        public string PaytmTransaction(string MembersSelected, string MembersExpired, string TotalContribution, string OrderId)
        {
            Dictionary<string, object> body = new Dictionary<string, object>();
            Dictionary<string, string> head = new Dictionary<string, string>();
            Dictionary<string, object> requestBody = new Dictionary<string, object>();

            var Mid = configuration.GetSection("PaymentGY:MID").Value;
            var MKey = configuration.GetSection("PaymentGY:MKey").Value;
            var MWebsite = configuration.GetSection("PaymentGY:Website").Value;
            var PaymentCapbackUrl = configuration.GetSection("PaymentGY:CallbackUrl").Value;

            Dictionary<string, string> txnAmount = new Dictionary<string, string>();
            txnAmount.Add("value", TotalContribution);
            txnAmount.Add("currency", "INR");
            Dictionary<string, string> userInfo = new Dictionary<string, string>();

            userInfo.Add("MembersSelected", MembersSelected);
            userInfo.Add("MembersExpired", MembersExpired);
            userInfo.Add("custId", "cust_001");

            body.Add("requestType", "Payment");
            body.Add("mid", Mid);
            body.Add("websiteName", MWebsite);
            body.Add("orderId", OrderId);
            body.Add("txnAmount", TotalContribution);
            body.Add("userInfo", userInfo);
            body.Add("callbackUrl", PaymentCapbackUrl);
            string checksumInput = JsonConvert.SerializeObject(body);
            HttpContext.Session.SetString("paytmChecksum", checksumInput);
            SetCookies("paytmChecksum", checksumInput, 30);
            /*
            * Generate checksum by parameters we have in body
            * Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys 
            */
            string paytmChecksum = Checksum.generateSignature(JsonConvert.SerializeObject(body), MKey);
            //bool verifyChecksum = Checksum.verifySignature(JsonConvert.SerializeObject(body), MKey, paytmChecksum);

            head.Add("signature", paytmChecksum);

            requestBody.Add("body", body);
            requestBody.Add("head", head);

            string post_data = JsonConvert.SerializeObject(requestBody);

            //For  Staging
            string url = "https://securegw-stage.paytm.in/theia/api/v1/initiateTransaction?mid=" + Mid + "&orderId=" + OrderId;

            //For  Production 
            //string  url  =  "https://securegw.paytm.in/theia/api/v1/initiateTransaction?mid=YOUR_MID_HERE&orderId=ORDERID_98765";

            HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(url);

            webRequest.Method = "POST";
            webRequest.ContentType = "application/json";
            webRequest.ContentLength = post_data.Length;

            using (StreamWriter requestWriter = new StreamWriter(webRequest.GetRequestStream()))
            {
                requestWriter.Write(post_data);
            }

            string responseData = string.Empty;

            using (StreamReader responseReader = new StreamReader(webRequest.GetResponse().GetResponseStream()))
            {
                responseData = responseReader.ReadToEnd();
            }

            return responseData;
        }
        public string Transaction()
        {
            Dictionary<string, object> body = new Dictionary<string, object>();
            Dictionary<string, string> head = new Dictionary<string, string>();
            Dictionary<string, object> requestBody = new Dictionary<string, object>();
            Dictionary<string, string> txnAmount = new Dictionary<string, string>();
            Dictionary<string, string> userInfo = new Dictionary<string, string>();

            var orderId = HttpContext.Session.GetString("OrderId");
            var MembersSelected = HttpContext.Session.GetString("MembersSelected");
            var MembersExpired = HttpContext.Session.GetString("MembersExpired");
            var TotalContribution = HttpContext.Session.GetString("TotalContribution");

            var Mid = configuration.GetSection("PaymentGY:MID").Value;
            var MKey = configuration.GetSection("PaymentGY:MKey").Value;
            var MWebsite = configuration.GetSection("PaymentGY:Website").Value;
            var PaymentCapbackUrl = configuration.GetSection("PaymentGY:CallbackUrl").Value;

            userInfo.Add("MembersSelected", MembersSelected);
            userInfo.Add("MembersExpired", MembersExpired);

            txnAmount.Add("value", TotalContribution);
            txnAmount.Add("currency", "INR");

            body.Add("vpa", "7777777777@paytm");

            body.Add("requestType", "Payment");
            body.Add("mid", Mid);
            body.Add("websiteName", MWebsite);
            body.Add("orderId", orderId);
            body.Add("txnAmount", TotalContribution);
            body.Add("userInfo", userInfo);
            body.Add("callbackUrl", PaymentCapbackUrl);

            /*
            * Generate checksum by parameters we have in body
            * Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys 
            */
            string paytmChecksum = Checksum.generateSignature(JsonConvert.SerializeObject(body), MKey);

            head.Add("signature", paytmChecksum);

            requestBody.Add("body", body);
            requestBody.Add("head", head);

            string post_data = JsonConvert.SerializeObject(requestBody);

            //For  Staging
            string url = "https://securegw-stage.paytm.in/theia/api/v1/initiateTransaction?mid=" + Mid + "&orderId=" + orderId;

            //For  Production 
            //string  url  =  "https://securegw.paytm.in/theia/api/v1/initiateTransaction?mid=YOUR_MID_HERE&orderId=ORDERID_98765";

            HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(url);

            webRequest.Method = "POST";
            webRequest.ContentType = "application/json";
            webRequest.ContentLength = post_data.Length;

            using (StreamWriter requestWriter = new StreamWriter(webRequest.GetRequestStream()))
            {
                requestWriter.Write(post_data);
            }
            ViewBag.webRequest = webRequest;
            string responseData = string.Empty;

            using (StreamReader responseReader = new StreamReader(webRequest.GetResponse().GetResponseStream()))
            {
                responseData = responseReader.ReadToEnd();
                //Console.WriteLine(responseData);
            }
            ViewBag.txnToken = "123";
            ViewBag.tokenResponse = responseData;

            //return RedirectToAction("PaymentResponse");
            return responseData;
        }

        public IActionResult UPIPayment(string OrderId, string txnToken, string OrderAmount)
        {
            UPIPaymentModel uPIPaymentModel = new UPIPaymentModel();
            uPIPaymentModel.Mid = configuration.GetSection("PaymentGY:MID").Value;
            uPIPaymentModel.orderId = "PO93478_2_24";
            uPIPaymentModel.txnToken = "";
            uPIPaymentModel.payerAccount = "";
            return View();
        }

        public async Task<IActionResult> OfflinePayment()
        {
            MembersContribution membersContribution = new MembersContribution();

            var MembersSelected = GetCookies("hfMembersSelected");
            var MembersExpired = GetCookies("MembersExpired");
            var alreadyPaidMem = GetCookies("alreadyPaidMemArray");
            string[] alreadyPaidMemArray = string.Join(",", alreadyPaidMem).Split(",").Distinct().ToArray();
            var alreadyPaidExMem = GetCookies("alreadyPaidExMemArray");
            string[] alreadyPaidExMemArray = string.Join(",", alreadyPaidExMem).Split(",").Distinct().ToArray();
            membersContribution.MemberCode = MembersSelected;
            membersContribution.ExMemberCode = MembersExpired;
            Random rnd = new Random();
            //string OrderId = rnd.Next(99999) + "_" + MembersSelected.Replace(",", "|") + "_" + MembersExpired.Replace(",", "|");
            membersContribution.OrderId =  GetCookies("OrderId");
            membersContribution.PaymentMode = "Offline";
            membersContribution.PaymentBy = User.Identity.Name != null ? Convert.ToInt32(User.Identity.GetId()) : 0;
            membersContribution.IsPaid = true;
            membersContribution.IsActive = true;
            int perMemberContribution = Convert.ToInt32(configuration.GetSection("AmountConfiguration:Contribution").Value);

            var contrOrderCreate = await _contributionTransactionRepository.InsertMembersContribution(membersContribution, perMemberContribution, alreadyPaidMemArray, alreadyPaidExMemArray);

            return TransactionSuccess(membersContribution);
        }

        public async Task<IActionResult> PaymentResponse(ContributionTransactionsModel response)
        {
            //-----reponse come from payment gateway here------. 

            //---STEP 1 - Extract checksum from response  
            Dictionary<string, string> userInfo = new Dictionary<string, string>();
            MembersContribution membersContribution = new MembersContribution();
            dynamic transactionModels = new ExpandoObject();

            var MembersSelected = GetCookies("hfMembersSelected");
            var MembersExpired = GetCookies("MembersExpired");

            var checksumHash = response.CHECKSUMHASH;
            var Mid = configuration.GetSection("PaymentGY:MID").Value;
            var MKey = configuration.GetSection("PaymentGY:MKey").Value;
            var MWebsite = configuration.GetSection("PaymentGY:Website").Value;
            var PaymentCapbackUrl = configuration.GetSection("PaymentGY:CallbackUrl").Value;
            var input = GetCookies("paytmChecksum");
            //---------------------------------------
            Dictionary<string, object> body = new Dictionary<string, object>();
            body.Add("requestType", "Payment");
            body.Add("mid", Mid);
            body.Add("websiteName", MWebsite);
            body.Add("orderId", response.ORDERID);
            body.Add("txnAmount", response.TXNAMOUNT);
            body.Add("userInfo", userInfo);
            body.Add("callbackUrl", PaymentCapbackUrl);
            //---------------------------------------
            bool paytmChecksum = Checksum.verifySignature(JsonConvert.SerializeObject(body), MKey, checksumHash);

            //----decode the checksumhash and get the user details.

            membersContribution.MemberCode = MembersSelected;
            membersContribution.ExMemberCode = MembersExpired;
            membersContribution.OrderId = response.ORDERID;
            membersContribution.OrderAmount = Convert.ToDecimal(response.TXNAMOUNT);
            membersContribution.PaymentBy = Convert.ToInt32(User.Identity.GetId());
            membersContribution.PaymentMode = response.PAYMENTMODE;
            membersContribution.CreatedOn = DateTime.UtcNow;
            membersContribution.CreatedBy = User.Identity.GetId();

            //var userDetails = null; //get details from checksum
            //---STEP 2 - insert into table MembersContribution
            var alreadyPaidMem = GetCookies("alreadyPaidMemArray");
            string[] alreadyPaidMemArray = string.Join(",", alreadyPaidMem).Split(",").ToArray();
            var alreadyPaidExMem = GetCookies("alreadyPaidExMemArray");
            string[] alreadyPaidExMemArray = string.Join(",", alreadyPaidExMem).Split(",").ToArray();
            int perMemberContribution = Convert.ToInt32(configuration.GetSection("AmountConfiguration:Contribution").Value);
            var contrOrderCreate = await _contributionTransactionRepository.InsertMembersContribution(membersContribution, perMemberContribution, alreadyPaidMemArray, alreadyPaidExMemArray);
            //---STEP 3 - insert into table ContributiinTransaction
            //-----firs insert into registration transaction
            var contributionTransactions = _mapper.Map<ContributionTransactionsModel, ContributionTransactions>(response);
            contributionTransactions.MemberCode = MembersSelected;
            contributionTransactions.ExMemberCode = MembersExpired;
            contributionTransactions.PaymentBy = Convert.ToInt32(User.Identity.GetId());
            var contributionTransaction = await _contributionTransactionRepository.InsertContributionTransaction(contributionTransactions);
            //----If is success response then update the response in transaction
            //----table and IsPaid to true in member regaistration table.

            //if (response.STATUS == "TXN_SUCCESS" && paytmChecksum)
            if (response.STATUS == "TXN_SUCCESS")
            {
                membersContribution.IsPaid = true;
                await _contributionTransactionRepository.UpdateMembersContribution(membersContribution);
                await _contributionTransactionRepository.UpdateContributionTransaction(contributionTransactions);
                return TransactionSuccess(contributionTransaction);
            }
            else
            {
                membersContribution.IsPaid = false;
                return TransactionFailed(contributionTransaction);
            }
        }
        public ActionResult TransactionSuccess(MembersContribution membersContribution)
        {
            return View("TransactionSuccess", membersContribution);
        }
        public ActionResult TransactionSuccess(ContributionTransactions contributionTransaction)
        {
            return View("TransactionSuccess", contributionTransaction);
        }
        public ActionResult TransactionFailed(ContributionTransactions contributionTransaction)
        {
            return View("TransactionFailed", contributionTransaction);

        }



        public IActionResult PaymentPage()
        {
            //var html = ViewBag.outputHtml;
            return RedirectToAction("PaymentResponse");
        }
        public ActionResult Transaction1()
        {
            string orderid = "D" + DateTime.Now.Ticks.ToString();
            Dictionary<String, String> paytmParams = new Dictionary<String, String>();
            Dictionary<string, object> body = new Dictionary<string, object>();
            /* Find your MID in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys */
            paytmParams.Add("MID", "Your Merchant Id");
            /* Find your WEBSITE in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys */
            paytmParams.Add("WEBSITE", "net4u");
            /* Find your INDUSTRY_TYPE_ID in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys */
            paytmParams.Add("INDUSTRY_TYPE_ID", "Retail");
            /* WEB for website and WAP for Mobile-websites or App */
            paytmParams.Add("CHANNEL_ID", "WEB");
            /* Enter your unique order id */
            paytmParams.Add("ORDER_ID", orderid);
            /* unique id that belongs to your customer */
            paytmParams.Add("CUST_ID", "455451");
            /* customer's mobile number */
            paytmParams.Add("MOBILE_NO", "Your Mobile No");
            /* customer's email */
            paytmParams.Add("EMAIL", "Your Email Id");
            /**
            * Amount in INR that is payble by customer
            * this should be numeric with optionally having two decimal points
*/
            paytmParams.Add("TXN_AMOUNT", "Amount");
            /* on completion of transaction, we will send you the response on this URL */
            paytmParams.Add("CALLBACK_URL", "Your CallBack URL");
            /**
            * Generate checksum for parameters we have
            * You can get Checksum DLL from https://developer.paytm.com/docs/checksum/
            * Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys 
*/
            //String checksum = paytm.CheckSum.generateCheckSum("Your Merchant Key", paytmParams);
            string checksum = Checksum.generateSignature(JsonConvert.SerializeObject(paytmParams), configuration.GetSection("PaymentGY:MKey").Value);

            /* for Staging */
            String url = "https://securegw-stage.paytm.in/order/process";
            /* for Production */
            // String url = "https://securegw.paytm.in/order/process";
            /* Prepare HTML Form and Submit to Paytm */
            String outputHtml = "";
            outputHtml += "<html>";
            outputHtml += "<head>";
            outputHtml += "<title>Merchant Checkout Page</title>";
            outputHtml += "</head>";
            outputHtml += "<body>";
            outputHtml += "<center><h1>Please do not refresh this page...</h1></center>";
            outputHtml += "<form method='post' action='" + url + "' name='paytm_form'>";
            foreach (string key in paytmParams.Keys)
            {
                outputHtml += "<input type='hidden' name='" + key + "' value='" + paytmParams[key] + "'>";
            }
            outputHtml += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
            outputHtml += "</form>";
            outputHtml += "<script type='text/javascript'>";
            outputHtml += "document.paytm_form.submit();";
            outputHtml += "</script>";
            outputHtml += "</body>";
            outputHtml += "</html>";
            //Response.WriteAsync(outputHtml.ToString());

            ViewBag.outputHtml = outputHtml;

            return View("PaymentPage");
        }
        public ActionResult Transaction2()
        {
            string orderid = "D" + DateTime.Now.Ticks.ToString();
            Dictionary<String, String> paytmParams = new Dictionary<String, String>();
            Dictionary<string, object> body = new Dictionary<string, object>();
            /* Find your MID in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys */
            paytmParams.Add("MID", "Your Merchant Id");
            /* Find your WEBSITE in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys */
            paytmParams.Add("WEBSITE", "net4u");
            /* Find your INDUSTRY_TYPE_ID in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys */
            paytmParams.Add("INDUSTRY_TYPE_ID", "Retail");
            /* WEB for website and WAP for Mobile-websites or App */
            paytmParams.Add("CHANNEL_ID", "WEB");
            /* Enter your unique order id */
            paytmParams.Add("ORDER_ID", orderid);
            /* unique id that belongs to your customer */
            paytmParams.Add("CUST_ID", "455451");
            /* customer's mobile number */
            paytmParams.Add("MOBILE_NO", "Your Mobile No");
            /* customer's email */
            paytmParams.Add("EMAIL", "Your Email Id");
            /**
            * Amount in INR that is payble by customer
            * this should be numeric with optionally having two decimal points
*/
            paytmParams.Add("TXN_AMOUNT", "Amount");
            /* on completion of transaction, we will send you the response on this URL */
            paytmParams.Add("CALLBACK_URL", "Your CallBack URL");
            /**
            * Generate checksum for parameters we have
            * You can get Checksum DLL from https://developer.paytm.com/docs/checksum/
            * Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys 
*/
            //String checksum = paytm.CheckSum.generateCheckSum("Your Merchant Key", paytmParams);
            string checksum = Checksum.generateSignature(JsonConvert.SerializeObject(paytmParams), configuration.GetSection("PaymentGY:MKey").Value);

            /* for Staging */
            String url = "https://securegw-stage.paytm.in/order/process";
            /* for Production */
            // String url = "https://securegw.paytm.in/order/process";
            /* Prepare HTML Form and Submit to Paytm */
            //String outputHtml = "";
            //outputHtml += "<html>";
            //outputHtml += "<head>";
            //outputHtml += "<title>Merchant Checkout Page</title>";
            //outputHtml += "</head>";
            //outputHtml += "<body>";
            //outputHtml += "<center><h1>Please do not refresh this page...</h1></center>";
            //outputHtml += "<form method='post' action='" + url + "' name='paytm_form'>";
            //foreach (string key in paytmParams.Keys)
            //{
            //    outputHtml += "<input type='hidden' name='" + key + "' value='" + paytmParams[key] + "'>";
            //}
            //outputHtml += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
            //outputHtml += "</form>";
            //outputHtml += "<script type='text/javascript'>";
            //outputHtml += "document.paytm_form.submit();";
            //outputHtml += "</script>";
            //outputHtml += "</body>";
            //outputHtml += "</html>";
            //Response.WriteAsync(outputHtml.ToString());
            return View();
        }


    }
}
