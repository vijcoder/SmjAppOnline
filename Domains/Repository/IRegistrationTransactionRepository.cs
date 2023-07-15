using Domains.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Domains.Repository
{
    public interface IRegistrationTransactionRepository
    {
        IEnumerable<RegTransactionOffline> GetAllOffline();
        IEnumerable<RegistrationTransactions> GetAll();
        Task<IEnumerable<RegistrationTransactions>> GetAllAsync();
        Task<RegistrationTransactions> InsertRegistrationPayment(RegistrationTransactions model);

        Task<RegistrationTransactions> UpdateRegistrationPayment(RegistrationTransactions model);

        Task<RegTransactionOffline> InsertOfflineRegPayment(RegTransactionOffline model);

    }
}
