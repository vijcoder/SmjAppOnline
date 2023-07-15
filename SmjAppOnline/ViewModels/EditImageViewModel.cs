using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmjApp.ViewModels
{
    public class EditImageViewModel : UploadImageViewModel
    {
        public int Id { get; set; }
        public string ExistingProfileImage { get; set; }
        public string ExistingAgeProofImage { get; set; }
    }
}
