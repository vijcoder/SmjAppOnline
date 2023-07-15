using Domains.Models;
using Domains.Repository;
using Infrastructure.Data;
using Infrastructure.Helper;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Repository
{
    public class AuthenticateService : IAuthenticateService
    {
        private readonly IConfiguration _configuration;
        private readonly DataContext _dataContext; private readonly AppSettings _appSettings;
        public AuthenticateService(IConfiguration configuration, DataContext dataContext, IOptions<AppSettings> appSettings)
        {
            this._configuration = configuration;
            this._dataContext = dataContext; _appSettings = appSettings.Value;
        }
        public async Task<Users> GetUserByEmail(string username)
        {
            return await _dataContext.Users.Where(u => u.EmailId == username).FirstOrDefaultAsync();
        }
        public Users Authenticate(string username, string password)
        {
            Users user = null;
            try
            {
                user = _dataContext.Users.Where(x => x.EmailId == username && x.Password == password).FirstOrDefault();

                // return null if user not found
                if (user == null)
                    return null;

                //// authentication successful so generate jwt token
                //var tokenHandler = new JwtSecurityTokenHandler();
                //var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
                //var tokenDescriptor = new SecurityTokenDescriptor
                //{
                //    Subject = new ClaimsIdentity(new Claim[]
                //    {
                //    new Claim(ClaimTypes.Name, user.Id.ToString()),
                //    new Claim(ClaimTypes.Role, user.Role)
                //    }),
                //    Expires = DateTime.UtcNow.AddDays(7),
                //    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
                //};
                //var token = tokenHandler.CreateToken(tokenDescriptor);
                //user.Token = tokenHandler.WriteToken(token);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return user;
        }
    }
}
