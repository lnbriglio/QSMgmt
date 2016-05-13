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
    public class TeamController : BaseController
    {
        private QSMgmtEntities db = new QSMgmtEntities();

        // GET: /Team/
        public async Task<ActionResult> Index()
        {
            var teams = db.Teams
                .Where(t => !t.Erased
                && t.Project.CompanyId == CurrentUser.CompanyId)
                .Include(t => t.Project);
            return View(await teams.ToListAsync());
        }

        // GET: /Team/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Team team = await db.Teams.FindAsync(id);
            if (team == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(team);

            return View(team);
        }

        public async Task<ActionResult> EditMembers(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Team team = await db.Teams
                .Include(t => t.TeamMembers)
                .FirstOrDefaultAsync(t => t.Id == id);
            if (team == null)
            {
                return HttpNotFound();
            }

            var users = await db.Users
                .Where(u => !u.Erased
                && u.CompanyId == CurrentUser.CompanyId)
                .ToListAsync();

            ViewBag.UserId = new SelectList(users, "Id", "FullName");

            return View(team);
        }

        [HttpPost]
        public async Task<JsonResult> AddMember(int TeamId, int UserId, int Capacity)
        {
            if (await db.TeamMembers.AnyAsync(tm => !tm.Erased
                && tm.TeamId == TeamId
                && tm.UserId == UserId))
            {
                return Json("El usuario seleccionado ya es un miembro del equipo");
            }

            var teamMember = new TeamMember
            {
                Capacity = Capacity,
                TeamId = TeamId,
                UserId = UserId
            };

            db.Entry(teamMember).State = EntityState.Added;
            await db.SaveChangesAsync();

            return Json("0");
        }

        [HttpPost]
        public async Task<JsonResult> RemoveMember(int TeamMemberId)
        {
            var teamMember = await db.TeamMembers.FindAsync(TeamMemberId);

            if (teamMember != null)
            {
                teamMember.Erased = true;
                await db.SaveChangesAsync();

                return Json("0");
            }

            return Json("Error");
        }

        // GET: /Team/Create
        private ActionResult Create()
        {
            ViewBag.ProjectId = new SelectList(db.Projects, "Id", "Name");
            return View();
        }

        // POST: /Team/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        private async Task<ActionResult> Create([Bind(Include = "Id,Name,ProjectId")] Team team)
        {
            if (ModelState.IsValid)
            {
                db.Teams.Add(team);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.ProjectId = new SelectList(db.Projects.Where(p => !p.Erased), "Id", "Name", team.ProjectId);
            return View(team);
        }

        // GET: /Team/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Team team = await db.Teams.FindAsync(id);
            if (team == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(team);

            return View(team);
        }

        // POST: /Team/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Name,ProjectId")] Team team)
        {
            if (ModelState.IsValid)
            {
                db.Entry(team).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(team);
        }

        // GET: /Team/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Team team = await db.Teams.FindAsync(id);
            if (team == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(team);

            return View(team);
        }

        // POST: /Team/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Team team = await db.Teams.FindAsync(id);
            db.Teams.Remove(team);
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
    }
}
