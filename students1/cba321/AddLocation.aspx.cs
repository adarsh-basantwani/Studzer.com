using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace students1.cba321
{
    public partial class AddLocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            int n = sqlds.Insert();
            if (n == 1)
            {
                lbl.Text = "Data Inserted Successfully...";
            }
            GridView1.DataBind();
        }
    }
}