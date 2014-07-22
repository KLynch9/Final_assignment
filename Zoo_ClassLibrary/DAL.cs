using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace My_DAL
{
    public class DAL
    {
        string ConnString;
        List<SqlParameter> _parameters;

        public DAL(string connString)
        {
            ConnString = connString; 
            _parameters = new List<SqlParameter>();
        }

        public void AddParam(string paramName, object paramValue)
        {
            _parameters.Add(new SqlParameter(paramName,paramValue));
        }

        public DataSet ExecuteProcedure(string ProcName)
        {
            DataSet dsresult = new DataSet();
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataAdapter da = new SqlDataAdapter(ProcName, conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            foreach(SqlParameter parameter in _parameters)
            {
                da.SelectCommand.Parameters.Add(parameter);            
            }

            conn.Open();
            da.Fill(dsresult);
            conn.Close();
            return dsresult;
        }
    }
}
