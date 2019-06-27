using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using students1.Classes;
namespace students1.Account
{
    public partial class ChnagePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Password pwd = new Password();
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            if (dv.Count == 1)
            {
                String pass = pwd.Decrypt(dv[0][0].ToString());
                if (pass == txtOldPassword.Text)
                {
                    hfPassword.Value = pwd.Encrypt(txtNewPassword.Text);
                    int n = SqlDataSource1.Update();
                    if (n == 1)
                    {
                        Response.Write("<script>alert('Password Changed Successfully...')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Old Password...')</script>");
                }
            }
        }
    }
}