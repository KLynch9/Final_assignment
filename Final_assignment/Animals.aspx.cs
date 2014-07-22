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
    public partial class Animals : System.Web.UI.Page
    {
        string connstring = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            DAL d = new DAL(connstring);
            DataSet ds = d.ExecuteProcedure("spGetAnimals");
            string xml = ds.GetXml();
            Xml1.DocumentContent = xml;
        }
    }
}