using System;
using System.Collections.Generic;
using System.Text;

namespace Domains.Models
{
    public class RegistrationTransactionsModel
    {
        public int Id { get; set; }        
        public string MemberCode { get; set; }
        public string MID { get; set; }
        public string CURRENCY { get; set; }
        public string CHECKSUMHASH { get; set; }
        public string ORDERID { get; set; }
        public string TXNAMOUNT { get; set; }
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
        public string PaymentBy { get; set; }
        public DateTime CreatedOn { get; set; } = DateTime.UtcNow; 

    }
}
