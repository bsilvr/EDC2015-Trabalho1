using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDC2015_Trabalho1.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;


namespace EDC2015_Trabalho1.Personal
{
    public partial class displayReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));

            var currentUser = manager.FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());

            SqlDataSource1.SelectParameters["Username"].DefaultValue = currentUser.FullName;
        }
    }
}