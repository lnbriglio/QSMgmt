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
    [MetadataType(typeof(TaskMetadata))]
    public partial class Task:ICompany
    {
        public bool IsCompanyValid(int companyId)
        {
            return this.BacklogItem.Project.CompanyId == companyId;
        }

    }

    public class TaskMetadata
    {
        public object Id { get; set; }
        [DisplayName("Título")]
        [Required]
        [MinLength(1)]
        [MaxLength(255)]
        public object Title { get; set; }
        [DisplayName("Descripción")]
        public object Description { get; set; }
        [DisplayName("Fecha de creación")]
        [DataType(DataType.Date)]
        public object CreationDate { get; set; }
        [DisplayName("Tiempo restante")]
        [Required]
        [Range(0,999)]
        public object RemainingTime { get; set; }
        [DisplayName("Tiempo estimado")]
        [Required]
        [Range(0,999)]
        public object EstimatedTime { get; set; }
        [DisplayName("Estado")]
        [Required]
        public object TaskStateId { get; set; }
        [DisplayName("Sprint")]
        public object SprintId { get; set; }
        [DisplayName("Padre")]
        [Required]
        public object BacklogItemId { get; set; }
        [DisplayName("Usuario")]
        public object UserId { get; set; }
    }
}
