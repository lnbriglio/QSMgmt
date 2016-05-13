using DAL;
using DAL.Intefaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace QuickSoftwareMgmt.Controllers
{
    public class BaseController : Controller
    {
        #region Constants

        private static String USER_SESSION = "user_session";
        private static String SELECTED_PROJECT_ID = "selected_project_id";
        private static String SELECTED_SPRINT_ID = "selected_sprint_id";

        #endregion

        #region Constructors

        public BaseController()
        {

        }
        #endregion


        #region Properties
        public User CurrentUser
        {
            get
            {
                User temp = null;

                if (Session != null && Session[USER_SESSION] is User)
                {
                    temp = Session[USER_SESSION] as User;
                }

                return temp;
            }
            set
            {
                Session[USER_SESSION] = value;
            }
        }

        public int? SelectedProjectId
        {
            get
            {
                int? temp = null;
                if (Session != null && Session[SELECTED_PROJECT_ID] is Int32)
                {
                    temp = Session[SELECTED_PROJECT_ID] as Int32?;
                }
                return temp;
            }
            set
            {
                Session[SELECTED_PROJECT_ID] = value;
            }
        }

        public int? SelectedSprintId
        {
            get
            {
                int? temp = null;
                if (Session != null && Session[SELECTED_SPRINT_ID] is Int32)
                {
                    temp = Session[SELECTED_SPRINT_ID] as Int32?;
                }
                return temp;
            }
            set
            {
                Session[SELECTED_SPRINT_ID] = value;
            }
        }

        #endregion

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (CurrentUser == null
                && filterContext.ActionDescriptor.ActionName != "LogOut"
                && filterContext.ActionDescriptor.ActionName != "LogIn"
                && filterContext.ActionDescriptor.ActionName != "SignUp"
                && filterContext.ActionDescriptor.ActionName != "CheckEmail"
                && filterContext.ActionDescriptor.ActionName != "SignUpSuccess"

                )
            {
                var redirectTarget = new RouteValueDictionary();
                redirectTarget.Add("action", "LogOut");
                redirectTarget.Add("controller", "Account");
                filterContext.Result = new RedirectToRouteResult(redirectTarget);
            }
            else
            {
                ViewBag.SelectedProjectId = SelectedProjectId;
                ViewBag.SelectedSprintId = SelectedSprintId;

                if (CurrentUser != null)
                {
                    ViewBag.CurrentUserName = String.Format("{0} {1}", CurrentUser.FirstName, CurrentUser.LastName );
                    ViewBag.CurrentCompanyName = CurrentUser.Company.Name;
                }
            }

            base.OnActionExecuting(filterContext);
        }

        protected void ValidateCompany(ICompany companyElement)
        {
            if (!companyElement.IsCompanyValid(CurrentUser.CompanyId))
            {
                var result = new HttpStatusCodeResult(HttpStatusCode.Forbidden);

                result.ExecuteResult(this.ControllerContext);
                HttpContext.Response.End();
                //TODO redirect to forbidden page
            }
        }

    }



}