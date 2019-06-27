using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace students1.cba321.Home
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            String ppath = Server.MapPath("cba321/Home/Adds");
            String img1 = FileUpload1.FileName;
            String img = ppath + "\\" + img1; ;
            FileUpload1.SaveAs(img);
            hfImage.Value = img;
            int n = sqlds.Insert();
            if (n == 1)
            {
                lbl.Text = "Add Uploaded Successfully...";
            }
        }
    }
}