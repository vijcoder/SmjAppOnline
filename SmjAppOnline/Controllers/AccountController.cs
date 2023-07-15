using AutoMapper;
using Domains.Models;
using Domains.Repository;
using Infrastructure.Helper;
using Infrastructure.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using SmjApp.Models;
using SmjApp.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace SmjApp.Controllers
{
    public class AccountController : Controller
    {
        private readonly IAuthenticateService authenticateService;
        private readonly IUsersRepository usersRepository;
        private readonly IConfiguration configuration;
        private readonly IMapper mapper;
        protected readonly ILogger<AccountController> _logger;
        //private readonly IEmailManager emailManager;

        public AccountController(IAuthenticateService authenticateService,
            IConfiguration configuration, IUsersRepository usersRepository, IMapper mapper, ILogger<AccountController> logger
            //IEmailManager emailManager
            )
        {
            this.authenticateService = authenticateService;
            this.configuration = configuration;
            this.usersRepository = usersRepository;
            this.mapper = mapper;
            this._logger = logger;
            //this.emailManager = emailManager;
        }
        public IActionResult Login(string ReturnUrl = "/")
        {
            AuthenticateModel objLoginModel = new AuthenticateModel();
            objLoginModel.ReturnUrl = ReturnUrl;
            return View(objLoginModel);
        }

        [HttpPost]
        public async Task<IActionResult> Login(AuthenticateModel model)
        {
            try
            {

                //https://www.c-sharpcorner.com/article/cookie-authentication-in-asp-net-core/#:~:text=Let's%20implement%20the%20Cookie%20Authentication,creation%2C%20and%20click%20on%20Next.
                if (ModelState.IsValid)
                {
                    var userFromDb = await authenticateService.GetUserByEmail(model.UserName);

                    if (userFromDb != null)
                    {
                        string password = userFromDb.Password;
                        string passwordSalt = userFromDb.PasswordSalt;
                        string passHashed = CryptographyProcessor.GenerateHash(model.Password, passwordSalt);

                        var user = authenticateService.Authenticate(model.UserName, passHashed);
                        if (user != null)
                        {
                            _logger.LogInformation("User email id = " + user.EmailId);
                            //A claim is a statement about a subject by an issuer and    
                            //represent attributes of the subject that are useful in the context of authentication and authorization operations.    
                            var claims = new List<Claim>() {
                    new Claim(ClaimTypes.NameIdentifier, Convert.ToString(user.Id)),
                        new Claim(ClaimTypes.Name, user.Name),
                        new Claim(ClaimTypes.Role, user.Role),
                        new Claim("UserId", user.Id.ToString())
                    };
                            //Initialize a new instance of the ClaimsIdentity with the claims and authentication scheme    
                            var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                            //Initialize a new instance of the ClaimsPrincipal with ClaimsIdentity    
                            var principal = new ClaimsPrincipal(identity);
                            //SignInAsync is a Extension method for Sign in a principal for the specified scheme.    
                            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal, new AuthenticationProperties()
                            {
                                IsPersistent = model.RememberLogin
                            });
                            return LocalRedirect(model.ReturnUrl);
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("", "Username or password is incorrect.");
                        return View();
                    }

                }

            }
            catch (Exception ex)
            {
                _logger.LogError("Error while logging " + ex.Message);
            }
            return View();
        }
        public IActionResult Registration()
        {
            RegistrationModel objLoginModel = new RegistrationModel();
            return View(objLoginModel);
        }
        [HttpPost]
        [AutoValidateAntiforgeryToken]
        public async Task<IActionResult> Registration(RegistrationModel model)
        {
            bool ifEmailExist = false;
            try
            {

                //https://www.c-sharpcorner.com/article/cookie-authentication-in-asp-net-core/#:~:text=Let's%20implement%20the%20Cookie%20Authentication,creation%2C%20and%20click%20on%20Next.
                if (ModelState.IsValid)
                {
                    ifEmailExist = usersRepository.CheckExistingEmail(model.EmailId);
                    if (ifEmailExist)
                    {
                        ModelState.AddModelError("EmailId", "Email already exists. Please try with other email.");
                        return View();
                    }
                    var registrationModel = mapper.Map<RegistrationModel, Users>(model);
                    string salt = CryptographyProcessor.CreateSalt(128);
                    registrationModel.PasswordSalt = salt;
                    registrationModel.Password = CryptographyProcessor.GenerateHash(model.Password, salt);
                    registrationModel.Role = "User";
                    var registeredUser = await usersRepository.Registration(registrationModel);
                    if (registeredUser.Id != 0)
                    {
                        //------send email to user for successful registration.
                       //EmailManager.SendEmail("New user registration successfull.", "NewUserRegisteration.html", model.EmailId);

                        return View("RegistrationSuccess", model);
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Opps something went wrong. Please try again.");
                    return View();
                }
            }
            catch (Exception ex)
            {
                _logger.LogInformation("Error while logging " + ex.Message);
                throw;
            }
            return LocalRedirect("/");
        }
        public ActionResult CheckExistingEmail(string EmailId)
        {
            bool ifEmailExist = false;
            try
            {
                ifEmailExist = usersRepository.CheckExistingEmail(EmailId);

                return Ok(!ifEmailExist);
            }
            catch (Exception ex)
            {
                return Ok(false);
            }
        }


        public async Task<IActionResult> LogOut()
        {
            //SignOutAsync is Extension method for SignOut    
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            //Redirect to home page    
            return LocalRedirect("/");
        }
    }
}
