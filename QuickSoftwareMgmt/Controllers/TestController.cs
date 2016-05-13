﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DAL;

namespace QuickSoftwareMgmt.Controllers
{
    public class TestController : BaseController
    {
        private QSMgmtEntities db = new QSMgmtEntities();

        // GET: /Test/
        public async Task<ActionResult> Index()
        {
            var tests = db.Tests
                .Where(t => !t.Erased
                    && t.ProjectId == SelectedProjectId)
                .Include(t => t.Project).Include(t => t.TestOutcome).Include(t => t.VersionOrigin);
            return View(await tests.ToListAsync());
        }

        // GET: /Test/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Test test = await db.Tests.FindAsync(id);
            if (test == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(test);

            return View(test);
        }

        // GET: /Test/Create
        public ActionResult Create()
        {
            ViewBag.TestOutcomeId = new SelectList(db.TestOutcomes, "Id", "Name");
            ViewBag.VersionOriginId = new SelectList(db.VersionOrigins, "Id", "Name");

            var test = new Test
            {
                ProjectId = SelectedProjectId.Value,
                CreationDate = DateTime.Now
            };

            return View(test);
        }

        // POST: /Test/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Title,Description,CreationDate,ProjectId,Steps,VersionOriginId,TestOutcomeId")] Test test)
        {
            if (ModelState.IsValid)
            {
                db.BacklogItems.Add(test);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.TestOutcomeId = new SelectList(db.TestOutcomes, "Id", "Name", test.TestOutcomeId);
            ViewBag.VersionOriginId = new SelectList(db.VersionOrigins, "Id", "Name", test.VersionOriginId);
            return View(test);
        }

        // GET: /Test/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Test test = await db.Tests.FindAsync(id);
            if (test == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(test);

            ViewBag.TestOutcomeId = new SelectList(db.TestOutcomes, "Id", "Name", test.TestOutcomeId);
            ViewBag.VersionOriginId = new SelectList(db.VersionOrigins, "Id", "Name", test.VersionOriginId);
            return View(test);
        }

        // POST: /Test/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Title,Description,CreationDate,ProjectId,Steps,VersionOriginId,TestOutcomeId")] Test test)
        {
            if (ModelState.IsValid)
            {
                db.Entry(test).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.TestOutcomeId = new SelectList(db.TestOutcomes, "Id", "Name", test.TestOutcomeId);
            ViewBag.VersionOriginId = new SelectList(db.VersionOrigins, "Id", "Name", test.VersionOriginId);
            return View(test);
        }

        // GET: /Test/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Test test = await db.Tests.FindAsync(id);
            if (test == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(test);

            return View(test);
        }

        // POST: /Test/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Test test = await db.Tests.FindAsync(id);
            db.BacklogItems.Remove(test);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        public async Task<JsonResult> GetIdentifiedErrorsCount()
        {
            var count = await db.Tests
                .Where(t => !t.Erased
                    && t.ProjectId == SelectedProjectId)
                .CountAsync();

            return Json(count, JsonRequestBehavior.AllowGet);
        }

        public async Task<JsonResult> GetAvgFixingTime()
        {
            double? avgTime = await db.TaskUpdates
                .Where(u => u.Task.SprintId == SelectedSprintId &&
                    u.ElapsedTime>0 &&
                    u.Task.TaskStateId == (int)TaskStateEnum.Done &&
                    u.Task.BacklogItem is Test)
                .AverageAsync(u => u.ElapsedTime);

            return Json(avgTime, JsonRequestBehavior.AllowGet);
        }

        public async Task<JsonResult> GetNewVersionErrorsCount()
        {
            var count = await db.Tests
                .Where(t => !t.Erased
                    && t.ProjectId == SelectedProjectId
                    && t.VersionOriginId == (int)VersionOriginEnum.New)
                .CountAsync();

            return Json(count, JsonRequestBehavior.AllowGet);
        }

        public async Task<JsonResult> GetServiceAcceptanceFailuresCount()
        {
            var count = await db.Tests
                .Where(t => !t.Erased
                    && t.ProjectId == SelectedProjectId
                    && t.TestOutcomeId == (int)TestOutcomeEnum.SuccessYes)
                .CountAsync();

            return Json(count, JsonRequestBehavior.AllowGet);
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
