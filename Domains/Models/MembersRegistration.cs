using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Domains.Models
{
    public class MembersRegistration : IBaseEntity
    {
        public int Id { get; set; }
        public int MemberCode { get; set; }
        public string Initials { get; set; }
        public string Fullname { get; set; } 
        public string MobileNo { get; set; }
        public string EmailId { get; set; } 
        public string Villagename { get; set; }
        public string Address { get; set; }
        public DateTime? DOB { get; set; }
        public string AgeProofImage { get; set; }
        public string ProfileImage { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public decimal Amount { get; set; }
        public bool IsPaid { get; set; }
        public bool IsApproved { get; set; }
        public string ApprovedBy { get; set; }
        public DateTime? ApprovedDate { get; set; }

        public bool IsExpired { get; set; }
        public DateTime? ExpiryDate { get; set; }
        public bool IsActive { get; set; }

        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }

        public DateTime? ModifiedOn { get; set; }

        public string ModifiedBy { get; set; }



    }
}
