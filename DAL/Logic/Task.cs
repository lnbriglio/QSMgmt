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
    public partial class Task
    {
    }

    public class TaskMetadata
    {
        public object Id { get; set; }
        [DisplayName("Título")]
        public object Title { get; set; }
        [DisplayName("Descripción")]
        public object Description { get; set; }
        [DisplayName("Fecha de creación")]
        public object CreationDate { get; set; }
        public object Erased { get; set; }
        [DisplayName("Tiempo restante")]
        public object RemainingTime { get; set; }
        [DisplayName("Estado")]
        public object TaskStateId { get; set; }
        [DisplayName("Sprint")]
        public object SprintId { get; set; }
        [DisplayName("Padre")]
        public object BacklogItemId { get; set; }
        [DisplayName("Usuario")]
        public object UserId { get; set; }
    }
}
