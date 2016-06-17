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
using QuickSoftwareMgmt.Models.Hicharts.PieChart;
using QuickSoftwareMgmt.Models.Hicharts.LineChart;
using QuickSoftwareMgmt.Models.Hicharts;

namespace QuickSoftwareMgmt.Controllers
{
    public class ChangeController : BaseController
    {
        private QSMgmtEntities db = new QSMgmtEntities();

        // GET: /Change/
        public async Task<ActionResult> Index()
        {
            var backlogitems = db.ChangeRequests
                .Where(c => !c.Erased
                && c.ProjectId == SelectedProjectId)
                .Include(c => c.Project).Include(c => c.Approval).Include(c => c.ChangeType).Include(c => c.Impact).Include(c => c.Priority);
            return View(await backlogitems.ToListAsync());
        }

        // GET: /Change/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChangeRequest changerequest = await db.ChangeRequests.FindAsync(id);
            if (changerequest == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(changerequest);
            return View(changerequest);
        }

        // GET: /Change/Create
        public ActionResult Create()
        {
            ViewBag.ApprovalId = new SelectList(db.Approvals, "Id", "Name");
            ViewBag.ChangeTypeId = new SelectList(db.ChangeTypes, "Id", "Name");
            ViewBag.ImpactId = new SelectList(db.Impacts, "Id", "Name");
            ViewBag.PriorityId = new SelectList(db.Priorities, "Id", "Name");

            var change = new ChangeRequest
            {
                ProjectId = SelectedProjectId.Value,
                CreationDate = DateTime.Now,
            };

            return View(change);
        }

        // POST: /Change/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Title,Description,CreationDate,ProjectId,ApprovalId,ChangeTypeId,ImpactId,PriorityId,Applicant,Area")] ChangeRequest changerequest)
        {
            if (ModelState.IsValid)
            {
                db.BacklogItems.Add(changerequest);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.ApprovalId = new SelectList(db.Approvals, "Id", "Name", changerequest.ApprovalId);
            ViewBag.ChangeTypeId = new SelectList(db.ChangeTypes, "Id", "Name", changerequest.ChangeTypeId);
            ViewBag.ImpactId = new SelectList(db.Impacts, "Id", "Name", changerequest.ImpactId);
            ViewBag.PriorityId = new SelectList(db.Priorities, "Id", "Name", changerequest.PriorityId);
            return View(changerequest);
        }

        // GET: /Change/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChangeRequest changerequest = await db.ChangeRequests.FindAsync(id);
            if (changerequest == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(changerequest);

            ViewBag.ApprovalId = new SelectList(db.Approvals, "Id", "Name", changerequest.ApprovalId);
            ViewBag.ChangeTypeId = new SelectList(db.ChangeTypes, "Id", "Name", changerequest.ChangeTypeId);
            ViewBag.ImpactId = new SelectList(db.Impacts, "Id", "Name", changerequest.ImpactId);
            ViewBag.PriorityId = new SelectList(db.Priorities, "Id", "Name", changerequest.PriorityId);
            return View(changerequest);
        }

        // POST: /Change/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Title,Description,CreationDate,ProjectId,ApprovalId,ChangeTypeId,ImpactId,PriorityId,Applicant,Area")] ChangeRequest changerequest)
        {
            if (ModelState.IsValid)
            {
                db.Entry(changerequest).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.ApprovalId = new SelectList(db.Approvals, "Id", "Name", changerequest.ApprovalId);
            ViewBag.ChangeTypeId = new SelectList(db.ChangeTypes, "Id", "Name", changerequest.ChangeTypeId);
            ViewBag.ImpactId = new SelectList(db.Impacts, "Id", "Name", changerequest.ImpactId);
            ViewBag.PriorityId = new SelectList(db.Priorities, "Id", "Name", changerequest.PriorityId);
            return View(changerequest);
        }

        // GET: /Change/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChangeRequest changerequest = await db.ChangeRequests.FindAsync(id);
            if (changerequest == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(changerequest);

            return View(changerequest);
        }

        // POST: /Change/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            ChangeRequest changerequest = await db.ChangeRequests.FindAsync(id);
            changerequest.Erased = true;
            db.Entry(changerequest).State = EntityState.Modified;
            try
            {
                await db.SaveChangesAsync();
            }
            catch (Exception ex)
            {

            }
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public async Task<JsonResult> GetChangesUrgencyByDateChart()
        {
            int maxDaysBack = -15;

            var startDate = DateTime.Today.AddDays(maxDaysBack);//Take changes from the last 15 days

            var priorities = await db.Priorities.ToListAsync();

            var dates = new List<DateTime>();
            for (int i = maxDaysBack; i <= 0; i++)
            {
                dates.Add(DateTime.Today.AddDays(i));
            }

            var series = new Models.Hicharts.LineChart.Series[priorities.Count];

            for (int i = 0; i < priorities.Count; i++)
            {
                var priorityId = priorities[i].Id;

                var changes = await db.ChangeRequests

    .Where(c => !c.Erased
        && c.ProjectId == SelectedProjectId
        && c.PriorityId == priorityId
    && c.CreationDate > startDate)
    .GroupBy(c => DbFunctions.CreateDateTime(c.CreationDate.Year, c.CreationDate.Month, c.CreationDate.Day, 0, 0, 0))
    .Select(gc => new
    {
        TimeStamp = gc.Key.Value,
        Count = gc.Count()
    })
    .ToArrayAsync();

                series[i] = new Models.Hicharts.LineChart.Series
                {
                    name = priorities[i].Name,
                    data = dates.Select(d =>
                    {
                        var change = changes.FirstOrDefault(c => c.TimeStamp == d);
                        int count = 0;
                        if (change != null) count = change.Count;
                        return count;
                    }).ToArray()
                };
            }

            var lineChart = new LineChart
            {
                title = new QuickSoftwareMgmt.Models.Hicharts.LineChart.Title
                {
                    text = ""
                },
                subtitle = new Subtitle
                {
                    text = ""
                },
                xAxis = new Xaxis
                {
                    title= new QuickSoftwareMgmt.Models.Hicharts.LineChart.Title{
                        text = "Fechas"
                    },
                    categories = dates.Select(d => d.ToString("{dd/MM}")).ToArray()
                },
                yAxis = new Yaxis
                {
                    title = new Models.Hicharts.LineChart.Title
                    {
                        text="Cantidad de cambios"
                    },
                    plotLines = new Plotline[]{
                        new Plotline{
                            value = 0,
                            width = 1,
                            color = "#808080"
                        }
                    }
                },
                tooltip = new Models.Hicharts.LineChart.Tooltip
                {
                    valueSuffix = "Cambios"
                },
                legend = new Legend
                {
                    layout = "vertical",
                    align = "right",
                    verticalAlign = "middle",
                    borderWidth = 0
                },
                series = series,
                exporting = Exportable.GetDefault("Urgencia de cambios por fecha"),
            };



            return Json(lineChart, JsonRequestBehavior.AllowGet);
        }


        public async Task<JsonResult> GetChangesByPriorityChart()
        {
            var changesByPriority = await db.ChangeRequests
                .Where(c => !c.Erased
                && c.ProjectId == SelectedProjectId)
                .GroupBy(c => c.Priority)
                .Select(c => new
                {
                    Name = c.Key.Name,
                    Quantity = c.Count()
                })
                .ToArrayAsync();

            var data = changesByPriority.Select(c => new Datum
            {
                name = c.Name,
                y = c.Quantity
            }).ToArray();

            var chart = GetBasePieChart("Cambios por prioridad", data);

            return Json(chart, JsonRequestBehavior.AllowGet);
        }

        public async Task<JsonResult> GetChangesByTypeChart()
        {
            var changesByPriority = await db.ChangeRequests
                .Where(c => !c.Erased
                && c.ProjectId == SelectedProjectId)
                .GroupBy(c => c.ChangeType)
                .Select(c => new
                {
                    Name = c.Key.Name,
                    Quantity = c.Count()
                })
                .ToArrayAsync();

            var data = changesByPriority.Select(c => new Datum
            {
                name = c.Name,
                y = c.Quantity
            }).ToArray();

            var chart = GetBasePieChart("Cambios por tipo", data);

            return Json(chart, JsonRequestBehavior.AllowGet);
        }

        public async Task<JsonResult> GetChangesByImpact()
        {
            var changesByPriority = await db.ChangeRequests
                .Where(c => !c.Erased
                && c.ProjectId == SelectedProjectId)
                .GroupBy(c => c.Impact)
                .Select(c => new
                {
                    Name = c.Key.Name,
                    Quantity = c.Count()
                })
                .ToArrayAsync();

            var data = changesByPriority.Select(c => new Datum
            {
                name = c.Name,
                y = c.Quantity
            }).ToArray();

            var chart = GetBasePieChart("Cambios por impacto", data);

            return Json(chart, JsonRequestBehavior.AllowGet);
        }

        public async Task<JsonResult> GetEmergencyChangesCount()
        {
            var changesCount = await db.ChangeRequests
                .Where(c => !c.Erased
                    && c.ProjectId == SelectedProjectId
                && c.ChangeTypeId == (int)ChangeTypeEnum.Emergency)
                .CountAsync();

            return Json(changesCount, JsonRequestBehavior.AllowGet);
        }

        public async Task<JsonResult> GetPendingApprovalsCount()
        {
            var changesCount = await db.ChangeRequests
                .Where(c => !c.Erased
                    && c.ProjectId == SelectedProjectId
                && c.ApprovalId == (int)ApprovalEnum.No)
                .CountAsync();

            return Json(changesCount, JsonRequestBehavior.AllowGet);
        }





        private PieChart GetBasePieChart(String seriesName, Datum[] data)
        {
            return new PieChart
                {
                    chart = new Chart
                    {
                        plotBackgroundColor = null,
                        plotBorderWidth = null,
                        plotShadow = false,
                        type = "pie"
                    },
                    title = new QuickSoftwareMgmt.Models.Hicharts.PieChart.Title
                    {
                        text = ""
                    },
                    tooltip = new QuickSoftwareMgmt.Models.Hicharts.PieChart.Tooltip
                    {
                        pointFormat = "{series.name}: <b>{point.percentage:.1f}%</b>"
                    },
                    plotOptions = new Plotoptions
                    {
                        pie = new Pie
                        {
                            allowPointSelect = true,
                            cursor = "pointer",
                            dataLabels = new Datalabels
                            {
                                enabled = true,
                                format = "{point.percentage:.1f} %",
                                
                            },
                            showInLegend = true
                        }
                    },
                    series = new QuickSoftwareMgmt.Models.Hicharts.PieChart.Series[]{ 
                        new QuickSoftwareMgmt.Models.Hicharts.PieChart.Series{
                            name=seriesName,
                            colorByPoint=true,
                            data= data
                        }
                    },
                    exporting = Exportable.GetDefault(seriesName),
                };
        }

    }
}
