using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace students1.Services
{
    public partial class BookMyRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataView dv3 = (DataView)SqlCheck.Select(new DataSourceSelectArguments());
            if (dv3.Count == 1)
            {
                Response.Write("<script>alert('This Room is already booked by You')</script>");
                Server.Transfer("SearchRoom.aspx");
            }
            hfStatus.Value = "Yes";
            DataView dv = (DataView)SqlCounter.Select(new DataSourceSelectArguments());
            if (dv.Count == 1)
            {
                String n = (String)dv[0][0];
                int m = int.Parse(n);
                m = m + 1;
                String c = Convert.ToString(m);
                hfCounter.Value = c;
                SqlCounter.Update();
            }
            DataView dv1 = (DataView)SqlDisplayDetails1.Select(new DataSourceSelectArguments());
            if (dv1.Count == 1)
            {
                String n = (String)dv1[0][0];
                if (n.Equals("No"))
                {
                    lbl.Text = "This Room is already Booked But it is not confirmed by the Landlord. If You want to Book this Room then Click on the 'BookMyRoom' button below and Go to Landlord and Confirm your Booking as early as possible.";
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            hfHold.Value = "Hold";
            int m = SqlBook.Insert();
                if(m==1)
              {
                    int n = SqlBookRoom.Update();
                    if (n == 1)
                {
                Response.Write("<script>alert('Congratulations.. Your Room is Booked')</script>");
                Server.Transfer("Acknowledgement.aspx");
                }
             }
        }
    }
}