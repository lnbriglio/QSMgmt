using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial class QSMgmtEntities
    {
        public virtual DbSet<ChangeRequest> ChangeRequests { get; set; }
        public virtual DbSet<Test> Tests { get; set; }

    }
}
