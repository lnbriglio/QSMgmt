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
    public partial class User
    {
    }

    public class UserMetadata
    {
        public object Id { get; set; }
        [DisplayName("Nombre de usuario")]
        [Required]
        [MinLength(1)]
        [MaxLength(50)]
        public object UserName { get; set; }
        [DisplayName("Contraseña")]
        [Required]
        [MinLength(1)]
        [MaxLength(50)]
        public object Password { get; set; }
        public object Erased { get; set; }
    }
}
