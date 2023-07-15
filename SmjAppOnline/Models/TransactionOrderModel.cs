using System.Diagnostics.CodeAnalysis;

namespace SmjApp.Models
{
    [ExcludeFromCodeCoverage]
    public class TransactionOrderModel
    {
        public int Id { get; set; }
        public string MembersSelected { get; set; }
        public string MembersExpired { get; set; }

        public int TotalContributionAmount { get; set; }

        public int OrderId{ get; set; }



    }
}
