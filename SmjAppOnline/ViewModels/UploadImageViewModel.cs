using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SmjApp.ViewModels
{
    public class UploadImageViewModel
    {
        [Display(Name = "Profile photo")]
        public IFormFile ProfilePicture { get; set; }
        [Display(Name = "Age proof photo")]
        public IFormFile AgeProofPicture { get; set; }
    }
}
