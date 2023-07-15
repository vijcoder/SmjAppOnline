using AutoMapper;
using Domains.Models;
using Domains.Repository;
using Domains.ViewModels;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Repository
{
    public class ContributionTransactionRepository : IContributionTransactionRepository
    {
        private readonly IConfiguration _configuration;
        private readonly DataContext _dataContext;
        private readonly IMapper _mapper;
        public ContributionTransactionRepository(IConfiguration configuration, DataContext dataContext, IMapper mapper)
        {
            this._configuration = configuration;
            this._dataContext = dataContext; 
            this._mapper = mapper;
        }
        public async Task<IList<MemberContributionDetails>> GetMembersContributionByUserAsync(int UserId)
        {
            var membersContribution = await _dataContext.MembersContribution.Where(u => u.PaymentBy == UserId).ToListAsync();

            var result = (from a in membersContribution
                          join b in _dataContext.MembersRegistration on Convert.ToInt32(a.MemberCode) equals b.MemberCode
                          join c in _dataContext.MembersRegistration on Convert.ToInt32(a.ExMemberCode) equals c.MemberCode
                          join d in _dataContext.Users on a.PaymentBy equals d.Id
                          //join e in _dataContext.Users on a.PaymentApprovedBy equals e.Id
                          select new MemberContributionDetails
                          {
                              membersContribution = a,
                              MemberFullName = b.Fullname,
                              ExMemberFullName = c.Fullname,
                              PaymentByUsername = d.Name,
                              ApprovedByUsername = a.PaymentApprovedBy == null ? "" : _dataContext.Users.Find(a.PaymentApprovedBy).Name
                          }).ToList();
            return result;
        }
        public async Task<IList<MemberContributionDetails>> GetMembersContributionByMemberCodeAsync(int MemberCode)
        {

            var membersContribution = await _dataContext.MembersContribution.Where(u => u.MemberCode == Convert.ToString(MemberCode)).ToListAsync();

            var result = (from a in membersContribution
                          join b in _dataContext.MembersRegistration on Convert.ToInt32(a.MemberCode) equals b.MemberCode
                          join c in _dataContext.MembersRegistration on Convert.ToInt32(a.ExMemberCode) equals c.MemberCode
                          //join d in _dataContext.Users on a.PaymentBy equals d.Id
                          //join e in _dataContext.Users on a.PaymentApprovedBy equals e.Id
                          select new MemberContributionDetails
                          {
                              membersContribution = a,
                              MemberFullName = b.Fullname,
                              ExMemberFullName = c.Fullname,
                              //PaymentByUsername = d.Name,
                              ApprovedByUsername = a.PaymentApprovedBy == null ? "" : _dataContext.Users.Find(a.PaymentApprovedBy).Name
                          }).ToList();
            return result;
        }
        public async Task<IList<MemberContributionDetails>> GetMembersContributionByMemberCodeAdminAsync()
        {

            var membersContribution = await _dataContext.MembersContribution.ToListAsync();

            var result = (from a in membersContribution
                          join b in _dataContext.MembersRegistration on Convert.ToInt32(a.MemberCode) equals b.MemberCode
                          join c in _dataContext.MembersRegistration on Convert.ToInt32(a.ExMemberCode) equals c.MemberCode
                          //join d in _dataContext.Users on a.PaymentBy equals d.Id
                          //join e in _dataContext.Users on a.PaymentApprovedBy equals e.Id
                          select new MemberContributionDetails
                          {
                              membersContribution = a,
                              MemberFullName = b.Fullname,
                              ExMemberFullName = c.Fullname,
                              //PaymentByUsername = d.Name,
                              ApprovedByUsername = a.PaymentApprovedBy == null ? "" : _dataContext.Users.Find(a.PaymentApprovedBy).Name
                          }).ToList();
            return result;
        }
        public IList<MembersContribution> GetMembersContributionByUser(int UserId)
        {
            return _dataContext.MembersContribution.Where(u => u.PaymentBy == UserId).ToList();
        }
        public async Task<IList<ContributionTransactions>> GetContributionTransactionsByUser(int UserId)
        {
            return await _dataContext.ContributionTransactions.Where(u => u.PaymentBy == UserId).ToListAsync();
        }

        public async Task<ContributionTransactions> InsertContributionTransaction(ContributionTransactions model)
        {
            try
            {

                await _dataContext.ContributionTransactions.AddAsync(model);
                await _dataContext.SaveChangesAsync();
                return model;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public async Task<bool> UpdateContributionTransaction(ContributionTransactions model)
        {
            try
            {

                _dataContext.ContributionTransactions.Update(model);
                int rowsAffected = await _dataContext.SaveChangesAsync();
                if (rowsAffected > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public async Task<bool> InsertMembersContribution(MembersContribution model, int perMemberContribution, string[] alreadyPaidMemArray, string[] alreadyPaidExMemArray)
        {
            try
            {
                bool result = false;
                List<MembersContribution> memContrList = new List<MembersContribution>();
                string[] membersList = model.MemberCode.Split(",");
                string[] exMembersList = model.ExMemberCode.Split(",");
                for (int i = 0; i < membersList.Length; i++)
                {
                    for (int j = 0; j < exMembersList.Length; j++)
                    {
                        if (alreadyPaidMemArray.Contains(membersList[i]) && alreadyPaidExMemArray.Contains(exMembersList[j]))
                            continue;
                        MembersContribution newModel = new MembersContribution();
                       // newModel = _mapper.Map<MembersContribution, MembersContribution>(model);
                        newModel.MemberCode = membersList[i];
                        newModel.ExMemberCode = exMembersList[j];
                        newModel.OrderAmount = perMemberContribution;
                        newModel.CreatedOn = DateTime.UtcNow;
                        newModel.OrderId = model.OrderId;
                        newModel.PaymentMode = model.PaymentMode;
                        newModel.PaymentBy = model.PaymentBy;
                        newModel.IsActive = model.IsActive;
                        newModel.IsArchived = model.IsArchived;
                        newModel.IsPaid = model.IsPaid;
                        newModel.IsPaymentApproved = model.IsPaymentApproved;
                        newModel.PaymentApprovedBy = model.PaymentApprovedBy;
                        newModel.CreatedBy = model.CreatedBy;
                        newModel.ModifiedBy = model.ModifiedBy;
                        newModel.ModifiedOn = model.ModifiedOn;

                        memContrList.Add(newModel);

                    }
                }
                await _dataContext.MembersContribution.AddRangeAsync(memContrList);
                int rowsAffected = await _dataContext.SaveChangesAsync();
                if (rowsAffected > 0)
                    result = true;

                return result;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<bool> UpdateMembersContribution(MembersContribution model)
        {
            try
            {
                string[] membersList = model.MemberCode.Split(",");
                _dataContext.MembersContribution.Update(model);
                int rowsAffected = await _dataContext.SaveChangesAsync();
                if (rowsAffected > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<List<AlreadyPaidMembersListModel>> GetPaidMembersList(IList membersSelected, IList activeExpiredMember)
        {
            try
            {
                var lst = _dataContext.MembersContribution.ToList();
                var exMembList = await _dataContext.MembersContribution.Where(item => membersSelected.Contains(item.MemberCode)
                && activeExpiredMember.Contains(item.ExMemberCode)).ToListAsync();

                var mebDetails = (from e in exMembList
                                  join m in _dataContext.MembersRegistration
                                  on e.MemberCode equals m.MemberCode.ToString()
                                  where m.IsActive && e.IsPaid
                                  select new AlreadyPaidMembersListModel
                                  {
                                      MemberCode = e.MemberCode,
                                      MemberName = $"{m.Initials} {m.Fullname}",
                                      ExMemberCode = e.ExMemberCode,
                                      PaymentDate = e.CreatedOn,
                                      ProfileImage = m.ProfileImage
                                  }).ToList();
                return mebDetails;


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
