using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using My_DAL;

namespace Final_Assignment
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["isAdmin"]) == 1)
            {                
                BindData();
            }                
            else
            {
                Response.Redirect("~/Login.aspx");
            }            
        }

        private void BindData()
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["connString"].ConnectionString);
            d.AddParam("UserID", null);

            gvUsers.DataSource = d.ExecuteProcedure("spGetUser");
            gvUsers.DataBind();
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            BindData();
        }
    }
}