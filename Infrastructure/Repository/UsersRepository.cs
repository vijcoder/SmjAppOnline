using Domains.Models;
using Domains.Repository;
using Domains.ViewModels;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Repository
{
    public class UsersRepository : IUsersRepository
    {
        private readonly IConfiguration _configuration;
        private readonly DataContext _dataContext;

        public UsersRepository(IConfiguration configuration, DataContext dataContext)
        {
            this._configuration = configuration;
            this._dataContext = dataContext;
        }

        public async Task<IList<Users>> GetUsers()
        {
            return await _dataContext.Users.ToListAsync();
        }
        public async Task<Users> GetUserById(int Id)
        {
            return await _dataContext.Users.FindAsync(Id);
        }
        public Users GetUserByEmail(string emailId)
        {
            return  _dataContext.Users.Where(u => u.EmailId == emailId).FirstOrDefault();
        }
        public async Task<IList<UserMembersMapping>> GetUsersMemberMapping(int UserId)
        {
            return await _dataContext.UserMembersMapping.Where(a => a.UserId == UserId).ToListAsync();
        }

        public async Task<Users> Registration(Users users)
        {
            await _dataContext.Users.AddAsync(users);
            await _dataContext.SaveChangesAsync();
            return users;
        }

        public async Task<Tuple<UserMembersMapping, bool>> InserMapping(UserMembersMapping model)
        {
            //bool isExists = await _dataContext.UserMembersMapping.AnyAsync(m => m.MemberCode == model.MemberCode && m.UserId == model.UserId);
            bool isExists = await _dataContext.UserMembersMapping.AnyAsync(m => m.MemberCode == model.MemberCode);
            if (!isExists)
            {
                await _dataContext.UserMembersMapping.AddAsync(model);
                await _dataContext.SaveChangesAsync();
                return Tuple.Create(model, false);
            }
            else return Tuple.Create(model, true);
        }

        public bool CheckExistingEmail(string EmailId)
        {
            return _dataContext.Users.Any(e => e.EmailId == EmailId); 
        }

        public async Task<IList<UserMembersMappingDetais>> GetUserMembersMappingDetais()
        {
            var resut = await (from a in _dataContext.UserMembersMapping
                               join b in _dataContext.Users on a.UserId equals b.Id
                               join c in _dataContext.MembersRegistration on a.MemberCode equals c.MemberCode
                               select new UserMembersMappingDetais
                               {
                                   Id = a.Id,
                                   UserId = a.UserId,
                                   Username = b.Name,
                                   UserMobileNo = b.MobileNo,
                                   MemberCode = a.MemberCode,
                                   Membername = c.Initials + " " + c.Fullname,
                                   MemberMobileNo = c.MobileNo,
                                   IsApproved = a.IsApproved,
                                   ApprovedOn = a.ApprovedOn,
                                   ApprovedBy = a.ApprovedBy,
                                   CreatedOn = a.CreatedOn
                               }).ToListAsync();
            return resut;
        }

        public async Task<bool> SetUserMemberMappingApproval(int Id, int UserId)
        {
            int rowAffected = 0;
            var userMappingResut = await _dataContext.UserMembersMapping.FindAsync(Id);
            if(userMappingResut != null)
            {
                userMappingResut.IsApproved = true;
                userMappingResut.ApprovedBy = UserId.ToString();
                userMappingResut.ApprovedOn = DateTime.UtcNow;
                _dataContext.UserMembersMapping.Update(userMappingResut);
                rowAffected = await _dataContext.SaveChangesAsync();
                if (rowAffected > 0)
                    return true;
                else
                    return false;
            }
            return false;
        }


    }
}
