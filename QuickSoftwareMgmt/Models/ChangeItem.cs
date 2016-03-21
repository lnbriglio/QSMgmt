using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuickSoftwareMgmt.Models
{
    public class ChangeItem
    {
        public String Applicant { get; set; }
        public String Title { get; set; }
        public String Description { get; set; }
        public DateTime Date { get; set; }
        public String Area { get; set; }
        public ChangeType Type { get; set; }
        public ChangePriority Priority { get; set; }
        public ChangeImpact Impact { get; set; }
        public bool Approved { get; set; }

    }
}
