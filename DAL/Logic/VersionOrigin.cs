using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    [MetadataType(typeof(VersionOriginMetadata))]
    public partial class VersionOrigin
    {
    }

    public class VersionOriginMetadata
    {
        public object Id { get; set; }
        [DisplayName("Nombre")]
        public object Name { get; set; }
        public object Erased { get; set; }
    }
}
