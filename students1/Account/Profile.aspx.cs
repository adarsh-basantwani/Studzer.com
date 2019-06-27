using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace students1.Account
{
    public partial class Profile1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            if (dv[0][0] != DBNull.Value || dv[0][1] != DBNull.Value || dv[0][2] != DBNull.Value || dv[0][3] != DBNull.Value || dv[0][4] != DBNull.Value || dv[0][5] != DBNull.Value)
            {
                PanelFixed.Visible = false;
            }
            else
            {
                PanelProfile.Visible = false;
            }
            if (IsPostBack)
            {
                DataList2.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int n = SqlProfile.Update();
            if (n == 1)
            {
                Response.Write("<script>alert('Profile Updated Successfully...')</script>");
                PanelFixed.Visible = false;
                PanelProfile.Visible = true;
            }
        }

        protected void Img1_Click(object sender, ImageClickEventArgs e)
        {
            PanelFixed.Visible = true;
            PanelProfile.Visible = false;
        }

        protected void rblEducation_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblEducation.SelectedValue.Equals("Education"))
            {
                lblEducation.Visible = true;
                txtEducation.Visible = true;
            }
        }
    }
}