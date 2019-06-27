using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace students1.Account
{
    public partial class ChangeSecurity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int n = SqlDataSource2.Update();
            if (n == 1)
            {
                Response.Write("<script>alert('Security Question and Answer has been Changed Successfully...')</script>");
            }
        }

    }
}