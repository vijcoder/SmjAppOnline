using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SmjApp.ViewModels
{
    public class MultiSelectMembersList
    {
        #region Properties  

        /// <summary>  
        /// Gets or sets choose multiple countries property.  
        /// </summary>  
        [Required]
        [Display(Name = "Choose Multiple Members")]
        public List<int> SelectedMultiMembersId { get; set; }

        /// <summary>  
        /// Gets or sets selected countries property.  
        /// </summary>  
        public List<MembersObj> SelectedMembersLst { get; set; }

        #endregion
    }
}
