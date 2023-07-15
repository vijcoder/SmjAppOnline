using System;
using System.Collections.Generic;
using System.Text;

namespace Domains.Models
{
    public class RegistrationTransactions
    {
        public int Id { get; set; }
        public string MemberCode { get; set; }
        public string MID { get; set; }
        public string CURRENCY { get; set; }
        public string OrderId { get; set; }
        public string TxnAmount { get; set; }
        public string STATUS { get; set; }
        public string TXNID { get; set; }
        public string BANKTXNID { get; set; }
        public string RESPCODE { get; set; }
        public string RESPMSG { get; set; }
        public string TXNDATE { get; set; }
        public string GATEWAYNAME { get; set; }
        public string BANKNAME { get; set; }
        public string PAYMENTMODE { get; set; }
        public bool IsPaid { get; set; }
        public bool? IsPaymentApproved { get; set; }
        public int? PaymentApprovedBy { get; set; }
        public DateTime? PaymentApprovedDate { get; set; }
        public string PaymentBy { get; set; }
        public DateTime CreatedOn { get; set; } = DateTime.UtcNow;

    }
}
