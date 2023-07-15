using System;
using System.Collections.Generic;
using System.Text;

namespace Domains.Models
{
    public class Configuration
    {
        public int Id { get; set; }
        public int ContributionAmount { get; set; }
        public int RegistrationAmount { get; set; }
        public int SeniorRegistrationAmount { get; set; }
        public bool IsActive { get; set; }

        public DateTime CreatedOn { get; set; }

        public DateTime? ModifiedOn { get; set; }

        public string ModifiedBy { get; set; }


    }
}
