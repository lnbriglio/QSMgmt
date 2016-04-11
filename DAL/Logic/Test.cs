using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    [MetadataType(typeof(TestMetadata))]
    public partial class Test
    {
        public override bool IsTest
        {
            get
            {
                return true;
            }
        }
    }

    public class TestMetadata
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
        [DataType(DataType.Date)]
        public object CreationDate { get; set; }
        [DisplayName("Proyecto")]
        [Required]
        public object ProjectId { get; set; }
        [DisplayName("Pasos para reproducirlo")]
        public object Steps { get; set; }
        [DisplayName("Incidente por nueva versión")]
        [Required]
        public object VersionOriginId { get; set; }
        [DisplayName("Exitoso")]
        [Required]
        public object TestOutcomeId { get; set; }
    }
}
