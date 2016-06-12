using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuickSoftwareMgmt.Models.Hicharts
{
    public class Exportable
    {
        public bool enabled { get; set; }
        public String filename { get; set; }

        public String type { get; set; }


        public static Exportable GetDefault(String name)
        {
            return new Exportable
            {
                enabled = true,
                filename = String.Format("{1:dd/MM/yyyy}_{0}", name,DateTime.Today),
                type = TYPE_PNG,
            };
        }

        public static String TYPE_PNG = "image/png";
        public static String TYPE_JPEG = "image/jpeg";
        public static String TYPE_PDF = "application/pdf";
    }
}