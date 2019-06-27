using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace students1.Services.Mess
{
    public partial class DeleteMessUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfStatus.Value = "No";
            int n = SqlDataSource1.Update();
            if (n == 1)
            {
                Response.Write("<script>alert('User Deleted Successfully..')</script>");
            }
            Server.Transfer("MessDetails.aspx");
        }
    }
}