using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace students1.Services.Tution
{
    public partial class SearchTution : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfDisable.Value = "Yes";
            hfNo.Value = "No";
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            for (int i = 0; i < dv.Count; i++)
            {
                DateTime date = (DateTime)dv[i][0];
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
            PanelSearch.Visible = true;
            Panelall.Visible = false;
            Session.Add("State", ddlState.SelectedValue);
            Session.Add("City", ddlCity.SelectedValue);
            Session.Add("NearestLocation", ddlNearestLocation.SelectedValue);
            Session.Add("TutionName", txtTutionName.Text);
            Session.Add("Course", ddlCouse.SelectedValue);
            Session.Add("Subject", ddlSubject.SelectedValue);
        }
    }
}