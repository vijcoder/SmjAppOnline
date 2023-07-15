using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmjApp.ViewModels
{
    public class UPIPaymentModel
    {
        public string Mid { get; set; }
        public string orderId { get; set; }
        public string txnToken { get; set; }
        public string payerAccount { get; set; }


    }
}
