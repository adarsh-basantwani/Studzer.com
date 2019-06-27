using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace students1.Account
{
    public partial class UserPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfLocation.Value = "UserPanel";
            HiddenField1.Value = "Not Read";
            if (Session["UserId"] != null)
            {
                DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
                if (dv.Count == 1)
                {
                    if (!dv[0][0].ToString().Equals("0"))
                    {
                        Label5.Text = dv[0][0].ToString();
                        Label6.Text = "Notifications: ";
                    }
                }
                PanelLogin.Visible = false;
                String s = (String)Session["Name"];
                String[] arr = s.Split(' ');
                String fname = arr[0];
                lblName.Text = fname;
                PanelLogout.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('You must Login First...')</script>");
                Server.Transfer("~/Account/Login.aspx");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
        }
    }
}