using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

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
            Session.Add("State", ddlState.SelectedValue);
            Session.Add("City", ddlCity.SelectedValue);
            Session.Add("RoomLocation", txtRoomLocation.Text);
            Session.Add("NearestLocation", ddlNearestLocation.SelectedValue);
            Session.Add("NoOfPerson", txtNoOfPerson.Text);
            Session.Add("RentPerHead", txtRentPerHead.Text);
            Session.Add("RoomGender", rblGender.SelectedValue);
            Session.Add("ContactNo1", txtContactNo1.Text);
            Session.Add("ContactNo2", txtContactNo2.Text);
            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Room");
            String upath = path + "\\" + Name;
            String img1path;
            String img2path;
            String img3path;
            if (fuUploadPhoto1.HasFile == true)
            {
                if (Directory.Exists(upath))
                {
                    img1path = upath + "\\" + fuUploadPhoto1.FileName;
                }
                else
                {
                    Directory.CreateDirectory(upath);
                    img1path = upath + "\\" + fuUploadPhoto1.FileName;
                }
                Stream strm1 = fuUploadPhoto1.PostedFile.InputStream;
                var targetFile = img1path;
                //Based on scalefactor image size will vary
                GenerateThumbnails(0.5, strm1, targetFile);
                hfUploadPhoto1.Value = "~/images/Room/" + Name + "\\" + fuUploadPhoto1.FileName;
            }
            else
            {
                hfUploadPhoto1.Value = null;
            }
            if (fuUploadPhoto2.HasFile == true)
            {
                if (Directory.Exists(upath))
                {
                    img2path = upath + "\\" + fuUploadPhoto2.FileName;
                }
                else
                {
                    Directory.CreateDirectory(upath);
                    img2path = upath + "\\" + fuUploadPhoto2.FileName;
                }
                Stream strm2 = fuUploadPhoto2.PostedFile.InputStream;
                var targetFile = img2path;
                //Based on scalefactor image size will vary
                GenerateThumbnails(0.5, strm2, targetFile);
                hfUploadPhoto2.Value = "~/images/Room/" + Name + "\\" + fuUploadPhoto2.FileName;
            }
            else
            {
                hfUploadPhoto2.Value = null;
            }
            if (fuUploadPhoto3.HasFile == true)
            {
                if (Directory.Exists(upath))
                {
                    img3path = upath + "\\" + fuUploadPhoto3.FileName;
                }
                else
                {
                    Directory.CreateDirectory(upath);
                    img3path = upath + "\\" + fuUploadPhoto3.FileName;
                }
                Stream strm3 = fuUploadPhoto3.PostedFile.InputStream;
                var targetFile = img3path;
                //Based on scalefactor image size will vary
                GenerateThumbnails(0.5, strm3, targetFile);
                hfUploadPhoto3.Value = "~/images/Room/" + Name + "\\" + fuUploadPhoto3.FileName;
            }
            else
            {
                hfUploadPhoto3.Value = null;
            } 
            Session.Add("UploadPhoto1", hfUploadPhoto1.Value);
            Session.Add("UploadPhoto2", hfUploadPhoto2.Value);
            Session.Add("UploadPhoto3", hfUploadPhoto3.Value);
            PanelUploadRoom2.Visible = true;
            PanelUploadRoom1.Visible = false;
        }
        private void GenerateThumbnails(double scaleFactor, Stream sourcePath, string targetPath)
        {
            using (var image = Image.FromStream(sourcePath))
            {
                var newWidth = (int)(image.Width * scaleFactor);
                var newHeight = (int)(image.Height * scaleFactor);
                var thumbnailImg = new Bitmap(newWidth, newHeight);
                var thumbGraph = Graphics.FromImage(thumbnailImg);
                thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
                thumbGraph.DrawImage(image, imageRectangle);
                thumbnailImg.Save(targetPath, image.RawFormat);
            }
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
            hfYes.Value = "Yes";
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

            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Room");
            String upath = path + "\\" + Name;
            String[] arr = Directory.GetFiles(upath);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("RoomLocation");
            Session.Remove("State");
            Session.Remove("City");
            Session.Remove("NearestLocation");
            Session.Remove("NoOfPerson");
            Session.Remove("RentPerHead");
            Session.Remove("RoomGender");
            Session.Remove("UploadPhoto1");
            Session.Remove("UploadPhoto2");
            Session.Remove("UploadPhoto3");
            Session.Remove("ContactNo1");
            Session.Remove("ContactNo2");
            PanelUploadRoom1.Visible = true;
            PanelUploadRoom2.Visible = false;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Room");
            String upath = path + "\\" + Name;
            String[] arr = Directory.GetFiles(upath);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("RoomLocation");
            Session.Remove("State");
            Session.Remove("City");
            Session.Remove("NearestLocation");
            Session.Remove("NoOfPerson");
            Session.Remove("RentPerHead");
            Session.Remove("RoomGender");
            Session.Remove("ContactNo1");
            Session.Remove("ContactNo2");
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
               Server.Transfer("~/Account/UserPanel.aspx");
            }
            else
            {
                Response.Write("<script>alert('Make Sure that You Have Checked the Above Information')</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Room");
            String upath = path + "\\" + Name;
            String[] arr = Directory.GetFiles(upath);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("RoomLocation");
            Session.Remove("State");
            Session.Remove("City");
            Session.Remove("NearestLocation");
            Session.Remove("NoOfPerson");
            Session.Remove("RentPerHead");
            Session.Remove("RoomGender");
            Session.Remove("ContactNo1");
            Session.Remove("ContactNo2");
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
               Server.Transfer("~/Account/UserPanel.aspx");
           }
        }
    }
}