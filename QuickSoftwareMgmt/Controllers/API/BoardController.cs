using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data.Entity;
using Newtonsoft.Json.Linq;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace QuickSoftwareMgmt.Controllers.API
{
    public class BoardController : ApiController
    {
        private QSMgmtEntities db = new QSMgmtEntities();

        [HttpGet]
        public async Task<HttpResponseMessage> Get(int projectId, int sprintId)
        {

            var response = Request.CreateResponse();

            var states = await db.TaskStates
                .Include(s => s.Tasks)
                .Include("Tasks.BacklogItem")
                .Include("Tasks.User")
                .ToListAsync();


            var columns = states.Select(s => new
            {
                Description = s.Name,
                Id = s.Id,
                Name = s.Name,
                Tasks = s.Tasks
                .Where(t => t.SprintId == sprintId)
                .Select(t => new
                {
                    Id = t.Id,
                    Name = t.Title,
                    Description = t.Description,
                    ColumnId = t.TaskStateId,
                    Parent = new
                    {
                        Id = t.BacklogItemId,
                        Name = t.BacklogItem.Title,
                        Description = t.BacklogItem.Description,
                        IsTest = t.BacklogItem.IsTest
                    },
                    User = new
                    {
                        Id = t.UserId,
                        Name = t.User != null ? t.User.UserName : "Sin asignar"
                    },
                    RemainingTime = t.RemainingTime
                }).ToList()
            })
            .ToList();



            response.Content = new StringContent(JsonConvert.SerializeObject(columns));
            response.StatusCode = HttpStatusCode.OK;

            return response;
        }

        [HttpGet]
        public HttpResponseMessage CanMove(int sourceColId, int targetColId)
        {
            var response = Request.CreateResponse();
            response.StatusCode = HttpStatusCode.OK;
            response.Content = new StringContent(JsonConvert.SerializeObject(new { canMove = false }));

            if (sourceColId == (targetColId - 1))
            {
                response.Content = new StringContent(JsonConvert.SerializeObject(new { canMove = true }));
            }

            return response;
        }

        [HttpPost]
        public async Task<HttpResponseMessage> MoveTask(JObject moveTaskParams)
        {
            dynamic json = moveTaskParams;
            //var repo = new BoardRepository();
            //repo.MoveTask((int)json.taskId, (int)json.targetColId);

            var task = db.Tasks.Find((int)json.taskId);
            if (task != null)
            {
                task.TaskStateId = (int)json.targetColId;
                await db.SaveChangesAsync();
            }

            var response = Request.CreateResponse();
            response.StatusCode = HttpStatusCode.OK;

            return response;
        }

    }
}
