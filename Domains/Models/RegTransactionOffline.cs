using System;
using System.Collections.Generic;
using System.Text;

namespace Domains.Models
{
    public class RegTransactionOffline
    {
        public int Id { get; set; }
        public int MemberCode { get; set; }
        public string OrderId { get; set; }
        public decimal Amount { get; set; }
        public bool IsPaid { get; set; }
        public bool? IsPaymentApproved { get; set; }
        public string PaymentApprovedBy { get; set; }
        public DateTime? PaymentApprovedDate { get; set; }
        public string PaymentBy { get; set; }
        public DateTime CreatedOn { get; set; }

    }
}
