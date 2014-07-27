using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using My_DAL;
using System.Configuration;

namespace WcfServiceLibrary
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "LoadTextService" in both code and config file together.
    public class LoadTextService : ILoadTextService
    {
        public DataSet GetTicketInfo()
        {
            string connstring = "Data Source=SDSTUDENT-HP;Initial Catalog=dbFinalAssignment;Integrated Security=SSPI";
            DAL d = new DAL(connstring);
            DataSet ds = d.ExecuteProcedure("spGetTicketInfo");
            return ds;
        }
    }
}
