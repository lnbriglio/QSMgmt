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
    
    public partial class TaskState
    {
        public TaskState()
        {
            this.Tasks = new HashSet<Task>();
            this.TaskUpdates = new HashSet<TaskUpdate>();
            this.TaskUpdates1 = new HashSet<TaskUpdate>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public bool Erased { get; set; }
    
        public virtual ICollection<Task> Tasks { get; set; }
        public virtual ICollection<TaskUpdate> TaskUpdates { get; set; }
        public virtual ICollection<TaskUpdate> TaskUpdates1 { get; set; }
    }
}
