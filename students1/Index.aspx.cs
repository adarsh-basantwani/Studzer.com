using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace students1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hfLocation.Value = "Home";
            hfDate.Value = DateTime.Today.ToString();
            SqlDataSource2.Delete();
            HiddenField1.Value = "Not Read";
            if (Request.Cookies["userid"] != null && Request.Cookies["pwd"] != null)
            {
                HttpCookie c1 = Request.Cookies["userid"];
                HttpCookie c2 = Request.Cookies["pwd"];

                hfUserID.Value = c1.Value;
                hfPwd.Value = c2.Value;

                DataView dv = (DataView)sqlLogin.Select(new DataSourceSelectArguments());
                if (dv == null)
                    return;
                if (dv.Count == 1)
                {
                    Session.Add("Name", dv[0][0]);
                    Session.Add("Gender", dv[0][1]);
                    Session.Add("UserId", dv[0][2]);
                    Session.Add("Password", dv[0][3]);
                    if (dv[0][4] == DBNull.Value)
                    {
                        Session.Add("EmailId", "-");
                    }
                    Session.Add("EmailId", dv[0][4]);
                }
            }
            if (Session["UserId"] != null)
            {
                DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
                if (dv.Count == 1)
                {
                    if (!dv[0][0].ToString().Equals("0"))
                    {
                        Label5.Text = dv[0][0].ToString();
                        Label6.Text = "Notifications: ";
                    }
                }
                PanelLogin.Visible = false;
                String s = (String)Session["Name"];
                String[] arr = s.Split(' ');
                String fname = arr[0];
                lblName.Text = fname;
                PanelLogout.Visible = true;
            }
        }
    }
}