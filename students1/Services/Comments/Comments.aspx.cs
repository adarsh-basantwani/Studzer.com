using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
namespace students1.Services.Comments
{
    public partial class Comments : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Topic"] != null)
            {
                TopicNameLabel.Text = Session["Topic"].ToString();
            }
            else
            {
                Response.Write("<script>alert('Topic not available...')</script>");
            }
            if (!IsPostBack)
            {
                fillData();
            }
        }
        private void fillData()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter("Select * from Comment where Comment IS NOT NULL Order by Id Desc", con);
            adapt.Fill(dt);
            con.Close();
            PagedDataSource pds = new PagedDataSource();
            DataView dv = new DataView(dt);
            pds.DataSource = dv;
            pds.AllowPaging = true;
            pds.PageSize = 50;
            pds.CurrentPageIndex = PageNumber;
            if (pds.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList arraylist = new ArrayList();
                for (int i = 0; i < pds.PageCount; i++)
                    arraylist.Add((i + 1).ToString());
                rptPaging.DataSource = arraylist;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }
            Repeater1.DataSource = pds;
            Repeater1.DataBind();
        }
        //btn_Submit Click Event
        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Comment(Name,Comment,Love,Topic) values(@Name,@Comment,@Love,@Topic)", con);
            cmd.Parameters.AddWithValue("@Name", Session["Name"]);
            cmd.Parameters.AddWithValue("@Comment", txtComment.Text);
            cmd.Parameters.AddWithValue("@Love", "0");
            cmd.Parameters.AddWithValue("@Topic",Session["Topic"]);
            cmd.ExecuteNonQuery();
            con.Close();
            //Displaying Javascript alert Comment Posted Successfully
            Response.Write("<script>alert('View Posted Successfully..')</script>");
            fillData();
            txtComment.Text = "";
        }
        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] != null)
                    return Convert.ToInt32(ViewState["PageNumber"]);
                else
                    return 0;
            }
            set
            {
                ViewState["PageNumber"] = value;
            }
        }
        protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            fillData();
        }
    }
}