using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace students1.Services.Tutions
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Session.Remove("OwnerName");
            Session.Remove("TutionName");
            Session.Remove("EmailId");
            Session.Remove("UserId");
            Session.Remove("Password");
            Session.Remove("TutionId");
            Session.Abandon();
            Server.Transfer("../../Index.aspx");
        }
    }
}