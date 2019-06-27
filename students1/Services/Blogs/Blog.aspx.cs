using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace students1.Services.Blogs
{
    public partial class Blog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            if (dv.Count == 1)
            {
                String n = (String)dv[0][4];
                int m = int.Parse(n);
                m = m + 1;
                String c = Convert.ToString(m);
                HiddenField2.Value = c;
                SqlDataSource1.Update();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Server.Transfer("BlogsList.aspx");
        }
    }
}