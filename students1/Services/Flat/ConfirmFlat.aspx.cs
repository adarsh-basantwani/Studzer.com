using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace students1.Services.Flat
{
    public partial class ConfirmFlat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfDisable.Value = "Yes";
            hfConfirm.Value = "Yes";
            hfStatus.Value = "Yes";
            int n = SqlDataSource1.Update();
            if (n == 1)
            {
                SqlDataSource2.Update();
                Response.Write("<script>alert('User Confirmed Successfully..')</script>");
            }
            Server.Transfer("FlatDetails.aspx");
        }
    }
}