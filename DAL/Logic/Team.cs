using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    [MetadataType(typeof(TeamMetadata))]
    public partial class Team
    {
    }

    public class TeamMetadata
    {
        public object Id { get; set; }
        [DisplayName("Nombre")]
        public object Name { get; set; }
        public object Erased { get; set; }
        [DisplayName("Proyecto")]
        public object ProjectId { get; set; }
    }
}
