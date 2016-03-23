using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    [MetadataType(typeof(SprintMetadata))]
    public partial class Sprint
    {
    }

    public class SprintMetadata
    {
        public object Id { get; set; }
        [DisplayName("Nombre")]
        public object Name { get; set; }
        [DisplayName("Fecha de inicio")]
        public object StartDate { get; set; }
        [DisplayName("Fecha de fin")]
        public object EndDate { get; set; }
        public object Erased { get; set; }
        [DisplayName("Proyecto")]
        public object ProjectId { get; set; }
    }
}
