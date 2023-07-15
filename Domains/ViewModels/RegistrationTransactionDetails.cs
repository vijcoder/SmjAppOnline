using System;
using System.Collections.Generic;
using System.Text;

namespace Domains.ViewModels
{
    class RegistrationTransactionDetails
    {
        public int Id { get; set; }
        public int MemberCode { get; set; }
        public string Initials { get; set; }
        public string Firstname { get; set; }
        public string Middlename { get; set; }
        public string Lastname { get; set; }
        public string MobileNo { get; set; }

        public string EmailId { get; set; }
        public string Villagename { get; set; }

    }
}
