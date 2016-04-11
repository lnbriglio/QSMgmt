using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    [MetadataType(typeof(TeamMemberMetadata))]
    public partial class TeamMember
    {
    }

    public class TeamMemberMetadata
    {
        [DisplayName("Usuario")]
        [Required]
        public object UserId { get; set; }
        [DisplayName("Equipo")]
        [Required]
        public object TeamId { get; set; }
        [DisplayName("Capacidad")]
        [Range(1,24)]
        public object Capacity { get; set; }
    }
}
