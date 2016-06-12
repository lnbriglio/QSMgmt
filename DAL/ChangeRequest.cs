//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class ChangeRequest : BacklogItem
    {
        public int ApprovalId { get; set; }
        public int ChangeTypeId { get; set; }
        public int ImpactId { get; set; }
        public int PriorityId { get; set; }
        public string Applicant { get; set; }
        public string Area { get; set; }
    
        public virtual Approval Approval { get; set; }
        public virtual ChangeType ChangeType { get; set; }
        public virtual Impact Impact { get; set; }
        public virtual Priority Priority { get; set; }
    }
}
