using AutoMapper;
using Domains.Models;
using Domains.Repository;
using Domains.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SmjApp.Extensions;
using SmjApp.Utility;
using SmjApp.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace SmjApp.Areas.Admin.Controllers
{

    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class MembersController : Controller
    {
        private readonly IMembersRegistrationRepository _membersRegistrationRepository;
        private readonly IRegistrationTransactionRepository registrationTransactionRepository;
        private readonly IContributionTransactionRepository contributionTransactionRepository;
        private readonly IMapper _mapper; private readonly IWebHostEnvironment _environment;
        //private readonly IContributionTransactionRepository
        int LoggedInUserId = 0;
        public MembersController(IMembersRegistrationRepository membersRegistrationRepository,
            IRegistrationTransactionRepository registrationTransactionRepository, IMapper mapper,
            IWebHostEnvironment environment, IContributionTransactionRepository contributionTransactionRepository)
        {
            this._membersRegistrationRepository = membersRegistrationRepository;
            this.registrationTransactionRepository = registrationTransactionRepository;
            //LoggedInUserId = Convert.ToInt32(User.Identity.GetId());
            this._mapper = mapper;
            this._environment = environment;
            this.contributionTransactionRepository = contributionTransactionRepository;
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult IndexGrid()
        {
            var getAllMembersList = _membersRegistrationRepository.getAllMembers();
            return Ok(getAllMembersList);
        }

        public IActionResult ExpiredMembersList()
        {
            return View();
        }
        public IActionResult ExMemebrsList()
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
                var customerData = (from tempcustomer in _membersRegistrationRepository.getAllMembers().Where(a => a.IsPaid && a.IsApproved && a.IsExpired && a.IsActive).ToList()
                                    select tempcustomer);
                //Sorting  
                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDirection)))
                {
                    //customerData = customerData.OrderBy(sortColumn + " " + sortColumnDirection);
                }
                //Search  
                if (!string.IsNullOrEmpty(searchValue))
                {
                    customerData = customerData.Where(s => s.MemberCode.ToString().Contains(searchValue)
                                       || s.Initials.ToString().ToLower().Contains(searchValue)
                                       || s.Fullname.ToString().ToLower().Contains(searchValue)
                                       || s.Villagename.ToString().ToLower().Contains(searchValue)
                                       || s.MobileNo.ToString().ToLower().Contains(searchValue));
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

        public async Task<IActionResult> ContributionTransaction()
        {
            return View();
        }
        public async Task<IActionResult> GetContributionTransaction()
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

                //int UserId = Convert.ToInt32((User.Identity.GetId()));
                // getting all Customer data  
                var customerData = contributionTransactionRepository.GetMembersContributionByMemberCodeAdminAsync().Result.AsEnumerable();

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

        public IActionResult RegistrationTransactions()
        {
            return View();
        }
        [HttpPost]
        public IActionResult GetRegistrationTransactions()
        {
            try
            {
                var draw = Request.Form["draw"].FirstOrDefault();

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
                var customerData = registrationTransactionRepository.GetAllOffline();

                //Sorting  
                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDirection)))
                {
                    //customerData = customerData.OrderBy(sortColumn + " " + sortColumnDirection);
                }
                //Search  
                if (!string.IsNullOrEmpty(searchValue))
                {
                    customerData = customerData.Where(s => s.MemberCode.ToString().Contains(searchValue));
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

        // GET: Students/Create
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(MembersRegistration model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    model.MemberCode = await _membersRegistrationRepository.GetMaxMemberCode();
                    model.IsActive = true;
                    model.CreatedOn = DateTime.UtcNow;
                    var newMemberId = await _membersRegistrationRepository.CreateMemberAsync(model);
                    if (newMemberId != null)
                        return RedirectToAction(nameof(Index));
                    else
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
        public async Task<IActionResult> Edit(int Id)
        {
            var Memebrs = await _membersRegistrationRepository.getMembersById(Id);
            var membersRegistration = _mapper.Map<MembersRegistration, MembersRegistrationModel>(Memebrs); // Map dto to op object
            return View(membersRegistration);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(MembersRegistrationModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var membersRegistration = _mapper.Map<MembersRegistrationModel, MembersRegistration>(model); // Map dto to op object

                    if (model.ProfilePicture != null)
                    {
                        if (model.ProfileImage != null)
                        {
                            string filePath = Path.Combine(_environment.WebRootPath, "ProfileUploads", model.ProfileImage);
                            System.IO.File.Delete(filePath);
                        }
                        membersRegistration.ProfileImage = ProfileUploadedFile(model);
                    }
                    if (model.AgeProofPicture != null)
                    {
                        if (model.AgeProofImage != null)
                        {
                            string filePath = Path.Combine(_environment.WebRootPath, "AgeProofUploads", model.AgeProofImage);
                            System.IO.File.Delete(filePath);
                        }
                        membersRegistration.AgeProofImage = AgeProofUploadedFile(model);
                    }
                    if (membersRegistration.IsApproved && membersRegistration.ApprovedDate == null && membersRegistration.ApprovedBy == null)
                    {
                        membersRegistration.ApprovedBy = User.Identity.GetId();
                        membersRegistration.ApprovedDate = DateTime.UtcNow;
                    }
                    membersRegistration.ModifiedBy = User.Identity.GetId();
                    membersRegistration.ModifiedOn = DateTime.Now;
                    var newMemberId = await _membersRegistrationRepository.EditMemberAsync(membersRegistration);
                    if (newMemberId != null)
                        return RedirectToAction(nameof(Index), "Home");
                    else
                    {
                        ModelState.AddModelError("", "Unable to save changes. " +
                   "Try again, and if the problem persists " +
                   "see your system administrator.");
                        return View(model);
                    }

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


        //public async Task<IActionResult> RegistrationTransactions()
        //{
        //    var list = await registrationTransactionRepository.GetAllAsync();
        //    return View(list);
        //}
        //public async Task<IActionResult> RegistrationTransactions(
        //    string? sortOrder,
        //    string? currentFilter,
        //    string? searchString,
        //    int? pageNumber)
        //{
        //    ViewData["CurrentSort"] = sortOrder;
        //    ViewData["MemberCodeSortParm"] = String.IsNullOrEmpty(sortOrder) ? "code_desc" : "";
        //    ViewData["MemberNameSortParm"] = sortOrder == "name" ? "name_desc" : "name";

        //    if (searchString != null)
        //    {
        //        pageNumber = 1;
        //    }
        //    else
        //    {
        //        searchString = currentFilter;
        //    }

        //    ViewData["CurrentFilter"] = searchString;

        //    var students = await registrationTransactionRepository.GetAllAsync();

        //    if (!String.IsNullOrEmpty(searchString))
        //    {
        //        students = students.Where(s => s.MemberCode.ToString().Contains(searchString));
        //    }
        //    switch (sortOrder)
        //    {
        //        case "code_desc":
        //            students = students.OrderByDescending(s => s.MemberCode);
        //            break;
        //        default:
        //            students = students.OrderBy(s => s.MemberCode);
        //            break;
        //    }
        //    int pageSize = 50;
        //    return View(PaginatedList<RegistrationTransactions>.CreateAsync(students.AsQueryable(), pageNumber ?? 1, pageSize));
        //}
        public async Task<IActionResult> SetMemebrExpired(int Id)
        {
            string adminUserId = User.Identity.GetId();
            await _membersRegistrationRepository.SetMemberExpired(Id, adminUserId);
            return RedirectToAction("Index", "Home");
        }
        public async Task<IActionResult> SetApproval(int Id)
        {
            string adminUserId = User.Identity.GetId();
            await _membersRegistrationRepository.SetMemberApproval(Id, adminUserId);
            return RedirectToAction("Index", "Home");
        }
        public async Task<IActionResult> SetDiactivation(int Id)
        {
            string adminUserId = User.Identity.GetId();
            await _membersRegistrationRepository.SetMemberDiactivation(Id, adminUserId);
            return RedirectToAction("Index", "Home");
        }
        public async Task<IActionResult> SetIsPaidAndApproved(int Id)
        {
            string adminUserId = User.Identity.GetId();
            await _membersRegistrationRepository.SetIsPaidAndApproved(Id, adminUserId);
            return RedirectToAction("Index", "Home");
        }
        public async Task<IActionResult> SetContributionApprove(int Id)
        {
            string adminUserId = User.Identity.GetId();
            await _membersRegistrationRepository.SetContributionApprove(Id, adminUserId);
            return View("ContributionTransaction", "Member");
        }
    }
}
