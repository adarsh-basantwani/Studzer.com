﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace students1.Account
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie c1, c2;
            c1 = new HttpCookie("userid", "");
            c2 = new HttpCookie("pwd", "");
            Response.AppendCookie(c1);
            Response.AppendCookie(c2);

            Session.Add("userid", null);
            Session.Abandon();


            Response.Redirect("../Index.aspx");

        }
    }
}