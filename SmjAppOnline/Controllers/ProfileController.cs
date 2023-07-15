using Domains.Models;
using Domains.Repository;
using Domains.ViewModels;
using Infrastructure.Services;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using SmjApp.Extensions;
using SmjApp.Models;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace SmjApp.Controllers
{
    public class ProfileController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IMembersRegistrationRepository _membersRegistrationRepository;
        private readonly IContributionTransactionRepository contributionTransactionRepository;
        private readonly IUsersRepository usersRepository;
        //private readonly IEmailManager emailManager;
        private readonly IConfiguration configuration;
        private readonly IWebHostEnvironment _environment;
        public ProfileController(ILogger<HomeController> logger, IMembersRegistrationRepository membersRegistrationRepository,
            IUsersRepository usersRepository, IContributionTransactionRepository contributionTransactionRepository,
             IConfiguration configuration, IWebHostEnvironment environment)
        {
            this._membersRegistrationRepository = membersRegistrationRepository;
            _logger = logger;
            this.usersRepository = usersRepository;
            this.contributionTransactionRepository = contributionTransactionRepository;
            //this.emailManager = emailManager;
            this.configuration = configuration;
            this._environment = environment;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult ChangePassword()
        {
            return View();
        }
        [HttpPost]
        public IActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {

            }
            return View();
        }
        public IActionResult ForgotPassword()
        {
            return View();
        }
        [HttpPost]
        public IActionResult ForgotPassword(string email)
        {
            if (ModelState.IsValid)
            {
                var user = usersRepository.GetUserByEmail(email);
                if(user != null)
                {
                    //----send mail with reset password code and link.
                    bool result;
                    //string from = configuration.GetSection("EmailConfig:AdminEmail").Value; 
                    //string to = user.EmailId;
                    string ResetPasswordLink = user.ResetPasswordCode;
                    string EmailTempFolder = Path.Combine(_environment.WebRootPath, "EmailTemplates"); 
                    string filePath = Path.Combine(EmailTempFolder, "ResetPassword.html");

                    string resetPassTemplate = filePath;
                    ListDictionary replacements = new ListDictionary();
                    replacements.Add("<%UserName%>", user.Name);
                    replacements.Add("<%EmailID%>", user.EmailId);
                    replacements.Add("<%ResetPasswordLink%>", ResetPasswordLink);                   

                    EmailManager.SendEmail("Reset password email.", user.EmailId, resetPassTemplate, replacements);

                }
            }
            return View();
        }
        public IActionResult ResetPassword()
        {
            return View();
        }

        public IActionResult ContributionTransactions()
        {
            return View();
        }
        public IActionResult MembersRegistrationList()
        {
            return View();
        }
        public IActionResult RegisteredUserList()
        {
            return View();
        }
        public async Task<IActionResult> LoadRegisteredMemberByUser()
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

                int UserId = Convert.ToInt32(User.Identity.GetId());
                // getting all Customer data  
                var customerData = await _membersRegistrationRepository.getMembersRegisteredByUser(UserId);

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
                                       || s.MobileNo.ToString().ToLower().Contains(searchValue)
                                       || s.EmailId.ToString().ToLower().Contains(searchValue)
                                       || s.Villagename.ToString().ToLower().Contains(searchValue));
                }

                //total number of rows counts   
                recordsTotal = customerData.Count();
                //Paging   
                var data = customerData.Skip(skip).Take(pageSize).ToList();
                //Returning Json Data  
                return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = data });

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public IActionResult LoadUsersList()
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

                // getting all Customer data  
                var customerData = (from tempcustomer in usersRepository.GetUsers().Result.Where(a => a.IsActive).ToList()
                                    select tempcustomer);
                //Sorting  
                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDirection)))
                {
                    var propertyInfo = typeof(Users).GetProperty(sortColumn);
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
                    customerData = customerData.Where(s => s.Name.ToString().Contains(searchValue)
                                       || s.MobileNo.ToString().ToLower().Contains(searchValue)
                                       || s.EmailId.ToString().ToLower().Contains(searchValue)
                                       || s.Role.ToString().ToLower().Contains(searchValue));
                }

                //total number of rows counts   
                recordsTotal = customerData.Count();
                //Paging   
                var data = customerData.Skip(skip).Take(pageSize).ToList();
                //Returning Json Data  
                return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = data });

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }


        public IActionResult UserMembersMappingList()
        {
            return View();
        }
        public IActionResult LoadUserMembersMappingList()
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
                int UserId = Convert.ToInt32(User.Identity.GetId());
                // getting all Customer data  
                var customerData = usersRepository.GetUserMembersMappingDetais().GetAwaiter().GetResult().AsEnumerable();
                //Sorting  
                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDirection)))
                {
                    var propertyInfo = typeof(UserMembersMappingDetais).GetProperty(sortColumn);
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
                    customerData = customerData.Where(s => s.Username.ToString().Contains(searchValue)
                                       || s.Membername.ToString().ToLower().Contains(searchValue)
                                       || s.UserId.ToString().ToLower().Contains(searchValue)
                                       || s.MemberCode.ToString().ToLower().Contains(searchValue));
                }

                //total number of rows counts   
                recordsTotal = customerData.Count();
                //Paging   
                var data = customerData.Skip(skip).Take(pageSize).ToList();
                //Returning Json Data  
                return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = data });

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public IActionResult LoadContributionTransactionByUser()
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
                int UserId = Convert.ToInt32(User.Identity.GetId());
                // getting all Customer data  
                var customerData = contributionTransactionRepository.GetContributionTransactionsByUser(UserId).GetAwaiter().GetResult().AsEnumerable();
                //Sorting  
                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDirection)))
                {
                    var propertyInfo = typeof(ContributionTransactions).GetProperty(sortColumn);
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
                                       || s.ExMemberCode.ToString().ToLower().Contains(searchValue)
                                       || s.PaymentBy.ToString().ToLower().Contains(searchValue)
                                       //|| s.MemberCode.ToString().ToLower().Contains(searchValue)
                                       );
                }

                //total number of rows counts   
                recordsTotal = customerData.Count();
                //Paging   
                var data = customerData.Skip(skip).Take(pageSize).ToList();
                //Returning Json Data  
                return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = data });

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public async Task<IActionResult> ApproveUserMemberMapping(int Id)
        {
            int adminUserId = Convert.ToInt32(User.Identity.GetId());
            await usersRepository.SetUserMemberMappingApproval(Id, adminUserId);
            return View("UserMembersMappingList");
        }


    }
}
