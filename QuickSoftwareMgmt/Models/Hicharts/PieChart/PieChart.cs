using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuickSoftwareMgmt.Models.Hicharts.PieChart
{
    public class PieChart
    {
        public Chart chart { get; set; }
        public Title title { get; set; }
        public Tooltip tooltip { get; set; }
        public Plotoptions plotOptions { get; set; }
        public Series[] series { get; set; }
        public Exportable exporting { get; set; }
    }

    public class Chart
    {
        public object plotBackgroundColor { get; set; }
        public object plotBorderWidth { get; set; }
        public bool plotShadow { get; set; }
        public string type { get; set; }
    }

    public class Title
    {
        public string text { get; set; }
    }

    public class Tooltip
    {
        public string pointFormat { get; set; }
    }

    public class Plotoptions
    {
        public Pie pie { get; set; }
    }

    public class Pie
    {
        public bool allowPointSelect { get; set; }
        public string cursor { get; set; }
        public Datalabels dataLabels { get; set; }
        public bool showInLegend { get; set; }
    }

    public class Datalabels
    {
        public bool enabled { get; set; }
    }

    public class Series
    {
        public string name { get; set; }
        public bool colorByPoint { get; set; }
        public Datum[] data { get; set; }
    }

    public class Datum
    {
        public string name { get; set; }
        public float y { get; set; }
        public bool sliced { get; set; }
        public bool selected { get; set; }
    }



}