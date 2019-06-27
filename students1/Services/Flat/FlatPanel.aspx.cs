using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace students1.Services.Flat
{
    public partial class FlatPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            if (dv.Count != 0)
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            Server.Transfer("UploadFlat.aspx");
        }
    }
}