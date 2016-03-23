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
    }

    public class TestMetadata
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

        [DisplayName("Pasos para reproducirlo")]
        public object Steps { get; set; }
        [DisplayName("Incidente por nueva versión")]
        public object VersionOriginId { get; set; }
        [DisplayName("Exitoso")]
        public object TestOutcomeId { get; set; }
    }
}
