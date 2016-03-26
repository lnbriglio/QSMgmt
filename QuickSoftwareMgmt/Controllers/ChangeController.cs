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

namespace QuickSoftwareMgmt.Controllers
{
    public class ChangeController : BaseController
    {
        private QSMgmtEntities db = new QSMgmtEntities();

        // GET: /Change/
        public async Task<ActionResult> Index()
        {
            var backlogitems = db.ChangeRequests
                .Where(c => !c.Erased)
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
            return View(changerequest);
        }

        // GET: /Change/Create
        public ActionResult Create()
        {
            ViewBag.ProjectId = new SelectList(db.Projects, "Id", "Name");
            ViewBag.Id = new SelectList(db.BacklogItems, "Id", "Title");
            ViewBag.ApprovalId = new SelectList(db.Approvals, "Id", "Name");
            ViewBag.ChangeTypeId = new SelectList(db.ChangeTypes, "Id", "Name");
            ViewBag.ImpactId = new SelectList(db.Impacts, "Id", "Name");
            ViewBag.PriorityId = new SelectList(db.Priorities, "Id", "Name");
            return View();
        }

        // POST: /Change/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Title,Description,CreationDate,ProjectId,ApprovalId,ChangeTypeId,ImpactId,PriorityId")] ChangeRequest changerequest)
        {
            if (ModelState.IsValid)
            {
                db.BacklogItems.Add(changerequest);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.ProjectId = new SelectList(db.Projects, "Id", "Name", changerequest.ProjectId);
            ViewBag.Id = new SelectList(db.BacklogItems, "Id", "Title", changerequest.Id);
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
            ViewBag.ProjectId = new SelectList(db.Projects, "Id", "Name", changerequest.ProjectId);
            ViewBag.Id = new SelectList(db.BacklogItems, "Id", "Title", changerequest.Id);
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
        public async Task<ActionResult> Edit([Bind(Include = "Id,Title,Description,CreationDate,ProjectId,ApprovalId,ChangeTypeId,ImpactId,PriorityId")] ChangeRequest changerequest)
        {
            if (ModelState.IsValid)
            {
                db.Entry(changerequest).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.ProjectId = new SelectList(db.Projects, "Id", "Name", changerequest.ProjectId);
            ViewBag.Id = new SelectList(db.BacklogItems, "Id", "Title", changerequest.Id);
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
            return View(changerequest);
        }

        // POST: /Change/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            ChangeRequest changerequest = await db.ChangeRequests.FindAsync(id);
            db.BacklogItems.Remove(changerequest);
            await db.SaveChangesAsync();
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
                && c.ProjectId == SelectedProjectId
                )
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
                    title = new Title
                    {
                        text = ""
                    },
                    tooltip = new Tooltip
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
                                enabled = false
                            },
                            showInLegend = true
                        }
                    },
                    series = new Series[]{ 
                        new Series{
                            name=seriesName,
                            colorByPoint=true,
                            data= data
                        }
                    }
                };
        }

    }
}
