using Domains.Models;
using Domains.Repository;
using Infrastructure.Helper;
using System;
using System.Threading.Tasks;

namespace Infrastructure.Data
{
    public static class ContextSeed
    {
        public static async Task SeedAdminAsync(IUsersRepository usersRepository)
        {
            //Seed Default User
            string salt = CryptographyProcessor.CreateSalt(128);
            var defaultUser = new Users
            {
                Name = "SuperAdmin",
                EmailId = "vijay.darji2404@gmail.com",
                MobileNo = "9029509624",
                Password = CryptographyProcessor.GenerateHash("Abcd@12345", salt),
                PasswordSalt = salt,
                ActivationCode = Guid.NewGuid().ToString(),
                ResetPasswordCode = Guid.NewGuid().ToString(),
                Role = "Admin",
                IsActive = true,
                CreatedOn = DateTime.UtcNow
            };

            var user = usersRepository.GetUserByEmail(defaultUser.EmailId);
            if(user  == null)
            {
                await usersRepository.Registration(defaultUser);
            } 

        }
    }
}
