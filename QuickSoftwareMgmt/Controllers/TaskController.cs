﻿using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Net;

namespace QuickSoftwareMgmt.Controllers
{
    public class TaskController : BaseController
    {
        private QSMgmtEntities db = new QSMgmtEntities();
        //
        // GET: /Task/
        public async Task<PartialViewResult> Create(int? id)
        {
            var parentId = id ?? 0;
            var task = new DAL.Task
            {
                BacklogItemId = parentId,
                CreationDate = DateTime.Now,
                TaskStateId = (int)TaskStateEnum.ToDo
            };

            var sprints = await db.Sprints
                .Where(s => !s.Erased
                && s.ProjectId == SelectedProjectId)
                .ToListAsync();
            ViewBag.SprintId = new SelectList(sprints, "Id", "Name");

            var team = await db.Teams
                .Include(t => t.TeamMembers)
                .Include("TeamMembers.User")
                .FirstOrDefaultAsync(t => !t.Erased
                && t.ProjectId == SelectedProjectId);

            List<User> users = new List<User>();
            if (team != null)
            {
                users = team.TeamMembers
                    .Where(m => !m.Erased)
                    .Select(tm => tm.User).ToList();
            }

            ViewBag.UserId = new SelectList(users, "Id", "FullName");

            return PartialView("_CreateModal", task);
        }

        [HttpPost]
        public async Task<ActionResult> Create([Bind(Include = "BacklogItemId,Title,Description,CreationDate,TaskStateId,EstimatedTime,RemainingTime,SprintId,UserId")] DAL.Task task)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (task.EstimatedTime >= task.RemainingTime)
                    {
                        db.Entry(task).State = EntityState.Added;
                        await db.SaveChangesAsync();

                        await db.Entry(task).ReloadAsync();
                        return PartialView("_CreateSuccessfulModal", task);
                    }
                    else
                    {
                        ModelState.AddModelError(String.Empty, "El tiempo restante debe ser menor o igual al tiempo estimado.");
                    }
                }
            }
            catch
            {
                ModelState.AddModelError(String.Empty, "Error en DB o excepción");//TODO Eliminar cuando estén las validaciones
            }

            var sprints = await db.Sprints
               .Where(s => !s.Erased
               && s.ProjectId == SelectedProjectId)
               .ToListAsync();
            ViewBag.SprintId = new SelectList(sprints, "Id", "Name", task.SprintId);

            var team = await db.Teams
                .Include(t => t.TeamMembers)
                .Include("TeamMembers.User")
                .FirstOrDefaultAsync(t => !t.Erased
                && t.ProjectId == SelectedProjectId);

            List<User> users = new List<User>();
            if (team != null)
            {
                users = team.TeamMembers
                    .Where(m => !m.Erased)
                    .Select(tm => tm.User).ToList();
            }

            ViewBag.UserId = new SelectList(users, "Id", "FullName", task.UserId);

            return PartialView("_CreateModal", task);
        }

        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DAL.Task task = await db.Tasks.FindAsync(id);
            if (task == null)
            {
                return HttpNotFound();
            }

            var sprints = await db.Sprints
                .Where(s => !s.Erased
                && s.ProjectId == SelectedProjectId)
                .ToListAsync();
            ViewBag.SprintId = new SelectList(sprints, "Id", "Name", task.SprintId);

            var team = await db.Teams
                .Include(t => t.TeamMembers)
                .Include("TeamMembers.User")
                .FirstOrDefaultAsync(t => !t.Erased
                && t.ProjectId == SelectedProjectId);

            List<User> users = new List<User>();
            if (team != null)
            {
                users = team.TeamMembers
                    .Where(m => !m.Erased)
                    .Select(tm => tm.User).ToList();
            }

            ViewBag.UserId = new SelectList(users, "Id", "FullName", task.UserId);

            return PartialView("_EditModal", task);
        }

        [HttpPost]
        public async Task<ActionResult> Edit([Bind(Include = "Id,BacklogItemId,Title,Description,EstimatedTime,RemainingTime,SprintId,UserId,CreationDate,TaskStateId")] DAL.Task task)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(task).State = EntityState.Modified;
                    await db.SaveChangesAsync();

                    await db.Entry(task).ReloadAsync();

                    var backlogItem =await db.BacklogItems.FindAsync(task.BacklogItemId);

                    backlogItem.Title = task.Title;
                    backlogItem.Description = task.Description;

                    db.Entry(backlogItem).State = EntityState.Modified;

                    await db.SaveChangesAsync();

                    
                    return PartialView("_EditSuccessfulModal", task);
                }
            }
            catch
            {
                ModelState.AddModelError(String.Empty, "Error en DB o excepción");//TODO Eliminar cuando estén las validaciones
            }

            var sprints = await db.Sprints
               .Where(s => !s.Erased
               && s.ProjectId == SelectedProjectId)
               .ToListAsync();
            ViewBag.SprintId = new SelectList(sprints, "Id", "Name", task.SprintId);

            var team = await db.Teams
                .Include(t => t.TeamMembers)
                .Include("TeamMembers.User")
                .FirstOrDefaultAsync(t => !t.Erased
                && t.ProjectId == SelectedProjectId);

            List<User> users = new List<User>();
            if (team != null)
            {
                users = team.TeamMembers
                    .Where(m => !m.Erased)
                    .Select(tm => tm.User).ToList();
            }

            ViewBag.UserId = new SelectList(users, "Id", "FullName", task.UserId);

            return PartialView("_EditModal", task);
        }

        [HttpGet]
        public async Task<PartialViewResult> Update(int taskId, int nextStateId)
        {
            var task = await db.Tasks.FindAsync(taskId);

            var taskStates = await db.TaskStates.ToListAsync();

            var taskUpdate = new TaskUpdate
            {
                PreviousTaskStateId = task.TaskStateId,
                TaskStateId = nextStateId,
                EventDate = DateTime.Now,
                TaskId = task.Id,
                Task = task,
                PreviousTaskState = taskStates.First(t => t.Id == task.TaskStateId),
                TaskState = taskStates.First(t => t.Id == nextStateId),
            };

            return PartialView("_CreateTaskUpdateModal", taskUpdate);
        }

        [HttpPost]
        public async Task<PartialViewResult> Update(TaskUpdate taskUpdate)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var task = await db.Tasks.FindAsync(taskUpdate.TaskId);

                    switch ((TaskStateEnum)taskUpdate.TaskStateId)
                    {
                        case TaskStateEnum.Doing:

                            if (task.RemainingTime - taskUpdate.ElapsedTime > 0)
                            {
                                task.RemainingTime -= taskUpdate.ElapsedTime;
                            }
                            else
                            {
                                taskUpdate.ElapsedTime = task.RemainingTime;
                                task.RemainingTime = 0;
                            }
                            break;
                        case TaskStateEnum.ToDo:

                            break;
                        case TaskStateEnum.Done:
                            taskUpdate.ElapsedTime = task.RemainingTime;
                            task.RemainingTime = 0;
                            break;
                    }

                    task.TaskStateId = taskUpdate.TaskStateId;
                    db.Entry(taskUpdate).State = EntityState.Added;
                    await db.SaveChangesAsync();

                    await db.Entry(taskUpdate).ReloadAsync();
                    return PartialView("_CreateTaskUpdateSuccessfulModal", taskUpdate);
                }
            }
            catch
            {
                ModelState.AddModelError(String.Empty, "Error en DB o excepción");//TODO Eliminar cuando estén las validaciones
            }

            return PartialView("_CreateTaskUpdateModal", taskUpdate);
        }

        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DAL.Task task = await db.Tasks.FindAsync(id);
            if (task == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(task);

            return View(task);
        }

        // GET: /Change/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DAL.Task task = await db.Tasks.FindAsync(id);
            if (task == null)
            {
                return HttpNotFound();
            }
            base.ValidateCompany(task);

            return View(task);
        }

        // POST: /Change/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            DAL.Task task = await db.Tasks.FindAsync(id);
            task.Erased = true;
            db.Entry(task).State = EntityState.Modified;
            try
            {
                await db.SaveChangesAsync();
            }
            catch (Exception ex)
            {

            }
            return RedirectToAction("Index","Change");
        }

        [HttpPost]
        public async Task<JsonResult> DeleteAjax(int? id)
        {
            DAL.Task task = await db.Tasks.FindAsync(id);
            task.Erased = true;

            if (task.BacklogItem is Test)
            {
                task.BacklogItem.Erased = true;
            }

            db.Entry(task).State = EntityState.Modified;
            try
            {
                await db.SaveChangesAsync();
            }
            catch (Exception ex)
            {

            }

            return Json(true);
        }
    }
}