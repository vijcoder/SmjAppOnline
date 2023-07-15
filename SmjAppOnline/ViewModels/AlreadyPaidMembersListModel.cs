using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmjApp.ViewModels
{
    public class AlreadyPaidMembersListModel
    {
        public int Id { get; set; }
        public string MemberCode { get; set; }
        public string MemberName { get; set; }
        public string ExMemberCode { get; set; }
        public string ExMemberName { get; set; }

        public DateTime PaymentDate { get; set; }
        public string ProfileImage { get; set; }

    }
}

