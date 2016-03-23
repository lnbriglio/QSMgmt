using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    [MetadataType(typeof(ChangeRequestMetada))]
    public partial class ChangeRequest
    {
    }

    public class ChangeRequestMetada
    {
        public object Id { get; set; }
        [DisplayName("Título")]
        public object Title { get; set; }
        [DisplayName("Descripción")]
        public object Description { get; set; }
        [DisplayName("Fecha de creación")]
        public object CreationDate { get; set; }
        [DisplayName("Proyecto")]
        public object ProjectId { get; set; }
        [DisplayName("Aprobación")]
        public int ApprovalId { get; set; }
        [DisplayName("Tipo de cambio")]
        public int ChangeTypeId { get; set; }
        [DisplayName("Impacto")]
        public int ImpactId { get; set; }
        [DisplayName("Prioridad")]
        public int PriorityId { get; set; }

    }
}
