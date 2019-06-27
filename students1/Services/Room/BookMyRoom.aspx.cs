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
namespace students1.Services
{
    public partial class BookMyRoom : System.Web.UI.Page
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
                DataTable dt = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM Booking where RoomId='" + Request.QueryString["RoomId"] + "'");
                Rating1.CurrentRating = Convert.ToInt32(dt.Rows[0]["AverageRating"]);
                lblRatingStatus.Text = string.Format("{0} Users have rated. Average Rating {1}", dt.Rows[0]["RatingCount"], dt.Rows[0]["AverageRating"]);
            }
            hfStatus.Value = "Yes";
            DataView dv = (DataView)SqlCounter.Select(new DataSourceSelectArguments());
            if (dv.Count == 1)
            {
                String n = (String)dv[0][0];
                Session.Add("RoomId",dv[0][1]);
                int m = int.Parse(n);
                m = m + 1;
                String c = Convert.ToString(m);
                hfCounter.Value = c;
                SqlCounter.Update();
            }
            DataView dv1 = (DataView)SqlDisplayDetails1.Select(new DataSourceSelectArguments());
            if (dv1.Count == 1)
            {
                String n = (String)dv1[0][0];
                if (n.Equals("No"))
                {
                    lbl.Text = "This Room is already Booked But it is not confirmed by the Landlord. If You want to Book this Room then Click on the 'BookMyRoom' button below and Go to Landlord and Confirm your Booking as early as possible.";
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            hfHold.Value = "Hold";
            int m = SqlBook.Insert();
                if(m==1)
              {
                    int n = SqlBookRoom.Update();
                    if (n == 1)
                {
                Response.Write("<script>alert('Congratulations.. Your Room is Booked')</script>");
                Server.Transfer("Acknowledgement.aspx");
                }
             }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Server.Transfer("SearchRoom.aspx");
        }
        protected void OnRatingChanged(object sender, RatingEventArgs e)
        {
            hfRating.Value = e.Value;
            Response.Write("<script>alert('Thank You...For giving us Rating')</script>");
        }


    }
}