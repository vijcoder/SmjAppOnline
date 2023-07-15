using Domains.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Domains.Repository
{
    public interface IMembersRegistrationRepository
    {
        IList<MembersRegistration> getAllMembers();
        IList<MembersRegistration> getAllMembers1();
        IList<MembersRegistration> getExpiredMembersList();
        Task<MembersRegistration> getMembersById(int Id);
        IList<MembersRegistration> getExpiredMembersList(string[] selectedMembers);

        Task<MembersRegistration> CreateMemberAsync(MembersRegistration model);
        Task<MembersRegistration> EditMemberAsync(MembersRegistration model);
        Task<MembersRegistration> SetIsPaidAsync(int Id);
        Task<int> GetMaxMemberCode();

        Task<bool> SetMemberExpired(int Id, string userId);
        Task<bool> SetMemberApproval(int Id, string userId);
        Task<bool> SetContributionApprove(int Id, string userId);
        Task<bool> SetMemberDiactivation(int Id, string userId);

        Task<bool> SetIsPaidAndApproved(int Id, string userId);

        Task<IEnumerable<MembersRegistration>> getMembersRegisteredByUser(int UserId);

    }
}
