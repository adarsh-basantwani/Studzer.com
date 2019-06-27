using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

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
        }


        protected void btnUpload_Click(object sender, EventArgs e)
        {
            int n = SqlDisplayDetails.Update();
            if (n==1)
            {
                {
                    Response.Write("<script>alert('Congratulations.. Your Room is Reposted on Our Site. Please Kindly Login Twice in a Week to Check Your Booking Status.')</script>");
                }
                Server.Transfer("Panel.aspx");
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
                Server.Transfer("Panel.aspx");
            }
        }
    }
}