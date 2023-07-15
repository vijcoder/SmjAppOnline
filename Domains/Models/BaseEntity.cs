using System;
using System.Collections.Generic;
using System.Text;

namespace Domains.Models
{
    public interface IBaseEntity
    {/// <summary>
     /// Identifier of the model
     /// </summary>
        int Id { get; set; }
    }
}
