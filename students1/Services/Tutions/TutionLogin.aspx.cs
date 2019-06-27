using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using students1.Classes;
using System.Data;
namespace students1.Services.Tutions
{
    public partial class TutionLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Password pwd = new Password();
            HiddenField1.Value = pwd.Encrypt(txtPassword.Text);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
                if (dv.Count == 1)
                {
                    Session.Add("OwnerName", dv[0][0]);
                    Session.Add("TutionName", dv[0][1]);
                    Session.Add("EmailId", dv[0][2]);
                    Session.Add("UserId", dv[0][3]);
                    Session.Add("TutionId", dv[0][4]);
                    Response.Write("<script>alert('Login Sucessfully...')</script>");
                    Server.Transfer("TutionPanel.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid UserName or Password...')</script>");
                    return;
                }
            }
            else
            {
                Response.Write("<script>alert('You must Logout from your existing account...')</script>");
                Server.Transfer("~/Index.aspx");
            }
        }
    }
}