using AutoMapper;
using Domains.Models;
using SmjApp.Models;
using SmjApp.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmjApp.Infrastructure.Automapper
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            this.CreateMap<MembersRegistrationModel, MembersRegistration>();
            this.CreateMap<MembersRegistration, MembersRegistrationModel>();
            //this.CreateMap<Model1, Model2>();
            this.CreateMap<ContributionTransactionsModel, ContributionTransactions>();

            this.CreateMap<RegistrationTransactionsModel, RegistrationTransactions>();

            this.CreateMap<RegistrationModel, Users>()
                .ForMember(s => s.Name, m => m.MapFrom(d => d.FullName));

            this.CreateMap<Users, RegistrationModel>()
                .ForMember(s => s.FullName, m => m.MapFrom(d=>d.Name));

        }

    }
}
