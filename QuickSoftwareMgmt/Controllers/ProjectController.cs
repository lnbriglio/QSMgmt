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

namespace QuickSoftwareMgmt.Controllers
{
    public class ProjectController : BaseController
    {
        private QSMgmtEntities db = new QSMgmtEntities();

        // GET: /Project/
        public async Task<ActionResult> Index()
        {
            return View(await db.Projects
                .Where(p => !p.Erased
                && p.CompanyId == CurrentUser.CompanyId)
                .ToListAsync());
        }

        // GET: /Project/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Project project = await db.Projects.FindAsync(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(project);
            return View(project);
        }

        public async Task<ActionResult> Home()
        {
            if (SelectedProjectId == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Project project = await db.Projects.FindAsync(SelectedProjectId);
            if (project == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(project);
            return View(project);
        }

        public async Task<ActionResult> Dashboard(int? id)
        {
            if (id == null)
            {
                //return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                id = SelectedProjectId;
            }
            Project project = await db.Projects.FindAsync(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(project);
            return View(project);
        }

        // GET: /Project/Create
        public ActionResult Create()
        {
            var project = new Project
            {
                CompanyId = CurrentUser.CompanyId,
            };

            return View(project);
        }

        // POST: /Project/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Name,Description,CompanyId")] Project project)
        {
            if (ModelState.IsValid)
            {
                project.Teams.Add(new Team
                {
                    Name = "Team " + project.Name,
                });

                db.Projects.Add(project);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(project);
        }

        // GET: /Project/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Project project = await db.Projects.FindAsync(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(project);
            return View(project);
        }

        // POST: /Project/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Name,Description,CompanyId")] Project project)
        {
            if (ModelState.IsValid)
            {
                db.Entry(project).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(project);
        }

        // GET: /Project/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Project project = await db.Projects.FindAsync(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(project);
            return View(project);
        }

        // POST: /Project/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Project project = await db.Projects.FindAsync(id);
            db.Projects.Remove(project);
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

        [ChildActionOnly]
        public ActionResult List()
        {
            var projectsList = db.Projects
                .Where(p => !p.Erased
                    && p.CompanyId == CurrentUser.CompanyId)
                .OrderBy(p => p.Name)
                .ToList();

            var sprintList = db.Sprints
                .Where(s => s.ProjectId == SelectedProjectId)
                .OrderBy(s => s.Name)
                .ToList();

            ViewBag.ProjectSelector = new SelectList(projectsList, "Id", "Name", SelectedProjectId);
            ViewBag.SprintSelector = new SelectList(sprintList, "Id", "Name", SelectedSprintId);

            return PartialView();
        }

        [HttpGet]
        public ActionResult ChangeProject(int? projectId, int? sprintId)
        {
            if (projectId.HasValue)
            {
                SelectedProjectId = projectId;
                SelectedSprintId = sprintId;
                return RedirectToAction("Home");
            }
            return RedirectToAction("Index");
        }
    }
}
