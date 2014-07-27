using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data;
using Zoo_ClassLibrary;
using My_DAL;
using System.Text;
using System.Net.Mail;
using System.Collections;

namespace Final_Assignment
{

    /// <summary>
    /// Summary description for Ajax
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Ajax : System.Web.Services.WebService
    {
        private Random random = new Random((int)DateTime.Now.Ticks);
        string connstring = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        [WebMethod]
        public string CheckUser(string user)
        {
            Context.Response.Clear();
            Context.Response.ContentType = "text/plain";
            DAL d = new DAL(connstring);
            d.AddParam("Username", user);
            DataSet ds = d.ExecuteProcedure("spCheckUserName");

            if (ds.Tables[0].Rows.Count == 0)
            {
                return "UserName OK!, proceed";
            }
            else
            {
                return "UserName taken, please choose another one";
            }
        }

        private string GenerateRandomString(int size)
        {
            StringBuilder builder = new StringBuilder();
            char c;
            for (int i = 0; i < size; i++)
            {
                c = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(c);
            }
            return builder.ToString();
        }

        private void SendEmail(string email, string body)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress("theemailforfakeorders@gmail.com");
            message.To.Add(new MailAddress(email));
            message.Subject = "Your password has been reset:";
            message.IsBodyHtml = true;
            message.Body = body;

            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential("theemailforfakeorders@gmail.com", "fakeorders");
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(message);
        }

        [WebMethod]
        public string ForgotPassword(string email)
        {
            Context.Response.Clear();
            Context.Response.ContentType = "text/plain";
            string newPassword = GenerateRandomString(25);

            DAL d = new DAL(ConfigurationManager.ConnectionStrings["connString"].ConnectionString);
            d.AddParam("Email", email);
            d.AddParam("NewPassword", newPassword);
            DataSet ds = d.ExecuteProcedure("spForgotPassword");

            string body = "New password: <b>" + newPassword + "</b>";

            if (Convert.ToInt32(ds.Tables[0].Rows[0]["UserID"]) > 0)
            {
                SendEmail(email, body);
                return "Success";
            }
            else
            {
                return "Failure";
            }
        }

        [WebMethod]
        public List<string> GetUsers()
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["connString"].ConnectionString);
            DataSet ds = d.ExecuteProcedure("spGetUsers");
            List<string> list = new List<string>();            
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {                
                string u = ds.Tables[0].Rows[i]["UserName"].ToString();                             
                list.Add(u);                                         
            }
            return list;            
        }

        [WebMethod]
        public List<string> GetText()
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["connString"].ConnectionString);
            DataSet ds = d.ExecuteProcedure("spGetText");
            List<string> list = new List<string>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string u = ds.Tables[0].Rows[i]["ParagraphName"].ToString();
                list.Add(u);
            }
            return list;
        }

        [WebMethod]
        public string GetWelcomeParagraph()
        {
            Context.Response.Clear();
            Context.Response.ContentType = "text/plain";
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["connString"].ConnectionString);
            DataSet ds = d.ExecuteProcedure("spGetWelcomeParagraph");

            string u = ds.Tables[0].Rows[0]["ParagraphText"].ToString();
            
            return u;
        }

        [WebMethod]
        public string GetFeaturedAnimalsParagraph()
        {
            Context.Response.Clear();
            Context.Response.ContentType = "text/HTML";
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["connString"].ConnectionString);
            DataSet ds = d.ExecuteProcedure("spGetWelcomeParagraph");

            string u = ds.Tables[0].Rows[1]["ParagraphText"].ToString();

            return u;
        }

        [WebMethod]
        public string GetTixParagraph()
        {
            Context.Response.Clear();
            Context.Response.ContentType = "text/HTML";
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["connString"].ConnectionString);
            DataSet ds = d.ExecuteProcedure("spGetWelcomeParagraph");

            string u = ds.Tables[0].Rows[2]["ParagraphText"].ToString();

            return u;
        }

        [WebMethod]
        public string UpdateParagraphText(string text,int id)
        {
            try
            {
                Context.Response.Clear();
                Context.Response.ContentType = "text/plain";
                DAL d = new DAL(connstring);
                d.AddParam("id", id+1);
                d.AddParam("ParagraphText", text);
                DataSet ds = d.ExecuteProcedure("spUpdateParagraphText");
                return "Paragraph Updated";
            }
            catch (Exception e)
            {                
                return "error: "+e.Message;
            }            
        }

        [WebMethod (EnableSession=true)]
        public string CheckSession()
        {
            if (HttpContext.Current.Session["uid"]!=null)
            {
                return "valid";           
            }
            else
            {
                return "You must log in so that we know who is buying these tickets!";
            }
        }  
    }
}
