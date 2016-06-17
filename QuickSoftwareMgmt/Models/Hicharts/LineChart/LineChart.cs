using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuickSoftwareMgmt.Models.Hicharts.LineChart
{

    public class LineChart
    {
        public Title title { get; set; }
        public Subtitle subtitle { get; set; }
        public Xaxis xAxis { get; set; }
        public Yaxis yAxis { get; set; }
        public Tooltip tooltip { get; set; }
        public Legend legend { get; set; }
        public Series[] series { get; set; }
        public Exportable exporting { get; set; }
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
        public Title title { get; set; }
        public string[] categories { get; set; }
    }

    public class Yaxis
    {
        public Title title { get; set; }
        public Plotline[] plotLines { get; set; }
    }

    public class Plotline
    {
        public int value { get; set; }
        public int width { get; set; }
        public string color { get; set; }
    }

    public class Tooltip
    {
        public string valueSuffix { get; set; }
    }

    public class Legend
    {
        public string layout { get; set; }
        public string align { get; set; }
        public string verticalAlign { get; set; }
        public int borderWidth { get; set; }
    }

    public class Series
    {
        public string name { get; set; }
        public int[] data { get; set; }
    }

}