using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace students1.Services.Tutions
{
    public partial class TutionPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblName.Text = (String)Session["TutionName"];
            HiddenField1.Value = "Yes";
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            if (dv.Count == 1)
            {
                SqlDataSource1.Update();
                DateTime d1 = (DateTime)dv[0][0];
                DateTime d2 = d1.AddDays(30);
                if (DateTime.Compare(d1, d2) > 0)
                {
                    Label1.Text = "You Add period is expired..Please Contact Us via email or phone to renew your plan.";
                }
            }
        }
    }
}