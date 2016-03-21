using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuickSoftwareMgmt.Models
{
    public class TestItem
    {
        public String Title { get; set; }
        public String Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public double ElapsedTime { get; set; }
        public bool NewVersionIncident { get; set; }
        public bool Successful { get; set; }
    }
}