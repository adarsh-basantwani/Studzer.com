using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace students1.Services.Hostel
{
    public partial class SearchHostel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfDisable.Value = "Yes";
            hfNo.Value = "No";
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            for (int i = 0; i < dv.Count; i++)
            {
                DateTime date = (DateTime)dv[i][2];
                DateTime d2;
                String Scheme = (String)dv[i][1];
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
                    hfDate.Value = date.ToString();
                    int n = SqlDataSource1.Update();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session.Add("NearestLocation", ddlNearestLocation.SelectedValue);
            Session.Add("State", ddlState.SelectedValue);
            Session.Add("City", ddlCity.SelectedValue);
            Session.Add("HostelName", txtName.Text);
            Session.Add("HostelGender", rblHostelFor.SelectedValue);
            Session.Add("MessFacility", rblMessFacility.SelectedValue);
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