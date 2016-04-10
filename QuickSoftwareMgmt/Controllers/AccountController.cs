using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;

namespace QuickSoftwareMgmt.Controllers
{
    public class AccountController : BaseController
    {
        private QSMgmtEntities db = new QSMgmtEntities();
        //
        // GET: /Account/
        public ActionResult LogIn()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> LogIn([Bind(Include="UserName,Password")] User user)
        {
            var foundUser = await db.Users
                .Where(u => !u.Erased
                && u.UserName == user.UserName
                && u.Password == user.Password)
                .FirstOrDefaultAsync();

            if (foundUser != null)
            {
                CurrentUser = foundUser;
                return RedirectToAction("Index", "Project");
            }

            ModelState.AddModelError(String.Empty, "Usuario o contraseña incorrectas");
            return View(user);
        }

        

        public ActionResult LogOut()
        {
            Session.Abandon();
            return RedirectToAction("LogIn");
        }
	}
}