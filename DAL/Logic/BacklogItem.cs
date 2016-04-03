using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial class BacklogItem
    {
        public virtual bool IsChange
        {
            get
            {
                return false;
            }
        }

        public virtual bool IsTest
        {
            get
            {
                return false;
            }
        }
    }
}
