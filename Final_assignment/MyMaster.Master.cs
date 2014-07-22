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
    public partial class MyMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"] != null && Session["uid"] != null)
            {
                string connstring = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
                
                DAL d = new DAL(connstring);
                d.AddParam("UserID", Session["uid"]);
                DataSet ds = d.ExecuteProcedure("spGetUser");
                
                if (ds.Tables[0].Rows[0]["Username"].ToString()=="admin")
                {
                    lnkAdmin.Visible = true;    
                }
                else
                {                    
                    lnkAdmin.Visible = false;
                }
                pnlLoggedIn.Visible = true;               
                pnlLoggedOut.Visible = false;
                lblUsername.Text = Session["uname"].ToString();
            }
            else
            {   
                pnlLoggedOut.Visible = true;
                pnlLoggedIn.Visible = false;
            }
        }
        
        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Default.aspx");
        }          
    }
}