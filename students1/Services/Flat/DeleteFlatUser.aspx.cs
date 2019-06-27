using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace students1.Services.Flat
{
    public partial class DeleteFlat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfDisable.Value = "No";
            hfConfirm.Value = "No";
            hfStatus.Value = "No";
            int n = SqlDataSource1.Update();
            if (n == 1)
            {
                SqlDataSource2.Update();
                Response.Write("<script>alert('User Deleted Successfully..')</script>");
            }
            Server.Transfer("FlatDetails.aspx");
        }
    }
}