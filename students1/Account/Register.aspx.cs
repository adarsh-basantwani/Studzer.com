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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlCheckUser.Select(new DataSourceSelectArguments());
            if (dv.Count == 1)
            {
                lbl.Text = "ContactNo Already Exists..Please Choose Different ContactNo..";
                txtContactNo.Text = " ";
                return;
            }
            DataView dv1 = (DataView)SqlCheckUser1.Select(new DataSourceSelectArguments());
            if (dv1.Count == 1)
            {
                lbl1.Text = "EmailId Already Exists..Please Choose Different EmailId..";
                txtEmailId.Text = " ";
                return;
            }
            hfName.Value = txtFirstName.Text + " " + txtLastName.Text;
            hfPhoto.Value = "~/images/" + rblGender.SelectedValue + ".jpg";
            Password pwd = new Password();
            hfPassword.Value = pwd.Encrypt(txtPassword.Text.Trim());
            int n = SqlRegister.Insert();
            if (n == 1)
            {
                Response.Write("<script>alert('Congratulations...You are registered successfully.')</script>");
                Server.Transfer("Login.aspx");
            }
            else
            {
                Response.Write("<script>alert('Please try later...')</script>");
            }
        }


    }
}
