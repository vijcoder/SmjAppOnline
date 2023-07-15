using Domains.Models;
using Domains.Repository;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Repository
{
    public class MembersRegistrationRepository : IMembersRegistrationRepository
    {
        private readonly IConfiguration _configuration;
        private readonly DataContext _dataContext;

        public MembersRegistrationRepository(IConfiguration configuration, DataContext dataContext)
        {
            this._configuration = configuration;
            this._dataContext = dataContext;
        }
        public IList<MembersRegistration> getAllMembers()
        {
            try
            {
                var result = (from r in _dataContext.MembersRegistration
                              where r.IsActive
                              orderby r.MemberCode descending
                              select r).ToList();
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public IList<MembersRegistration> getExpiredMembersList()
        {
            try
            {
                return (from r in _dataContext.MembersRegistration
                        select r).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<MembersRegistration> getMembersById(int Id)
        {
            try
            {
                return await _dataContext.MembersRegistration.Where(r => r.Id == Id).FirstOrDefaultAsync();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public IList<MembersRegistration> getExpiredMembersList(string[] selectedMembers)
        {
            try
            {
                var result = (from r in _dataContext.MembersRegistration
                              where r.IsExpired && r.IsActive
                              select r).ToList();
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IList<MembersRegistration> getAllMembers1()
        {
            SqlConnection con = null;
            DataSet ds = null;
            List<MembersRegistration> memberList = null;
            try
            {
                con = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
                SqlCommand cmd = new SqlCommand("proc_GetAllMembers", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);
                memberList = new List<MembersRegistration>();
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    MembersRegistration cobj = new MembersRegistration();
                    cobj.Id = Convert.ToInt32(ds.Tables[0].Rows[i]["Id"].ToString());
                    cobj.MemberCode = Convert.ToInt32(ds.Tables[0].Rows[i]["MemberCode"]);
                    //cobj.MemberName = ds.Tables[0].Rows[i]["MemberName"].ToString();
                    //cobj.Initials = ds.Tables[0].Rows[i]["Initials"].ToString();
                    //cobj.Firstname = ds.Tables[0].Rows[i]["Firstname"].ToString();
                    //cobj.Middlename = ds.Tables[0].Rows[i]["Middlename"].ToString();
                    //cobj.Lastname = ds.Tables[0].Rows[i]["Lastname"].ToString();
                    cobj.MobileNo = ds.Tables[0].Rows[i]["Mobileno"].ToString();
                    cobj.EmailId = ds.Tables[0].Rows[i]["EmailID"].ToString();
                    cobj.DOB = Convert.ToDateTime(ds.Tables[0].Rows[i]["DOB"].ToString());
                    cobj.Villagename = ds.Tables[0].Rows[i]["Villagename"].ToString();
                    cobj.Address = ds.Tables[0].Rows[i]["Address"].ToString();
                    cobj.AgeProofImage = ds.Tables[0].Rows[i]["AgeProofImage"].ToString();
                    cobj.IsPaid = Convert.ToBoolean(ds.Tables[0].Rows[i]["IsPaid"].ToString());
                    cobj.IsExpired = Convert.ToBoolean(ds.Tables[0].Rows[i]["IsExpired"].ToString());
                    cobj.IsActive = Convert.ToBoolean(ds.Tables[0].Rows[i]["IsActive"].ToString());
                    cobj.CreatedOn = Convert.ToDateTime(ds.Tables[0].Rows[i]["CreatedOn"].ToString());
                    //cobj.ModifiedOn = ds.Tables[0].Rows[i]["ModifiedOn"].ToString() == "" ? null : Convert.ToDateTime(ds.Tables[0].Rows[i]["ModifiedOn"].ToString());
                    memberList.Add(cobj);
                }
                return memberList;
            }
            catch (Exception ex)
            {
                throw ex;
                return memberList;
            }
            finally
            {
                con.Close();
            }
        }
        public async Task<int> GetMaxMemberCode()
        {
            var mxCode = _dataContext.MembersRegistration.Count() > 0 ? _dataContext.MembersRegistration.Max(x => x.MemberCode) : 0;
            return mxCode + 1;

        }

        public async Task<MembersRegistration> CreateMemberAsync(MembersRegistration model)
        {
            _dataContext.MembersRegistration.Add(model);
            await _dataContext.SaveChangesAsync();
            return model;
        }

        public async Task<MembersRegistration> EditMemberAsync(MembersRegistration model)
        {
            try
            {
                _dataContext.MembersRegistration.Update(model);
                await _dataContext.SaveChangesAsync();
                return model;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<MembersRegistration> SetIsPaidAsync(int Id)
        {
            var registeredMember = await _dataContext.MembersRegistration.Where(m => m.MemberCode == Id).FirstOrDefaultAsync();
            if (registeredMember != null)
            {
                registeredMember.IsPaid = true;
                _dataContext.MembersRegistration.Update(registeredMember);
                await _dataContext.SaveChangesAsync();
            }
            return registeredMember;
        }

        public async Task<bool> SetMemberExpired(int Id, string userId)
        {
            bool result = false;

            var member = await _dataContext.MembersRegistration.FindAsync(Id);
            if (member != null)
            {
                member.IsExpired = true;
                member.ExpiryDate = DateTime.Now;
                member.ModifiedBy = userId;
                member.ModifiedOn = DateTime.UtcNow;
                _dataContext.MembersRegistration.Update(member);
                int rowAffected = await _dataContext.SaveChangesAsync();
                if (rowAffected > 0)
                    result = true;
            }

            return result;
        }
        public async Task<bool> SetMemberApproval(int Id, string userId)
        {
            bool result = false;

            var member = await _dataContext.MembersRegistration.FindAsync(Id);
            if (member != null)
            {
                member.IsApproved = true;
                member.ApprovedDate = DateTime.UtcNow;
                member.ApprovedBy = userId;
                _dataContext.MembersRegistration.Update(member);
                int rowAffected = await _dataContext.SaveChangesAsync();
                if (rowAffected > 0)
                    result = true;
            }

            return result;
        }
        public async Task<bool> SetContributionApprove(int Id, string userId)
        {
            bool result = false;

            var member = await _dataContext.MembersContribution.FindAsync(Id);
            if (member != null)
            {
                member.IsPaymentApproved = true;
                member.PaymentApprovedOn = DateTime.UtcNow;
                member.PaymentApprovedBy = Convert.ToInt32(userId);
                _dataContext.MembersContribution.Update(member);
                int rowAffected = await _dataContext.SaveChangesAsync();
                if (rowAffected > 0)
                    result = true;
            }

            return result;
        }
        public async Task<bool> SetMemberDiactivation(int Id, string userId)
        {
            bool result = false;

            var member = await _dataContext.MembersRegistration.FindAsync(Id);
            if (member != null)
            {
                member.IsActive = true;
                member.ModifiedOn = DateTime.UtcNow;
                member.ModifiedBy = userId;
                _dataContext.MembersRegistration.Update(member);
                int rowAffected = await _dataContext.SaveChangesAsync();
                if (rowAffected > 0)
                    result = true;
            }

            return result;
        }
        public async Task<bool> SetIsPaidAndApproved(int Id, string userId)
        {
            bool result = false;

            var member = await _dataContext.MembersRegistration.FindAsync(Id);
            if (member != null)
            {
                member.IsActive = true;
                member.ModifiedOn = DateTime.UtcNow;
                member.ModifiedBy = userId;
                member.IsPaid = true;
                //------set approve along with paid----
                member.IsApproved = true;
                member.ApprovedBy = userId;
                member.ApprovedDate = DateTime.UtcNow;

                _dataContext.MembersRegistration.Update(member);
                int rowAffected = await _dataContext.SaveChangesAsync();
                if (rowAffected > 0)
                    result = true;
            }

            return result;
        }

        public async Task<IEnumerable<MembersRegistration>> getMembersRegisteredByUser(int UserId)
        {
            try
            {
                return await _dataContext.MembersRegistration.Where(a => a.IsActive && a.CreatedBy == UserId.ToString()).ToListAsync();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
