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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Users u = new Users(txtFirstName.Text,txtLastName.Text,txtCity.Text,txtAddress.Text,txtEmail.Text,txtUser.Text,txtPassword.Text);
                DataSet ds = u.SaveToDB(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);     

                if (ds.Tables[0].Rows[0]["NewUserID"].ToString() != "")
                {
                    Session["uid"] = u.userid;
                    Session["uname"] = u.userName;
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    lblresult.Text = "Something went wrong while registering. Please try again or contact the administrator.";
                }
            }
        }
    }
}