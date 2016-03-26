using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuickSoftwareMgmt.Controllers
{
    public class BaseController : Controller
    {
        #region Constants

        public static String USER_SESSION = "user_session";
        public static String SELECTED_PROJECT_ID = "selected_project_id";

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
                var temp = new User();

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

        #endregion

    }



}