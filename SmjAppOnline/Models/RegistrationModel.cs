using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SmjApp.Models
{
    public class RegistrationModel
    {
        [Required]
        [Display(Name = "Full name")]
        public string FullName { get; set; }
        [Required]        
        [Display(Name = "Mobile number")]
        public string MobileNo { get; set; }

        [Required]
        [EmailAddress]
        //[Remote("CheckExistingEmail", "Account", ErrorMessage = "Email already exists!")]
        [Display(Name = "Email")]
        public string EmailId { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} and at max {1} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }
}
