using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace students1.Services.Hostel
{
    public partial class ConfirmHostel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfStatus.Value = "Yes";
            int n = SqlDataSource1.Update();
            if (n == 1)
            {
                Response.Write("<script>alert('User Confirmed Successfully..')</script>");
            }
            Server.Transfer("HostelDetails.aspx");
        }
    }
}