using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AjaxControlToolkit;
using System.Data.SqlClient;
using System.Configuration;

namespace students1.Services.Mess
{
    public partial class BookMyMess : System.Web.UI.Page
    {
        private DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DataTable dt = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM Booking where MessId='" + Request.QueryString["MessId"] + "'");
                Rating1.CurrentRating = Convert.ToInt32(dt.Rows[0]["AverageRating"]);
                lblRatingStatus.Text = string.Format("{0} Users have rated. Average Rating {1}", dt.Rows[0]["RatingCount"], dt.Rows[0]["AverageRating"]);
            }
            DataView dv = (DataView)SqlCounter.Select(new DataSourceSelectArguments());
            if (dv.Count == 1)
            {
                String n = (String)dv[0][0];
                Session.Add("MessId", dv[0][1]);
                int m = int.Parse(n);
                m = m + 1;
                String c = Convert.ToString(m);
                hfCounter.Value = c;
                SqlCounter.Update();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            hfHold.Value = "Hold";
            int m = SqlBook.Insert();
            if (m == 1)
            {
                    Response.Write("<script>alert('Congratulations.. Your Mess is Booked')</script>");
                    Server.Transfer("Acknowledgement.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Server.Transfer("SearchMess.aspx");
        }
        protected void OnRatingChanged(object sender, RatingEventArgs e)
        {
            hfRating.Value = e.Value;
            Response.Write("<script>alert('Thank You...For giving us Rating')</script>");
        }
    }
}