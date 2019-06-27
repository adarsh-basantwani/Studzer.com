using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using students1.Classes;
using System.Data;

namespace students1.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Password pwd = new Password();
            HiddenField1.Value = pwd.Encrypt(txtPassword.Text.Trim());
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Password pwd = new Password();
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            if (dv.Count == 1)
            {
                HttpCookie c1, c2;
                c1 = new HttpCookie("userid", txtUserName.Text);
                c2 = new HttpCookie("pwd", pwd.Encrypt(txtPassword.Text.Trim()));
                c1.Expires = DateTime.Now.AddYears(1);
                c2.Expires = DateTime.Now.AddYears(1);
                Response.AppendCookie(c1);
                Response.AppendCookie(c2);
                Session.Add("Name", dv[0][0]);
                Session.Add("Gender", dv[0][1]);
                Session.Add("UserId", dv[0][2]);
                Session.Add("Password", dv[0][3]);
                if (dv[0][4] == DBNull.Value)
                {
                    Session.Add("EmailId", "-");
                }
                Session.Add("EmailId", dv[0][4]);
                Server.Transfer("UserPanel.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid UserName or Password...')</script>");
            }
        }
    }
}