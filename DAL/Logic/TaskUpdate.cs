using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    [MetadataType(typeof(TaskUpdateMetadata))]
    public partial class TaskUpdate
    {
    }

    public class TaskUpdateMetadata
    {
        public object Id { get; set; }
        [DisplayName("Comentario")]
        public object Comment { get; set; }
        [DisplayName("Fecha del evento")]
        public object EventDate { get; set; }
        public object Erased { get; set; }
        [DisplayName("Tiempo invertido")]
        public object ElapsedTime { get; set; }
        [DisplayName("Tarea")]
        public object TaskId { get; set; }
        [DisplayName("Estado anterior")]
        public object PreviousTaskStateId { get; set; }
        [DisplayName("Estado")]
        public object TaskStateId { get; set; }
    }
}
