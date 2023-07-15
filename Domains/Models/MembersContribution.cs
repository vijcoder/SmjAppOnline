using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Domains.Models
{
    public class MembersContribution
    {
        public int Id { get; set; }
        public string MemberCode { get; set; }
        public string ExMemberCode { get; set; }

        public string OrderId { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public decimal OrderAmount { get; set; }
        public string PaymentMode { get; set; }
        public int PaymentBy { get; set; }

        public bool IsArchived { get; set; } = false;
        public bool IsPaid { get; set; }
        public bool? IsPaymentApproved { get; set; }
        public int? PaymentApprovedBy { get; set; }
        public DateTime? PaymentApprovedOn { get; set; }
        public bool IsActive { get; set; }
        
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        [DataType(DataType.Date)]
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public string ModifiedBy { get; set; }

    }
}
