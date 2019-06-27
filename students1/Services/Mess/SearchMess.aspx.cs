using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace students1.Services.Mess
{
    public partial class SearchRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfDisable.Value = "Yes";
            hfNo.Value = "No";
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            for (int i = 0; i < dv.Count; i++)
            {
                DateTime date = (DateTime)dv[i][0];
                String Scheme = (String)dv[i][1];
                DateTime d2;
                    if(Scheme.Equals("3 Months"))
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
            Session.Add("MessType", rblMessType.SelectedValue);
            Session.Add("TiffinFacility", rblTiffinFacility.SelectedValue);
            Session.Add("State", ddlState.SelectedValue);
            Session.Add("City", ddlCity.SelectedValue);
            Session.Add("MessName", txtName.Text);
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