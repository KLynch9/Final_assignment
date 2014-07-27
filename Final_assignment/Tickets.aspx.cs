using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_Assignment
{
    public partial class Tickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TicketServiceReference.LoadTextServiceClient tix = new TicketServiceReference.LoadTextServiceClient();
                BindData(tix); 
            }            
        }

        private void BindData(TicketServiceReference.LoadTextServiceClient tix)
        {
            gvTickets.DataSource= tix.GetTicketInfo();
            gvTickets.DataBind();
        }
    }
}