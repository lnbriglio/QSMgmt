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
        public async Task<ActionResult> LogIn([Bind(Include = "Email,Password,FirstName,LastName")] User user)
        {
            if (ModelState.IsValid)
            {
                var foundUser = await db.Users
                    .Where(u => !u.Erased
                    && u.Email == user.Email
                    && u.Password == user.Password)
                    .FirstOrDefaultAsync();

                if (foundUser != null)
                {
                    CurrentUser = foundUser;
                    return RedirectToAction("Index", "Project");
                }

                ModelState.AddModelError(String.Empty, "Usuario o contraseña incorrectas");
            }
            return View(user);
        }



        public ActionResult LogOut()
        {
            Session.Abandon();
            return RedirectToAction("LogIn");
        }

        public ActionResult SignUp()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> SignUp(User user)
        {
            ModelState.Clear();
            if (user.CompanyId != 0)
            {
                user.Company = null;
                if (TryValidateModel(user))
                {
                    //Registrar
                    db.Entry(user).State = EntityState.Added;
                    await db.SaveChangesAsync();

                    return RedirectToAction("SignUpSuccess");
                }
            }
            else
            {
                //Chequer dominio
                var domainAlreadyExists = await db.Companies.AnyAsync(c => !c.Erased && c.Domain == user.Company.Domain);
                if (!domainAlreadyExists)
                {
                    if (TryValidateModel(user))
                    {
                        if (!String.IsNullOrWhiteSpace(user.Company.Name))
                        {
                            //Registrar
                            db.Entry(user).State = EntityState.Added;
                            await db.SaveChangesAsync();

                            return RedirectToAction("SignUpSuccess");
                        }
                        else
                        {
                            ModelState.AddModelError(String.Empty, "El nombre de la empresa es requerido");
                        }
                    }
                }
                else
                {
                    ModelState.AddModelError(String.Empty, "Ya existe una empresa con este dominio, elija otro");
                }
            }


            return View(user);
        }

        public ActionResult SignUpSuccess()
        {
            return View();
        }

        [HttpPost]
        public async Task<JsonResult> CheckEmail(string email)
        {
            var userExists = await db.Users.AnyAsync(u => !u.Erased && u.Email == email);
            var domain = email.Substring(email.LastIndexOf("@") + 1);
            var company = await db.Companies.FirstOrDefaultAsync(c => !c.Erased && c.Domain == domain);

            var response = new
            {
                userExists = userExists,
                companyId = company == null ? 0 : company.Id,
                domain = domain,
            };

            return Json(response);

        }


    }
}