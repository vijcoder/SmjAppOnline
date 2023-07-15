﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmjApp.ViewModels
{
     
    // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse);
    public class Body
    {
        public ResultInfo resultInfo { get; set; }
        public string txnToken { get; set; }
        public bool isPromoCodeValid { get; set; }
        public bool authenticated { get; set; }
    }

    public class Head
    {
        public string responseTimestamp { get; set; }
        public string version { get; set; }
        public string signature { get; set; }
    }

    public class ResultInfo
    {
        public string resultStatus { get; set; }
        public string resultCode { get; set; }
        public string resultMsg { get; set; }
    }

    public class PayTmReqiestRootModel
    {
        public Head head { get; set; }
        public Body body { get; set; }
    }


}
