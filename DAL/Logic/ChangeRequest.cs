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
        public bool IsChange
        {
            get
            {
                return true;
            }
        }
    }

    public class ChangeRequestMetada
    {
        public object Id { get; set; }
        [DisplayName("Título")]
        [Required]
        [MinLength(1)]
        [MaxLength(100)]
        public object Title { get; set; }
        [DisplayName("Descripción")]
        public object Description { get; set; }
        [DisplayName("Fecha de creación")]
        public object CreationDate { get; set; }
        [DisplayName("Proyecto")]
        [Required]
        public object ProjectId { get; set; }
        [DisplayName("Aprobación")]
        [Required]
        public int ApprovalId { get; set; }
        [DisplayName("Tipo de cambio")]
        [Required]
        public int ChangeTypeId { get; set; }
        [DisplayName("Impacto")]
        [Required]
        public int ImpactId { get; set; }
        [DisplayName("Prioridad")]
        [Required]
        public int PriorityId { get; set; }

    }
}
