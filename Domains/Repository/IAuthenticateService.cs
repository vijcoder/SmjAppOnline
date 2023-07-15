using Domains.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Domains.Repository
{
    public interface IAuthenticateService
    {
        Users Authenticate(string username, string password);
        Task<Users> GetUserByEmail(string username);
    }
}
