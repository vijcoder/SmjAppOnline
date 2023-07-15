using Domains.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Text;

namespace Infrastructure.Mapping
{
    [ExcludeFromCodeCoverage]
    public class MembersRegistrationMap : IEntityTypeConfiguration<MembersRegistration>
    {
        public void Configure(EntityTypeBuilder<MembersRegistration> builder)
        {
            builder.HasKey(t => t.Id);
            builder.Property(t => t.MemberCode).IsRequired();
            builder.Property(t => t.Initials).IsRequired(false);
            builder.Property(t => t.Fullname).IsRequired();

            builder.Property(t => t.MobileNo).IsRequired();
            builder.Property(t => t.EmailId).IsRequired(); 

            builder.Property(t => t.Villagename).IsRequired();

            builder.Property(t => t.DOB).IsRequired();
            builder.Property(t => t.AgeProofImage).IsRequired();

            builder.Property(t => t.IsPaid);
            builder.Property(t => t.IsExpired);
            builder.Property(t => t.IsActive);
            builder.Property(t => t.CreatedOn);
            builder.Property(t => t.CreatedBy);

            builder.Property(t => t.ModifiedBy);
            builder.Property(t => t.ModifiedOn);
        }
    }
}
