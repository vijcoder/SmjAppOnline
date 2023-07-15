using AutoMapper;
using Domains.Models;
using Domains.Repository;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SmjApp.Utility;
using SmjApp.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using SmjApp.Extensions;
using Infrastructure.Repository;
using Microsoft.Extensions.Configuration;
using System.Net;
using Newtonsoft.Json;
using Paytm;
using Microsoft.AspNetCore.Http;
using System.Dynamic;
using Microsoft.AspNetCore.Authorization;
using SmjApp.Infrastructure.Filters;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace SmjApp.Controllers
{ 
   // [CustomAuthorizationFilterAttribute]
    public class MembersController : Controller
    {
        private readonly IMembersRegistrationRepository _membersRegistrationRepository;
        private readonly IRegistrationTransactionRepository _registrationTransactionRepository;
        private readonly IWebHostEnvironment _environment;
        private readonly IMapper _mapper;
        private readonly IConfiguration configuration;
        private readonly IUsersRepository usersRepository;
        public MembersController(IMembersRegistrationRepository membersRegistrationRepository, IWebHostEnvironment _environment,
            IMapper mapper, IConfiguration configuration, IRegistrationTransactionRepository registrationTransactionRepository
            , IUsersRepository usersRepository)
        {
            this._membersRegistrationRepository = membersRegistrationRepository;
            this._environment = _environment;
            this._mapper = mapper;
            this.configuration = configuration;
            this._registrationTransactionRepository = registrationTransactionRepository;
            this.usersRepository = usersRepository;
        }

        //public IActionResult Index(string sortOrder)
        //{
        //    ViewData["NameSortParm"] = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
        //    ViewData["DateSortParm"] = sortOrder == "Date" ? "date_desc" : "Date";
        //    var students = from s in _membersRegistrationRepository.getAllMembers()
        //                   select s;
        //    switch (sortOrder)
        //    {
        //        case "name_desc":
        //            students = students.OrderByDescending(s => s.MemberName);
        //            break;
        //        //case "Date":
        //        //    students = students.OrderBy(s => s.EnrollmentDate);
        //        //    break;
        //        //case "date_desc":
        //        //    students = students.OrderByDescending(s => s.EnrollmentDate);
        //        //    break;
        //        default:
        //            students = students.OrderBy(s => s.MemberCode);
        //            break;
        //    }
        //    return View(students.ToList());
        //}
        public async Task<IActionResult> Index()
        {
            // Initialization.  
            MultiSelectMembersList model = new MultiSelectMembersList { SelectedMultiMembersId = new List<int>(), SelectedMembersLst = new List<MembersObj>() };
            ViewBag.MembersSelectList = GetSelectMembersList();
            var LoggedInUserId = User.Identity.GetId();
            var userMambersMapping = await usersRepository.GetUsersMemberMapping(Convert.ToInt32(LoggedInUserId));
            ViewBag.IsMappingAvailable = userMambersMapping.Count > 0 ? false : true;
            return View(model);
        }
        [HttpPost]
        public async Task<IActionResult> UserMemberMapping(string memberId)
        {

            UserMembersMapping obj = new UserMembersMapping();
            obj.UserId = Convert.ToInt32(User.Identity.GetId());
            obj.MemberCode = Convert.ToInt32(memberId);
            var result = await usersRepository.InserMapping(obj);            
            return Ok(result);
            //var result = usersRepository.InserMapping()
        }

        #region Get country method.  


        /// <summary>  
        /// Get country method.  
        /// </summary>  
        /// <returns>Return country for drop down list.</returns>  
        private string[] GetSelectMembersList()
        {
            // Initialization.  
            SelectList lstobj = null;
            List<string> listArray = new List<string>();
            try
            {
                // Loading.  
                var list = _membersRegistrationRepository.getAllMembers().Where(a => a.IsActive && a.IsPaid && a.IsApproved)
                                  .Select(p =>
                                            new SelectListItem
                                            {
                                                Value = p.MemberCode.ToString(),
                                                Text = (p.Initials + " " + p.Fullname)
                                            });

                // Setting.  
                lstobj = new SelectList(list, "Value", "Text");
                
                foreach(var l in lstobj)
                {
                    listArray.Add(l.Value + "-" + l.Text);
                }
            }
            catch (Exception ex)
            {
                // Info  
                throw ex;
            }

            // info.  
            return listArray.ToArray();
        }

        #endregion
        public async Task<IActionResult> LoadData()
        {
            try
            {
                var draw = HttpContext.Request.Form["draw"].FirstOrDefault();

                // Skip number of Rows count  
                var start = Request.Form["start"].FirstOrDefault();

                // Paging Length 10,20  
                var length = Request.Form["length"].FirstOrDefault();

                // Sort Column Name  
                var sortColumn = Request.Form["columns[" + Request.Form["order[0][column]"].FirstOrDefault() + "][name]"].FirstOrDefault();

                // Sort Column Direction (asc, desc)  
                var sortColumnDirection = Request.Form["order[0][dir]"].FirstOrDefault();

                // Search Value from (Search box)  
                var searchValue = Request.Form["search[value]"].FirstOrDefault();

                //Paging Size (10, 20, 50,100)  
                int pageSize = length != null ? Convert.ToInt32(length) : 0;

                int skip = start != null ? Convert.ToInt32(start) : 0;

                int recordsTotal = 0;

                var LoggedInUserId = User.Identity.GetId();
                var userMambersMapping = await usersRepository.GetUsersMemberMapping(Convert.ToInt32(LoggedInUserId));
                // getting all Customer data  
                var customerData = (from tempcustomer in _membersRegistrationRepository.getAllMembers().ToList()
                                    join u in userMambersMapping
                                    on tempcustomer.MemberCode equals u.MemberCode
                                    where !tempcustomer.IsExpired
                                    select tempcustomer);
                //Sorting  
                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDirection)))
                {
                    var propertyInfo = typeof(MembersRegistration).GetProperty(sortColumn);
                    //check sort order 
                    if (sortColumnDirection == "desc")
                    {
                        customerData = customerData.OrderByDescending(c => propertyInfo.GetValue(c, null)).AsQueryable();
                    }
                    else
                    {
                        customerData = customerData.OrderBy(c => propertyInfo.GetValue(c, null)).AsQueryable();
                    }
                }
                //Search  
                if (!string.IsNullOrEmpty(searchValue))
                {
                    customerData = customerData.Where(s => s.MemberCode.ToString().Contains(searchValue)
                                       || s.Initials.ToString().ToLower().Contains(searchValue)
                                       || s.Fullname.ToString().ToLower().Contains(searchValue)
                                       || s.Villagename.ToString().ToLower().Contains(searchValue)
                                       || s.MobileNo.ToString().ToLower().Contains(searchValue)
                                       || s.EmailId.ToString().ToLower().Contains(searchValue));
                }

                //total number of rows counts   
                recordsTotal = customerData.Count();
                //Paging   
                var data = customerData.Skip(skip).Take(pageSize).ToList();
                //Returning Json Data  
                return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = data });

            }
            catch (Exception)
            {
                throw;
            }

        }
         
        private string ProfileUploadedFile(MembersRegistrationModel model)
        {
            string uniqueFileName = null;
            string path = Path.Combine(_environment.WebRootPath, "ProfileUploads");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            if (model.ProfilePicture != null)
            {
                string uploadsFolder = Path.Combine(_environment.WebRootPath, "ProfileUploads");
                uniqueFileName = Guid.NewGuid().ToString() + "_" + model.ProfilePicture.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    model.ProfilePicture.CopyTo(fileStream);
                }
            }

            return uniqueFileName;
        }
        private string AgeProofUploadedFile(MembersRegistrationModel model)
        {
            string uniqueFileName = null;
            string path = Path.Combine(_environment.WebRootPath, "AgeProofUploads");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            if (model.AgeProofPicture != null)
            {
                string uploadsFolder = Path.Combine(_environment.WebRootPath, "AgeProofUploads");
                uniqueFileName = Guid.NewGuid().ToString() + "_" + model.AgeProofPicture.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    model.AgeProofPicture.CopyTo(fileStream);
                }
            }

            return uniqueFileName;
        }

        // GET: Students/Create
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(MembersRegistrationModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string profileImageName = ProfileUploadedFile(model);
                    string ageProofImageName = AgeProofUploadedFile(model);
                    model.Age = Common.get_age(model.DOB);
                    int RegistrationAmount = Convert.ToInt32(configuration.GetSection("AmountConfiguration:RegistrationAmount").Value);
                    int SeniorRegistrationAmount = Convert.ToInt32(configuration.GetSection("AmountConfiguration:SeniorRegistrationAmount").Value);
                    model.Amount = model.Age >= 70 ? SeniorRegistrationAmount : RegistrationAmount;
                    model.MemberCode = await _membersRegistrationRepository.GetMaxMemberCode();
                    model.IsActive = true;
                    model.CreatedOn = DateTime.UtcNow;
                    model.ProfileImage = profileImageName;
                    model.AgeProofImage = ageProofImageName;
                    model.CreatedBy = User.Identity.GetId();
                    var membersRegistration = _mapper.Map<MembersRegistrationModel, MembersRegistration>(model); // Map dto to op object
                    membersRegistration = await _membersRegistrationRepository.CreateMemberAsync(membersRegistration);
                    if (membersRegistration != null)
                    {
                        Random rnd = new Random();
                        string orderId = $"{membersRegistration.Id}-{membersRegistration.MemberCode}-{rnd.Next(99999)}";
                        HttpContext.Session.SetString("MR_Amount", membersRegistration.Amount.ToString());
                        HttpContext.Session.SetString("MR_OrderId", orderId);
                        HttpContext.Session.SetObjectAsJson("RegistrationPaymentModel", membersRegistration);
                        //return RegistrationPayment(model);
                        return RedirectToAction("RegistrationPayment");
                    }
                    else
                        ModelState.AddModelError("", "Error occured while registering new memebr. Please try again.");
                    return View(model);
                }
            }
            catch (Exception ex)
            {
                //Log the error (uncomment ex variable name and write a log.
                ModelState.AddModelError("", "Unable to save changes. " +
                    "Try again, and if the problem persists " +
                    "see your system administrator.");
            }
            return View(model);
        }
        //-----belo method used for offline payment----------------
        public IActionResult RegistrationPayment()
        {
            var membersRegistration = HttpContext.Session.GetObjectFromJson<MembersRegistration>("RegistrationPaymentModel");
            ViewBag.ModelData= _mapper.Map<MembersRegistration, MembersRegistrationModel>(membersRegistration);
            return View("RegistrationPayment");
        }
        [HttpPost]
        public async Task<IActionResult> OfflinePayment(IFormCollection formCollection)
        {
            RegTransactionOffline registrationTransactions = new RegTransactionOffline();
            registrationTransactions.MemberCode = Convert.ToInt32(formCollection["memberCode"]);
            registrationTransactions.OrderId = formCollection["orderId"];
            registrationTransactions.Amount = Convert.ToDecimal(formCollection["TotalContributionAmount"]);
            registrationTransactions.IsPaid = true;
            registrationTransactions.PaymentBy = User.Identity.GetId();
            registrationTransactions.CreatedOn = DateTime.UtcNow;
            var regTransactions = await _registrationTransactionRepository.InsertOfflineRegPayment(registrationTransactions);

            return View("RegistrationPaymentSuccess");
        }

        //----bakc up below comment for online transaction-----------
        public IActionResult RegistrationPaymentOnline(MembersRegistrationModel model)
        {
            var resultModel = HttpContext.Session.GetObjectFromJson<MembersRegistration>("RegistrationPaymentModel");
            string txnTokenResponse = PaytmTransaction(model);
            PayTmReqiestRootModel myDeserializedClass = JsonConvert.DeserializeObject<PayTmReqiestRootModel>(txnTokenResponse);
            string txtToken = myDeserializedClass.body.txnToken;
            
            string newTxnToken = VPATransaction(txtToken, model);
            PayTmReqiestRootModel myDeserializedClass2 = JsonConvert.DeserializeObject<PayTmReqiestRootModel>(newTxnToken);
            string txtToken2 = myDeserializedClass2.body.txnToken;

            HttpContext.Session.SetString("txtToken", txtToken);
            SetCookies("txtToken", txtToken, 30);
            ViewBag.ModelData = model;
            return View("RegistrationPayment");
        }

     
        public string PaytmTransaction(MembersRegistrationModel model)
        {
            //---upi integration step
            //https://business.paytm.com/docs/v1/custom-checkout/upi/
            Random rnd = new Random();
            string orderId = $"{model.Id}-{model.MemberCode}-{rnd.Next(99999)}";
            HttpContext.Session.SetString("OrderId", orderId);
            int memberId = model.MemberCode;
            HttpContext.Session.SetString("NewMemeberCode", memberId.ToString());

            Dictionary<string, object> body = new Dictionary<string, object>();
            Dictionary<string, string> head = new Dictionary<string, string>();
            Dictionary<string, object> requestBody = new Dictionary<string, object>();
            Dictionary<string, string> txnAmount = new Dictionary<string, string>();
            Dictionary<string, string> userInfo = new Dictionary<string, string>();
            var Mid = configuration.GetSection("PaymentGY:MID").Value;
            var MKey = configuration.GetSection("PaymentGY:MKey").Value;
            var MWebsite = configuration.GetSection("PaymentGY:Website").Value;
            var PaymentCallbackUrlRegistration = configuration.GetSection("PaymentGY:CallbackUrlRegistration").Value;

            userInfo.Add("MemberId", memberId.ToString());
            userInfo.Add("MobileNo", model.MobileNo);
            userInfo.Add("EmailId", model.EmailId);
            userInfo.Add("Villagename", model.Villagename);
            userInfo.Add("custId", memberId.ToString()); //----new member id or user id who logged in.

            txnAmount.Add("value", model.Amount.ToString());
            txnAmount.Add("currency", "INR");

            body.Add("vpa", "7777777777@paytm");

            body.Add("requestType", "Payment");
            body.Add("mid", Mid);
            body.Add("websiteName", MWebsite);
            body.Add("orderId", orderId);
            body.Add("txnAmount", model.Amount.ToString());
            body.Add("userInfo", userInfo);
            body.Add("callbackUrl", PaymentCallbackUrlRegistration);

            /*
            * Generate checksum by parameters we have in body
            * Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys 
            */
            string paytmChecksum = Checksum.generateSignature(JsonConvert.SerializeObject(body), MKey);

            HttpContext.Session.SetString("paytmChecksum", paytmChecksum);

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
            }

            return responseData;

        }

        public string VPATransaction(string txtToken, MembersRegistrationModel model)
        {
            Dictionary<string, string> body = new Dictionary<string, string>();
            Dictionary<string, string> head = new Dictionary<string, string>();
            Dictionary<string, Dictionary<string, string>> requestBody = new Dictionary<string, Dictionary<string, string>>();
            var Mid = configuration.GetSection("PaymentGY:MID").Value;
            var orderId = HttpContext.Session.GetString("OrderId");

            body.Add("vpa", "7777777777@paytm");

            head.Add("tokenType", "TXN_TOKEN");
            head.Add("token", txtToken);


            requestBody.Add("body", body);
            requestBody.Add("head", head);

            string post_data = JsonConvert.SerializeObject(requestBody);

            //For  Staging
            string url = "https://securegw-stage.paytm.in/theia/api/v1/vpa/validate?mid=" + Mid + "&orderId=" + orderId;

            //For  Production 
            //string  url  =  "https://securegw.paytm.in/theia/api/v1/vpa/validate?mid=YOUR_MID_HERE&orderId=ORDERID_98765";

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
                //Console.WriteLine(responseData);
            }
            return responseData;

        }

        public async Task<IActionResult> PaymentResponse(RegistrationTransactionsModel response)
        {
            //-----reponse come from payment gateway here------. 

            //---STEP 1 - Extract checksum from response  
            Dictionary<string, string> userInfo = new Dictionary<string, string>();
            MembersContribution membersContribution = new MembersContribution();
            dynamic transactionModels = new ExpandoObject();

            var checksumHash = response.CHECKSUMHASH;
            var Mid = configuration.GetSection("PaymentGY:MID").Value;
            var MKey = configuration.GetSection("PaymentGY:MKey").Value;
            var MWebsite = configuration.GetSection("PaymentGY:Website").Value;
            var PaymentCapbackUrl = configuration.GetSection("PaymentGY:CallbackUrl").Value;
            Dictionary<string, object> body = new Dictionary<string, object>();
            var input = HttpContext.Session.GetString("paytmChecksum");

            bool paytmChecksum = Checksum.verifySignature(input, MKey, checksumHash);

            //----decode the checksumhash and get the user details.

            response.MemberCode = HttpContext.Session.GetString("MemeberCode");
            response.PaymentBy = User.Identity.GetId(); // ogged in user id who make the payment
            response.CreatedOn = DateTime.UtcNow;

            //var userDetails = null; //get details from checksum
            //---STEP 2 - insert into table RegistrationTransactions
            var registrationTransactions = _mapper.Map<RegistrationTransactionsModel, RegistrationTransactions>(response);
            var regTransactions = await _registrationTransactionRepository.InsertRegistrationPayment(registrationTransactions);

            //if (response.STATUS == "TXN_SUCCESS" && paytmChecksum)
            if (response.STATUS.ToLower() == "txn_success")
            {
                registrationTransactions.IsPaid = true;
                await _membersRegistrationRepository.SetIsPaidAsync(Convert.ToInt32(response.MemberCode));
                await _registrationTransactionRepository.UpdateRegistrationPayment(registrationTransactions);
                return RegistrationPaymentSuccess(regTransactions);
            }
            else
            {
                membersContribution.IsPaid = false;
                return RegistrationPaymentFailed(regTransactions);
            }
        }

        public IActionResult RegistrationPaymentSuccess(RegistrationTransactions model)
        {
            return View();
        }
        public IActionResult RegistrationPaymentFailed(RegistrationTransactions model)
        {
            return View();
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
    }
}
