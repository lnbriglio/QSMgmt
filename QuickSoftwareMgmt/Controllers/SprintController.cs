using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DAL;
using QuickSoftwareMgmt.Models.Hicharts.AreaChart;
using QuickSoftwareMgmt.Models.Hicharts;

namespace QuickSoftwareMgmt.Controllers
{
    public class SprintController : BaseController
    {
        private QSMgmtEntities db = new QSMgmtEntities();

        // GET: /Sprint/
        public async Task<ActionResult> Index()
        {
            var sprints = db.Sprints
                .Where(s => !s.Erased
                && s.ProjectId == SelectedProjectId)
                .Include(s => s.Project);
            return View(await sprints.ToListAsync());
        }

        // GET: /Sprint/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sprint sprint = await db.Sprints.FindAsync(id);
            if (sprint == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(sprint);

            return View(sprint);
        }

        // GET: /Sprint/Create
        public ActionResult Create()
        {
            var sprint = new Sprint
            {
                ProjectId = SelectedProjectId.Value,
                StartDate = DateTime.Today,
                EndDate = DateTime.Today
            };

            return View(sprint);
        }

        // POST: /Sprint/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Name,StartDate,EndDate,ProjectId")] Sprint sprint)
        {
            if (ModelState.IsValid)
            {
                db.Sprints.Add(sprint);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(sprint);
        }

        // GET: /Sprint/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sprint sprint = await db.Sprints.FindAsync(id);
            if (sprint == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(sprint);

            return View(sprint);
        }

        // POST: /Sprint/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Name,StartDate,EndDate,ProjectId")] Sprint sprint)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sprint).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(sprint);
        }

        // GET: /Sprint/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sprint sprint = await db.Sprints.FindAsync(id);
            if (sprint == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(sprint);

            return View(sprint);
        }

        // POST: /Sprint/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Sprint sprint = await db.Sprints.FindAsync(id);
            sprint.Erased = true;
            db.Entry(sprint).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<ActionResult> Kanban()
        {
            return View();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public async Task<JsonResult> GetBurndownChart()
        {
            var sprintId = SelectedSprintId;
            var sprint = await db.Sprints
                .FindAsync(sprintId);

            //var team = await db.Teams
            //    .Include(t => t.TeamMembers)
            //    .FirstOrDefaultAsync(t => !t.Erased && t.ProjectId == SelectedProjectId);

            //var teamDailyCapacity = team.TeamMembers
            //    .Where(t => !t.Erased)
            //    .Sum(t => t.Capacity);

            int totalWorkLoad = await db.Tasks
                .Where(t => !t.Erased
                && t.SprintId == sprintId)
                .SumAsync(t => t.EstimatedTime);

            var workableDates = new List<DateTime>();
            var sprintDuration = (int)(sprint.EndDate - sprint.StartDate).TotalDays;

            for (int i = 0; i <= sprintDuration; i++)
            {
                var date = sprint.StartDate.AddDays(i);
                if (!(date.DayOfWeek == DayOfWeek.Saturday || date.DayOfWeek == DayOfWeek.Sunday))
                {
                    workableDates.Add(date);
                }
            }


            var sprintTaskUpdates = await db.TaskUpdates
                .Where(u => !u.Erased
                    && u.Task.SprintId == sprintId
                    && u.EventDate >= sprint.StartDate
                    && u.EventDate <= sprint.EndDate)
                    .ToListAsync();

            int idealDailyBurn = 0;
            if (workableDates.Count > 0)
                idealDailyBurn = (int)Math.Ceiling(totalWorkLoad / (workableDates.Count * 1.0f));

            var idealBurn = new List<int>();
            var actualBurn = new List<int>();

            var burned = totalWorkLoad;
            for (int i = 0; i < workableDates.Count; i++)
            {
                var date = workableDates[i];
                //Ideal
                if (totalWorkLoad - i * idealDailyBurn > 0)
                    idealBurn.Add(totalWorkLoad - i * idealDailyBurn);
                else
                    idealBurn.Add(0);
                //Actual
                burned-= sprintTaskUpdates
                    .Where(u => u.EventDate.Date == date)
                    .Sum(u => u.ElapsedTime);
                actualBurn.Add(burned);
                
            }

            var series = new List<Series>();
            series.Add(new Series
            {
                data = idealBurn.ToArray(),
                name = "Ideal burn"
            });

            series.Add(new Series
            {
                data = actualBurn.ToArray(),
                name = "Actual burn"
            });

            AreaChart areachart = null;

            areachart = new AreaChart
            {
                chart = new Chart
                {
                    type = "areaspline"
                },
                title = new Title
                {
                    text = ""
                },
                //subtitle = new Subtitle
                //{
                //    text = ""
                //},
                xAxis = new Xaxis
                {
                    //allowDecimals = false,
                    title = new Title{
                        text = "Fecha"
                    },
                    labels = new Labels
                    {
                        format = "{value}"
                    },
                    categories = workableDates.Select(d => d.ToString("{dd/MM}")).ToArray()
                },
                yAxis = new Yaxis
                {
                    title = new Title
                    {
                        text = "Horas"
                    },
                    labels = new Labels
                    {
                        format = "{value}"
                    }
                },
                tooltip = new Tooltip
                {
                    pointFormat = "{point.y} horas"
                },
                plotOptions = new Plotoptions
                {
                    area = new Area
                    {
                        pointStart = 0,
                        marker = new Marker
                        {
                            enabled = false,
                            symbol = "circle",
                            radius = 2,
                            states = new States
                            {
                                hover = new Hover
                                {
                                    enabled = true
                                }
                            }
                        }
                    }
                },
                series = series.ToArray(),
                exporting = Exportable.GetDefault("Burndown"),
            };



            return Json(areachart, JsonRequestBehavior.AllowGet);
        }
    }
}
