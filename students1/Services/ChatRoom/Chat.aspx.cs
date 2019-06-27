using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace students1.Services.ChatRoom
{
    public partial class Chat : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            showchat();
            if (Request.QueryString["Status"] != null)
            {
                hfRead.Value = Request.QueryString["Status"];
                sqlUpdateStatus.Update();
            }
        }
        void showchat()
        {
            DataView dvx = (DataView)SqlFriendInfo.Select(new DataSourceSelectArguments());
            String nm = (String)dvx[0][0];
            String[] arr = nm.Split(' ');
            String fname = arr[0];

            String uid = (String)Session["UserId"];
            String s = "";
            DataView dv = (DataView)sqlMsg.Select(new DataSourceSelectArguments());
            for (int i = 0; i < dv.Count; i++)
            {
                String msgfrom = (String)dv[i][1];
                String msgto = (String)dv[i][2];
                String msg = (String)dv[i][3];
                DateTime mdate = (DateTime)dv[i][4];
                if (msgfrom == uid)
                    msgfrom = "Me";
                else
                    msgfrom = fname;
                String m = msgfrom + " : " + msg;
                s = s + m;
                s = s + "<br>";

            }
            lbl.Text = s;
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            DataView dv = (DataView)sqlCheck.Select(new DataSourceSelectArguments());
            if (dv.Count != 1)
            {
                Response.Write("<script>alert('User does not exists in the Chat Room...')</scipt>");
                return;
            }
            hfdate.Value = DateTime.Now.ToString();
            hfNotRead.Value = "Not Read";
            sqlMsg.Insert();
            txtmsg.Text = "";
            showchat();
        }
    }
}