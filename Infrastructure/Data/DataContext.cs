using Domains.Models;
using Infrastructure.Mapping;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Infrastructure.Data
{
    public class DataContext : DbContext
    {
        public DataContext() { }
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {
        }
        public DbSet<MembersRegistration> MembersRegistration { get; set; }
        public DbSet<ContributionTransactions> ContributionTransactions { get; set; }
        public DbSet<RegistrationTransactions> RegistrationTransactions { get; set; }
        public DbSet<MembersContribution> MembersContribution { get; set; }

        public DbSet<RegTransactionOffline> RegTransactionOffline { get; set; }

        public DbSet<Users> Users { get; set; }

        public DbSet<UserMembersMapping> UserMembersMapping { get; set; }

        //protected override void OnModelCreating(ModelBuilder modelBuilder)
        //{ 
        //    base.OnModelCreating(modelBuilder);
        //    //modelBuilder.ApplyConfiguration(new MembersRegistrationMap());
        //}
    }
}
