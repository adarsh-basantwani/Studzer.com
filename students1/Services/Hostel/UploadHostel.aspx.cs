using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
namespace students1.Services.Hostel
{
    public partial class UploadHostel : System.Web.UI.Page
    {
        int m;
        protected void Page_Load(object sender, EventArgs e)
        {
            hfNew.Value = "1";
            hfCounter.Value = "0";
            hfDisable.Value = "Yes";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session.Add("ContactNo1", txtContactNo1.Text);
            Session.Add("ContactNo2", txtContactNo2.Text);
            Session.Add("State", ddlState.SelectedValue);
            Session.Add("City", ddlCity.SelectedValue);
            Session.Add("HostelLocation", txtHostelLocation.Text);
            Session.Add("NearestLocation", ddlNearestLocation.SelectedValue);
            Session.Add("HostelGender", rblGender.SelectedValue);
            Session.Add("MessFacility", rblMessFacility.SelectedValue);
            Session.Add("Scheme", rblScheme.SelectedValue);
            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Hostel");
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
                hfUploadPhoto1.Value = "~/images/Hostel/" + Name + "\\" + fuUploadPhoto1.FileName;
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
                hfUploadPhoto2.Value = "~/images/Hostel/" + Name + "\\" + fuUploadPhoto2.FileName;
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
                hfUploadPhoto3.Value = "~/images/Hostel/" + Name + "\\" + fuUploadPhoto3.FileName;
            }
            else
            {
                hfUploadPhoto3.Value = null;
            } 
            Session.Add("UploadPhoto1", hfUploadPhoto1.Value);
            Session.Add("UploadPhoto2", hfUploadPhoto2.Value);
            Session.Add("UploadPhoto3", hfUploadPhoto3.Value);
            Session.Add("Counter", hfCounter.Value);
            Session.Add("Disable", hfDisable.Value);
            PanelUploadHostel3.Visible = true;
            PanelUploadHostel1.Visible = false;
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
            Session.Add("BathRoom", rblBathRoom.SelectedValue);
            Session.Add("HotWater", rblHotWater.SelectedValue);
            Session.Add("Parking", rblParking.SelectedValue);
            Session.Add("Wifi", rblWifi.SelectedValue);
            Session.Add("MoreAboutHostel", txtMoreAboutHostel.Text);
            int n = SqlUploadHostel.Insert();
            if (n == 1)
            {
                DataView dv = (DataView)SqlUploadHostel.Select(new DataSourceSelectArguments());
                if (dv.Count == 1)
                {
                    m = (int)dv[0][0];
                    hfHostelId.Value = Convert.ToString(m);
                    PanelUploadHostel2.Visible = true;
                    PanelUploadHostel3.Visible = false;
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int n = SqlAddRoom.Insert();
            if (n == 1)
            {
                Response.Write("<script>alert('Rooms Added Successfully...If you want to add more rooms then enter the data again and click on 'Add Room' button otherwise click 'Next')</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (rblMessFacility.SelectedValue.Equals("Yes"))
            {
                if (rblRent.SelectedValue.Equals("2"))
                {
                    lblMessRent.Visible = true;
                    txtMessRent.Visible = true;
                }
                PanelUploadMess1.Visible = true;
                PanelUploadHostel2.Visible = false;
            }
            else
            {
                PanelUploadHostel5.Visible = true;
                PanelUploadHostel2.Visible = false;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Hostel");
            String upath = path + "\\" + Name;
            String img1path;
            if (fuMessPhoto.HasFile == true)
            {
                if (Directory.Exists(upath))
                {
                    img1path = upath + "\\" + fuMessPhoto.FileName;
                }
                else
                {
                    Directory.CreateDirectory(upath);
                    img1path = upath + "\\" + fuMessPhoto.FileName;
                }
                Stream strm1 = fuMessPhoto.PostedFile.InputStream;
                var targetFile = img1path;
                //Based on scalefactor image size will vary
                GenerateThumbnails(0.5, strm1, targetFile);
                hfUploadPhoto1.Value = "~/images/Hostel/" + Name + "\\" + fuMessPhoto.FileName;
            }
            else
            {
                hfMessPhoto.Value = null;
            }
            int n = SqlUploadMess.Update();
            if (n == 1)
            {
                PanelUploadMess1.Visible = false;
                PanelUploadHostel5.Visible = true;
            }
            
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Hostel");
            String upath = path + "\\" + Name;
            String[] arr = Directory.GetFiles(upath);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("ContactNo1");
            Session.Remove("ContactNo2");
            Session.Remove("State");
            Session.Remove("City");
            Session.Remove("HostelLocation");
            Session.Remove("NearestLocation");
            Session.Remove("HostelGender");
            Session.Remove("MessFacility");
            Session.Remove("Scheme");
            Session.Remove("UploadPhoto1");
            Session.Remove("UploadPhoto2");
            Session.Remove("UploadPhoto3");
            Session.Remove("Counter");
            Session.Remove("Disable");
            PanelUploadHostel1.Visible = true;
            PanelUploadHostel3.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Remove("BathRoom");
            Session.Remove("HotWater");
            Session.Remove("Parking");
            Session.Remove("Wifi");
            Session.Remove("MoreAboutHostel");
            PanelUploadHostel3.Visible = true;
            PanelUploadHostel2.Visible = false;
            
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Hostel");
            String upath = path + "\\" + Name;
            String[] arr = Directory.GetFiles(upath);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("ContactNo1");
            Session.Remove("ContactNo2");
            Session.Remove("State");
            Session.Remove("City");
            Session.Remove("HostelLocation");
            Session.Remove("NearestLocation");
            Session.Remove("HostelGender");
            Session.Remove("MessFacility");
            Session.Remove("Scheme");
            Session.Remove("UploadPhoto1");
            Session.Remove("UploadPhoto2");
            Session.Remove("UploadPhoto3");
            Session.Remove("Counter");
            Session.Remove("Disable");
            Session.Remove("BathRoom");
            Session.Remove("HotWater");
            Session.Remove("Parking");
            Session.Remove("Wifi");
            Session.Remove("MoreAboutHostel");
            int n = SqlDeleteDetails.Delete();
            if (n == 1)
            {
                SqlDeleteDetails0.Delete();
                PanelUploadHostel1.Visible = true;
                PanelUploadHostel5.Visible = false;
                Response.Write("<script>alert('You Have to fill the Form again to edit your details..')</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Hostel");
            String upath = path + "\\" + Name;
            String[] arr = Directory.GetFiles(upath);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("ContactNo1");
            Session.Remove("ContactNo2");
            Session.Remove("State");
            Session.Remove("City");
            Session.Remove("HostelLocation");
            Session.Remove("NearestLocation");
            Session.Remove("HostelGender");
            Session.Remove("MessFacility");
            Session.Remove("Scheme");
            Session.Remove("UploadPhoto1");
            Session.Remove("UploadPhoto2");
            Session.Remove("UploadPhoto3");
            Session.Remove("Counter");
            Session.Remove("Disable");
            Session.Remove("BathRoom");
            Session.Remove("HotWater");
            Session.Remove("Parking");
            Session.Remove("Wifi");
            Session.Remove("MoreAboutHostel");
            int n = SqlDeleteDetails.Delete();
            if (n == 1)
            {
                SqlDeleteDetails0.Delete();
                Response.Write("<script>alert('Add Deleted..')</script>");
                Server.Transfer("~/Account/UserPanel.aspx");
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                hfNew2.Value = "2";
                SqlDeleteDetails.Update();
                Response.Write("<script>alert('Congratulations.. Your Hostel is Uploaded on Our Site. Please Kindly Login Twice in a Week to Check Your Booking Status.')</script>");
                Server.Transfer("~/Account/UserPanel.aspx");
            }
            else
            {
                Response.Write("<script>alert('Make Sure that You Have Checked the Above Information')</script>");
            }
        }
    }
}