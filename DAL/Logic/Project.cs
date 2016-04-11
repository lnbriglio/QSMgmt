using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    [MetadataType(typeof(ProjectMetadata))]
    public partial class Project
    {
    }

    public class ProjectMetadata
    {
        public object Id { get; set; }
        [DisplayName("Nombre")]
        [Required]
        [MinLength(1)]
        [MaxLength(100)]
        public object Name { get; set; }
        [DisplayName("Descripción")]
        [MaxLength(500)]
        public object Description { get; set; }
        public object Erased { get; set; }
    }
}
