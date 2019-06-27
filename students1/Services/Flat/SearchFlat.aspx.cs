using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace students1.Services.Flat
{
    public partial class SearchFlat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfDisable.Value = "Yes";
            hfConfirm.Value = "No";
            hfNo.Value = "No";
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            for (int i = 0; i < dv.Count; i++)
            {
                DateTime date = (DateTime)dv[i][1];
                DateTime d2 = date.AddDays(30);
                if (DateTime.Compare(date, d2) > 0)
                {
                    hfDate.Value = date.ToString();
                    int n = SqlDataSource1.Update();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session.Add("FlatGender", rblGender.SelectedValue);
            Session.Add("FlatType", ddlFlatType.Text);
            Session.Add("State", ddlState.SelectedValue);
            Session.Add("City", ddlCity.SelectedValue);
            Session.Add("NearestLocation", ddlNearestLocation.SelectedValue);
            Session.Add("OwnerName", txtName.Text);
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