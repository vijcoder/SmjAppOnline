using System;
using System.Diagnostics.CodeAnalysis;

namespace Domains.ViewModels
{
    [ExcludeFromCodeCoverage]
    public class UserMembersMappingDetais
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int MemberCode { get; set; }
        public string Username { get; set; }
        public string Membername { get; set; }
        public string UserMobileNo { get; set; }
        public string MemberMobileNo { get; set; }
        public bool? IsApproved { get; set; }
        public DateTime? ApprovedOn { get; set; }
        public string ApprovedBy { get; set; }
        public DateTime? CreatedOn { get; set; }

    }
}
