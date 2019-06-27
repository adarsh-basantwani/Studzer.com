using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace students1.Services
{
    public partial class UploadRoom : System.Web.UI.Page
    {
        int m;
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            hfDate.Value = DateTime.Today.ToString();
            Session.Add("RoomLocation", txtRoomLocation.Text);
            Session.Add("NearestLocation", ddlNearestLocation.SelectedValue);
            Session.Add("NoOfPerson", txtNoOfPerson.Text);
            Session.Add("RentPerHead", txtRentPerHead.Text);
            Session.Add("Gender", rblGender.SelectedValue);
            Session.Add("Date", hfDate.Value);
            String Name = (String)Session["Name"];
            String path = Server.MapPath("images");
            String img1 = fuUploadPhoto1.FileName;
            String img = path + "\\" + ddlNearestLocation.SelectedValue + "\\Room\\" + Name;
            String img1path = img + "\\" + img1;
            fuUploadPhoto1.SaveAs(img1path);
            String img2 = fuUploadPhoto2.FileName;
            String img2path = img + "\\" + img2;
            fuUploadPhoto2.SaveAs(img2path);
            String img3 = fuUploadPhoto3.FileName;
            String img3path = img + "\\" + img3;
            fuUploadPhoto3.SaveAs(img3path);
            hfUploadPhoto1.Value = img1path;
            hfUploadPhoto2.Value = img2path;
            hfUploadPhoto3.Value = img3path;
            Session.Add("UploadPhoto1", hfUploadPhoto1.Value);
            Session.Add("UploadPhoto2", hfUploadPhoto2.Value);
            Session.Add("UploadPhoto3", hfUploadPhoto3.Value);
            PanelUploadRoom2.Visible = true;
            PanelUploadRoom1.Visible = false;
        }

        protected void btnUpload1_Click(object sender, EventArgs e)
        {
            Session.Add("LightBill", rblLightBill.SelectedValue);
            Session.Add("BathRoom", rblBathRoom.SelectedValue);
            Session.Add("HotWater", rblHotWater.SelectedValue);
            Session.Add("Cooking", rblCooking.SelectedValue);
            Session.Add("Parking", rblParking.SelectedValue);
            Session.Add("Wifi", rblWifi.SelectedValue);
            Session.Add("MoreAboutRoom", txtMoreAboutRoom.Text);
            hfStatus.Value = "No";
            hfConfirm.Value = "No";
            hfCounter.Value = "0";
            hfNo.Value = "No";
            hfNew.Value = "1";
            int n = SqlUploadRoom.Insert();
            if (n == 1)
            {
                DataView dv = (DataView)SqlUploadRoom.Select(new DataSourceSelectArguments());
                if (dv.Count == 1)
                {
                     m = (int)dv[0][0];
                     hfRoomId.Value = Convert.ToString(m);
                     PanelUploadRoom3.Visible = true;
                     PanelUploadRoom2.Visible = false;
                }
            }
        }
        
        protected void btnBack_Click(object sender, EventArgs e)
        {

            String ppath = Server.MapPath("images");
            String NearestLocation = (String)Session["NearestLocation"];
            String Name = (String)Session["Name"];
            String img = ppath + "\\" + NearestLocation + "\\Room\\"+Name;
            String[] arr = Directory.GetFiles(img);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("RoomLocation");
            Session.Remove("NearestLocation");
            Session.Remove("NoOfPerson");
            Session.Remove("RentPerHead");
            Session.Remove("Gender");
            Session.Remove("Date");
            Session.Remove("UploadPhoto1");
            Session.Remove("UploadPhoto2");
            Session.Remove("UploadPhoto3");
            PanelUploadRoom1.Visible = true;
            PanelUploadRoom2.Visible = false;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            String ppath = Server.MapPath("images");
            String NearestLocation = (String)Session["NearestLocation"];
            String Name = (String)Session["Name"];
            String img = ppath + "\\" + NearestLocation + "\\Room\\"+Name;
            String[] arr = Directory.GetFiles(img);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("RoomLocation");
            Session.Remove("NearestLocation");
            Session.Remove("NoOfPerson");
            Session.Remove("RentPerHead");
            Session.Remove("Gender");
            Session.Remove("Date");
            Session.Remove("UploadPhoto1");
            Session.Remove("UploadPhoto2");
            Session.Remove("UploadPhoto3");
            Session.Remove("LightBill");
            Session.Remove("BathRoom");
            Session.Remove("HotWater");
            Session.Remove("Cooking");
            Session.Remove("Parking");
            Session.Remove("Wifi");
            Session.Remove("MoreAboutRoom");
            int n = SqlDeleteDetails.Delete();
            if (n == 1)
            {
                PanelUploadRoom1.Visible = true;
                PanelUploadRoom3.Visible = false;
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
           
            if (CheckBox1.Checked)
            {
                hfNew2.Value = "2";
                SqlDeleteDetails.Update();
               Response.Write("<script>alert('Congratulations.. Your Room is Uploaded on Our Site. Please Kindly Login Twice in a Week to Check Your Booking Status.')</script>");
               Server.Transfer("Panel.aspx");
            }
            else
            {
                Response.Write("<script>alert('Make Sure that You Have Checked the Above Information')</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            String ppath = Server.MapPath("images");
            String NearestLocation = (String)Session["NearestLocation"];
            String Name = (String)Session["Name"];
            String img = ppath + "\\" + NearestLocation + "\\Room\\"+Name;
            String[] arr = Directory.GetFiles(img);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("RoomLocation");
            Session.Remove("NearestLocation");
            Session.Remove("NoOfPerson");
            Session.Remove("RentPerHead");
            Session.Remove("Gender");
            Session.Remove("Date");
            Session.Remove("UploadPhoto1");
            Session.Remove("UploadPhoto2");
            Session.Remove("UploadPhoto3");
            Session.Remove("LightBill");
            Session.Remove("BathRoom");
            Session.Remove("HotWater");
            Session.Remove("Cooking");
            Session.Remove("Parking");
            Session.Remove("Wifi");
            Session.Remove("MoreAboutRoom");
           int n=SqlDeleteDetails.Delete();
           if (n == 1)
           {
               Response.Write("<script>alert('Add Deleted...')</script>");
               Server.Transfer("Panel.aspx");
           }
        }
    }
}