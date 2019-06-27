using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace students1.Services.Flat
{
    public partial class FlatDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            hfDate.Value = DateTime.Today.ToString();
            hfYes.Value = "Yes";
            hfHold.Value = "Hold";
            hfFlatStatus.Value = "Yes";
            hfConfirm.Value = "No";
            hfDisable.Value = "No";
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            if (dv.Count == 1)
            {
                DateTime date = (DateTime)dv[0][0];
                String Scheme = (String)dv[0][1];
                DateTime d2;
                if (Scheme.Equals("3 Months"))
                {
                    d2 = date.AddDays(90);
                }
                else
                {
                    d2 = date.AddDays(150);
                }
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
            if (n == 1)
            {
                {
                    Response.Write("<script>alert('Congratulations.. Your Flat is Reposted on Our Site. Our Representative will Come to You and Collect the Money for Your Selected Scheme')</script>");
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