using Domains.Models;
using Domains.Repository;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using SmjApp.Extensions;
using SmjApp.Models;
using SmjApp.Utility;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace SmjApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IMembersRegistrationRepository _membersRegistrationRepository;
        private readonly IContributionTransactionRepository contributionTransactionRepository;
        private readonly IUsersRepository usersRepository;
        public HomeController(ILogger<HomeController> logger, IMembersRegistrationRepository membersRegistrationRepository,
            IUsersRepository usersRepository, IContributionTransactionRepository contributionTransactionRepository)
        {
            this._membersRegistrationRepository = membersRegistrationRepository;
            _logger = logger;
            this.usersRepository = usersRepository;
            this.contributionTransactionRepository = contributionTransactionRepository;
        }

        public IActionResult LoadData()
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
                var customerData = (from tempcustomer in _membersRegistrationRepository.getAllMembers().Where(a => a.IsPaid && a.IsApproved && a.IsActive).ToList()
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
                                       || s.CreatedOn.ToString().ToLower().Contains(searchValue)
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

        [HttpGet]
        public ViewResult Index()
        {
            return View();
        }
        [HttpGet]
        public ViewResult PaymentHistory()
        {
            return View();
        }
        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult TermsAndConditions()
        {
            return View();
        }
        public IActionResult AboutUs()
        {
            return View();
        }
        public IActionResult ContactUs()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public async Task<IActionResult> GetContributionTransaction(int memberCode)
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

                int UserId = User.Identity.Name != null ? Convert.ToInt32((User.Identity.GetId())) : 0;
                // getting all Customer data  
                var customerData = contributionTransactionRepository.GetMembersContributionByMemberCodeAsync(memberCode).Result.AsEnumerable();

                //Sorting  
                //if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDirection)))
                //{
                //    var propertyInfo = typeof(MemberContributionDetails).GetProperty(sortColumn);
                //    //check sort order 
                //    if (sortColumnDirection == "desc")
                //    {
                //        customerData = customerData.OrderByDescending(c => propertyInfo.GetValue(c, null)).AsQueryable();
                //    }
                //    else
                //    {
                //        customerData = customerData.OrderBy(c => propertyInfo.GetValue(c, null)).AsQueryable();
                //    }
                //}
                //Search  
                if (!string.IsNullOrEmpty(searchValue))
                {
                    customerData = customerData.Where(s => s.membersContribution.MemberCode.ToString().Contains(searchValue)
                                       //|| s.membersContribution.Initials.ToString().ToLower().Contains(searchValue)
                                       || s.MemberFullName.ToString().ToLower().Contains(searchValue)
                                       //|| s.membersContribution.Villagename.ToString().ToLower().Contains(searchValue)
                                       //|| s.membersContribution.MobileNo.ToString().ToLower().Contains(searchValue)
                                       || s.membersContribution.CreatedOn.ToString().ToLower().Contains(searchValue)
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


    }
}
