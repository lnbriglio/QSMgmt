using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuickSoftwareMgmt.Models.Hicharts.AreaChart
{

    public class AreaChart
    {
        public Chart chart { get; set; }
        public Title title { get; set; }
        public Subtitle subtitle { get; set; }
        public Xaxis xAxis { get; set; }
        public Yaxis yAxis { get; set; }
        public Tooltip tooltip { get; set; }
        public Plotoptions plotOptions { get; set; }
        public Series[] series { get; set; }
        public Exportable exporting { get; set; }
    }

    public class Chart
    {
        public string type { get; set; }
    }

    public class Title
    {
        public string text { get; set; }
    }

    public class Subtitle
    {
        public string text { get; set; }
    }

    public class Xaxis
    {
        public bool allowDecimals { get; set; }
        public object labels { get; set; }

        public string[] categories { get; set; }
    }

    public class Yaxis
    {
        public Title title { get; set; }
        public object labels { get; set; }
    }

    public class Tooltip
    {
        public string pointFormat { get; set; }
    }

    public class Plotoptions
    {
        public Area area { get; set; }
    }

    public class Area
    {
        public int pointStart { get; set; }
        public Marker marker { get; set; }
    }

    public class Marker
    {
        public bool enabled { get; set; }
        public string symbol { get; set; }
        public int radius { get; set; }
        public States states { get; set; }
    }

    public class States
    {
        public Hover hover { get; set; }
    }

    public class Hover
    {
        public bool enabled { get; set; }
    }

    public class Series
    {
        public string name { get; set; }
        public int[] data { get; set; }
    }

    public class Labels
    {
        public String format { get; set; }
    }

}