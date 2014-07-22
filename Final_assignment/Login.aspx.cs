using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using My_DAL;
using Zoo_ClassLibrary;

namespace Final_Assignment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Users u = new Users();
                string s=u.Login(ConfigurationManager.ConnectionStrings["connString"].ConnectionString,txtUsername.Text,txtPassword.Text);
                

                if (s=="success")
                {                    
                    Session["uid"] = u.userid;
                    Session["uname"] = u.userName;
                    Session["isAdmin"] = u.isAdmin;
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    lblResult.Text = s;
                }
            }
        }
    }
}