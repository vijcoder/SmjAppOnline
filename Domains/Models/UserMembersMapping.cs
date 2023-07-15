using System;
using System.Collections.Generic;
using System.Text;

namespace Domains.Models
{
    public class UserMembersMapping
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int MemberCode { get; set; }
        public string ApprovedBy { get; set; }
        public DateTime? ApprovedOn { get; set; }
        public bool IsApproved { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedOn { get; set; } = DateTime.UtcNow;
        public DateTime? ModifiedOn { get; set; }
        public string ModifiedBy { get; set; }
    }
}
