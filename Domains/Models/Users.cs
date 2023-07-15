using System;
using System.Collections.Generic;
using System.Text;

namespace Domains.Models
{
    public class Users
    {
        public int Id { get; set; } 
        public string Name { get; set; }
        public string EmailId { get; set; }
        public string MobileNo { get; set; }
        public string Password { get; set; }
        public string PasswordSalt { get; set; }
        public string Role { get; set; }
        public string ActivationCode { get; set; }
        public string ResetPasswordCode { get; set; }
        public bool IsActive { get; set; } = true;
        public DateTime CreatedOn { get; set; } = DateTime.UtcNow;
        public DateTime? ModifiedOn { get; set; }
        public string ModifiedBy { get; set; }


    }
}
