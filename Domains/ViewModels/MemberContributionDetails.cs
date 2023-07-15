using Domains.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Domains.ViewModels
{
    public class MemberContributionDetails
    {
        public MembersContribution membersContribution { get; set; }
        public string MemberFullName { set; get; }
        public string ExMemberFullName { set; get; }
        public string PaymentByUsername { set; get; }
        public string ApprovedByUsername { set; get; }

    }
}
