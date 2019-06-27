using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace students1.Services
{
    public partial class FinalUploadRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfDate.Value = DateTime.Today.ToString();
            hfDisable.Value = "No";
            hfYes.Value = "Yes";
            hfConfirm.Value = "No";
            hfHold.Value = "Hold";
            hfRoomStatus.Value = "Yes";
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            if(dv.Count==1)
            {
                DateTime date = (DateTime)dv[0][0];
                DateTime d2 = date.AddDays(30);
                if (DateTime.Compare(date, d2) > 0)
                {
                    SqlDataSource1.Update();
                    btnUpload.Visible = true;
                }
            }
        }


        protected void btnUpload_Click(object sender, EventArgs e)
        {
            int n = SqlDisplayDetails.Update();
            if (n==1)
            {
                {
                    Response.Write("<script>alert('Congratulations.. Your Room is Reposted on Our Site. Please Kindly Login Twice in a Week to Check Your Booking Status.')</script>");
                }
                Server.Transfer("~/Account/MyUploads.aspx");
            }
            else
            {
                Response.Write("<script>alert('Add not Reposted..')</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int n = SqlDeleteDetails.Update();
            if (n == 1)
            {
                Response.Write("<script>alert('Add Deleted...')</script>");
                Server.Transfer("~/Account/MyUploads.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Account/MyUploads.aspx");
        }
    }
}