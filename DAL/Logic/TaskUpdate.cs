﻿using System;
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
        [DataType(DataType.Date)]
        public object EventDate { get; set; }
        [DisplayName("Tiempo invertido")]
        [Required]
        [Range(0,999)]
        public object ElapsedTime { get; set; }
        [DisplayName("Tarea")]
        [Required]
        public object TaskId { get; set; }
        [DisplayName("Estado anterior")]
        [Required]
        public object PreviousTaskStateId { get; set; }
        [DisplayName("Estado")]
        [Required]
        public object TaskStateId { get; set; }
    }
}
