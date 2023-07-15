using Domains.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SmjApp.ViewModels
{
    public class MembersRegistrationModel : EditImageViewModel
    { 
        public int MemberCode { get; set; }
        public string Initials { get; set; }
        public string Fullname { get; set; } 
        //[Required]
        [MaxLength(10), MinLength(0)]
        public string MobileNo { get; set; }
        //[Required]
        [RegularExpression(@"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$", ErrorMessage = "Email is not valid.")]
        public string EmailId { get; set; } 
        [Required]
        public string Villagename { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        //[Display(Name ="Date of bitrh")]
        public DateTime DOB { get; set; }
        public int Age { get; set; }
        public string AgeProofImage { get; set; }
        public string ProfileImage { get; set; }
        public decimal Amount { get; set; }
        public bool IsPaid { get; set; }
        public bool IsApproved { get; set; }
        public string ApprovedBy { get; set; }
        public DateTime? ApprovedDate { get; set; }
        public bool IsExpired { get; set; }
        public DateTime? ExpiryDate { get; set; }
        public bool IsActive { get; set; }

        public DateTime CreatedOn { get; set; }
        public string? CreatedBy { get; set; }

        public DateTime? ModifiedOn { get; set; }

        public string ModifiedBy { get; set; }
    }
}
