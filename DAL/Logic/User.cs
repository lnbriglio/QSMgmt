using DAL.Intefaces;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    [MetadataType(typeof(UserMetadata))]
    public partial class User:ICompany
    {
        public bool IsCompanyValid(int companyId)
        {
            return this.CompanyId == companyId;
        }

        public String FullName
        {
            get
            { return String.Format("{0} {1}", this.FirstName, this.LastName); }
        }

    }

    public class UserMetadata
    {
        public object Id { get; set; }
        [DisplayName("Email")]
        [Required]
        [MinLength(1)]
        [MaxLength(50)]
        [EmailAddress]
        [DataType(DataType.EmailAddress)]
        public object Email { get; set; }
        [DisplayName("Contraseña")]
        [Required]
        [MinLength(1)]
        [MaxLength(50)]
        public object Password { get; set; }
        [DisplayName("Nombre")]
        [Required]
        [MinLength(1)]
        [MaxLength(25)]
        public object FirstName { get; set; }
        [DisplayName("Apellido")]
        [Required]
        [MinLength(1)]
        [MaxLength(25)]
        public object LastName { get; set; }

        [DisplayName("Empresa")]
        public object CompanyId { get; set; }

        public object Erased { get; set; }
    }
}
