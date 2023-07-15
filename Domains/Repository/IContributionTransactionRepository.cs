using Domains.Models;
using Domains.ViewModels;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Domains.Repository
{
    public interface IContributionTransactionRepository
    {
        //-----Members contribution
        IList<MembersContribution> GetMembersContributionByUser(int UserId);
        Task<IList<MemberContributionDetails>> GetMembersContributionByUserAsync(int UserId);
        Task<IList<MemberContributionDetails>> GetMembersContributionByMemberCodeAsync(int MemberCode);
        Task<IList<MemberContributionDetails>> GetMembersContributionByMemberCodeAdminAsync();
        Task<IList<ContributionTransactions>> GetContributionTransactionsByUser(int UserId);
        Task<bool> InsertMembersContribution(MembersContribution model, int perMemberContribution, string[] alreadyPaidMemArray, string[] alreadyPaidExMemArray);
        Task<bool> UpdateMembersContribution(MembersContribution model);

        //-----contribution transactions
        Task<ContributionTransactions> InsertContributionTransaction(ContributionTransactions model);
        Task<bool> UpdateContributionTransaction(ContributionTransactions model);
        Task<List<AlreadyPaidMembersListModel>> GetPaidMembersList(IList membersSelected, IList activeExpiredMember);

    }
}
