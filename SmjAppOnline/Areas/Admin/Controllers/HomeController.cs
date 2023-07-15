using Domains.Models;
using Domains.Repository;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmjApp.Areas.Admin.Controllers
{
    
    [Area("Admin")]
    [Authorize(Roles = "Admin")] 
    public class HomeController : Controller
    {
        private readonly IMembersRegistrationRepository _membersRegistrationRepository;
        private readonly IRegistrationTransactionRepository registrationTransactionRepository;
        public HomeController(IMembersRegistrationRepository membersRegistrationRepository,
            IRegistrationTransactionRepository registrationTransactionRepository)
        {
            this._membersRegistrationRepository = membersRegistrationRepository;
            this.registrationTransactionRepository = registrationTransactionRepository;
        }
        public IActionResult Index()
        {
            return View();
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
                var customerData = (from tempcustomer in _membersRegistrationRepository.getAllMembers().ToList()
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
    }
}
