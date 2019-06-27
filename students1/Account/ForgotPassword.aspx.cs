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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Password pwd=new Password();
            DataView dv = (DataView)SqlRegister.Select(new DataSourceSelectArguments());
            if(dv.Count == 1)
            {
                    Response.Write("<script>alert('Your Password is " + pwd.Decrypt(dv[0][2].ToString()) + "')</script>");
                    return;
            }
            else
            {
                Response.Write("<script>alert('Invalid ContactNo...')</script>");
                return;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Account/Login.aspx");
        }
    }
}