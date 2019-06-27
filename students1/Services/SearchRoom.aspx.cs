using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace students1.Services
{
    public partial class SearchRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfNo.Value = "No";
            hfConfirm.Value = "No";
            hfDisable.Value = "Yes";
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            for (int i = 0; i < dv.Count; i++)
            {
                String date = (String)dv[i][0];
                int s1 = int.Parse(date.Substring(0, 2));
                int s2 = int.Parse(date.Substring(3, 2));
                int s3 = int.Parse(date.Substring(6, 4));
                DateTime d1 = new DateTime(s3, s2, s1);
                DateTime d2;
                if (d1.Month == 12)
                {
                    s2 = 1;
                    d2 = new DateTime(s3 + 1, s2, s1);
                }
                else
                {
                    if (s2 == 1)
                    {
                        if (s1 > 28)
                        {
                            s1 = 28;
                        }
                    }
                    d2 = new DateTime(s3, s2 + 1, s1);
                }
                if (DateTime.Compare(d1, d2) > 0)
                {
                            hfDate.Value = date;
                            int n = SqlDataSource1.Update();
                }
                }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session.Add("NearestLocation", ddlNearestLocation.SelectedValue);
            Session.Add("Gender", rblGender.SelectedValue);
            Session.Add("NoOfPerson", txtNoOfPerson.Text);
            Session.Add("Price", rblPrice.SelectedValue);
            if (rblPrice.SelectedValue.Equals("1"))
            {
                Panelasc.Visible = true;
                Panelall.Visible = false;
            }
            else
            {
                Paneldesc.Visible = true;
                Panelall.Visible = false;
            }
        }
    }
}