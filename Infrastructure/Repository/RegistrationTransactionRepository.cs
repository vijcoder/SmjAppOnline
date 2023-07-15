using Domains.Models;
using Domains.Repository;
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
    public class RegistrationTransactionRepository : IRegistrationTransactionRepository
    {
        private readonly IConfiguration _configuration;
        private readonly DataContext _dataContext;

        public RegistrationTransactionRepository(IConfiguration configuration, DataContext dataContext)
        {
            this._configuration = configuration;
            this._dataContext = dataContext;
        }
        public IEnumerable<RegTransactionOffline> GetAllOffline()
        {
            return _dataContext.RegTransactionOffline.OrderByDescending(m => m.MemberCode).ToList();
        }
        public IEnumerable<RegistrationTransactions> GetAll()
        {
            return _dataContext.RegistrationTransactions.OrderByDescending(m => m.MemberCode).ToList();
        }
        public async Task<IEnumerable<RegistrationTransactions>> GetAllAsync()
        {
            return await _dataContext.RegistrationTransactions.OrderByDescending(m => m.MemberCode).ToListAsync(); 
        }
        public async Task<RegistrationTransactions> InsertRegistrationPayment(RegistrationTransactions model)
        {
            try
            {
                await _dataContext.RegistrationTransactions.AddAsync(model);
                await _dataContext.SaveChangesAsync();
                return model;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
        public async Task<RegTransactionOffline> InsertOfflineRegPayment(RegTransactionOffline model)
        {
            try
            {
                await _dataContext.RegTransactionOffline.AddAsync(model);
                await _dataContext.SaveChangesAsync();
                return model;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public async Task<RegistrationTransactions> UpdateRegistrationPayment(RegistrationTransactions model)
        {
            try
            {
                _dataContext.RegistrationTransactions.Update(model);
                int rowsAffected = await _dataContext.SaveChangesAsync();
                return model;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

    }
}
