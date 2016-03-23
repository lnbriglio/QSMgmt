using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    [MetadataType(typeof(TestOutcomeMetadata))]
    public partial class TestOutcome
    {
    }

    public class TestOutcomeMetadata
    {
        public object Id { get; set; }
        [DisplayName("Nombre")]
        public object Name { get; set; }
        public object Erased { get; set; }
    }
}
