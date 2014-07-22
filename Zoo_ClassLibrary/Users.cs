using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using My_DAL;

namespace Zoo_ClassLibrary
{
    public class Users
    {
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string address { get; set; }
        public string email { get; set; }
        public string city { get; set; }
        public string userName { get; set; }
        public string password { get; set; }
        public int userid { get; set; }
        public int isAdmin { get; set; }

        public Users() : this("", "", "", "", "", "", "") { }

        public Users(string firstName, string lastName, string city, string address,string email,string userName,string password)
        {
            this.firstName = firstName;
            this.lastName = lastName;
            this.address = address;
            this.email = email;
            this.city = city;
            this.userName = userName;
            this.password = password;                        
        }

        public DataSet SaveToDB(string connString)
        {
            DAL dal = new DAL(connString);
            dal.AddParam("@FirstName", firstName);
            dal.AddParam("@LastName", lastName);
            dal.AddParam("@Address", address);
            dal.AddParam("@City", city);
            dal.AddParam("@Email", email);
            dal.AddParam("@UserName", userName);
            dal.AddParam("@Password", password);
            DataSet ds = dal.ExecuteProcedure("spRegister");
            if (ds.Tables[0].Rows[0]["NewUserID"].ToString() != "")
            {
                this.userid = Convert.ToInt32(ds.Tables[0].Rows[0]["NewUserID"]);
            }         
            return ds;
        }

        public string Login(string connString, string user, string password)
        {
            DAL dal = new DAL(connString);
            dal.AddParam("@UserName", user);
            dal.AddParam("@Password", password);
            DataSet ds = dal.ExecuteProcedure("spLogin");
            if (ds.Tables[0].Rows.Count> 0)
            {
                this.userid = Convert.ToInt32(ds.Tables[0].Rows[0]["UserID"]);
                this.firstName=ds.Tables[0].Rows[0]["FirstName"].ToString();
                this.lastName=ds.Tables[0].Rows[0]["LastName"].ToString();
                this.city=ds.Tables[0].Rows[0]["City"].ToString();
                this.address=ds.Tables[0].Rows[0]["Address"].ToString();
                this.email=ds.Tables[0].Rows[0]["Email"].ToString();
                this.userName=ds.Tables[0].Rows[0]["UserName"].ToString();
                this.password=ds.Tables[0].Rows[0]["Password"].ToString();
                this.isAdmin=Convert.ToInt32(ds.Tables[0].Rows[0]["IsAdmin"]);
                return "success";
            }
            else
            {
                return "Login Failed";
            }
             
        }

    }
}
