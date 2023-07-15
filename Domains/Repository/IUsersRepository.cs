using Domains.Models;
using Domains.ViewModels;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Domains.Repository
{
    public interface IUsersRepository
    {
        Task<IList<Users>> GetUsers();
        Task<Users> GetUserById(int Id);
        //Task<Users> GetUserByEmail(string emailId);
        Users GetUserByEmail(string emailId);
        Task<IList<UserMembersMapping>> GetUsersMemberMapping(int UserId);
        Task<Users> Registration(Users users);
        Task<Tuple<UserMembersMapping, bool>> InserMapping(UserMembersMapping model);
        //Task<bool> CheckExistingEmail(string EmailId);
        bool CheckExistingEmail(string EmailId);

        Task<IList<UserMembersMappingDetais>> GetUserMembersMappingDetais();

        Task<bool> SetUserMemberMappingApproval(int Id, int UserId);
    }
}
