using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace students1.Services.Tutions
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null && Session["TutionName"] != null)
            {
                PanelLogin.Visible = false;
                lblName.Text = (String)Session["TutionName"];
                PanelLogout.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('You must Login First...')</script>");
                Server.Transfer("~/Index.aspx");
            }
        }
    }
}