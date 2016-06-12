using DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuickSoftwareMgmt.Models.Views
{
    public class TestVM
    {
        public int Id { get; set; }
        [DisplayName("Título")]
        [Required]
        [MinLength(1)]
        [MaxLength(255)]
        public String Title { get; set; }
        [DisplayName("Descripción")]
        public String Description { get; set; }
        [DisplayName("Fecha de creación")]
        public DateTime CreationDate { get; set; }
        [DisplayName("Proyecto")]
        [Required]
        public int ProjectId { get; set; }
        [DisplayName("Pasos para reproducirlo")]
        public String Steps { get; set; }
        [DisplayName("Incidente por nueva versión")]
        [Required]
        public int VersionOriginId { get; set; }
        [DisplayName("Exitoso")]
        [Required]
        public int TestOutcomeId { get; set; }

        //Task
        public int TaskId { get; set; }
        public int TaskStateId { get; set; }
        [DisplayName("Tiempo restante")]
        [Required]
        [Range(0, 999)]
        public int RemainingTime { get; set; }
        [DisplayName("Tiempo estimado")]
        [Required]
        [Range(0, 999)]
        public int EstimatedTime { get; set; }
        [DisplayName("Sprint")]
        public int? SprintId { get; set; }
        [DisplayName("Usuario")]
        public int? UserId { get; set; }


        public Test ToEntity()
        {
            var test = new Test
            {
                CreationDate = this.CreationDate,
                Description = this.Description,
                Id = this.Id,
                ProjectId = this.ProjectId,
                Steps = this.Steps,
                Tasks = new List<Task>(),
                TestOutcomeId = this.TestOutcomeId,
                Title = this.Title,
                VersionOriginId = this.VersionOriginId,
            };

            test.Tasks.Add(new Task
            {
                Id = this.TaskId,
                CreationDate = this.CreationDate,
                Description = this.Description,
                EstimatedTime = this.EstimatedTime,
                SprintId = this.SprintId,
                RemainingTime = this.RemainingTime,
                Title = this.Title,
                UserId = this.UserId,
                TaskStateId = this.TaskStateId==0?(int)TaskStateEnum.ToDo:this.TaskStateId,//Default
                BacklogItemId = this.Id,
            });

            return test;
        }

        public TestVM FromEntity(Test entity)
        {
            var testVM = new TestVM
            {
                CreationDate = entity.CreationDate,
                Description = entity.Description,
                Id = entity.Id,
                ProjectId = entity.ProjectId,
                Steps = entity.Steps,
                TestOutcomeId = entity.TestOutcomeId,
                Title = entity.Title,
                VersionOriginId = entity.VersionOriginId,
            };

            //task
            var task = entity.Tasks.FirstOrDefault();
            if (task != null)
            {
                testVM.EstimatedTime = task.EstimatedTime;
                testVM.RemainingTime = task.RemainingTime;
                testVM.TaskId = task.Id;
                testVM.UserId = task.UserId;
                testVM.SprintId = task.SprintId;
                testVM.TaskStateId = task.TaskStateId;
            }

            return testVM;
        }
    }
}