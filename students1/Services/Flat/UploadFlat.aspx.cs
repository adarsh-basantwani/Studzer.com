using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace students1.Services.Flat
{
    public partial class UploadFlat : System.Web.UI.Page
    {
        int m;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session.Add("ContactNo1", txtContactNo1.Text);
            Session.Add("ContactNo2", txtContactNo2.Text);
            Session.Add("FlatLocation", txtFlatLocation.Text);
            Session.Add("NearestLocation", ddlNearestLocation.SelectedValue);
            Session.Add("FlatGender", rblGender.SelectedValue);
            Session.Add("State", ddlState.SelectedValue);
            Session.Add("City", ddlCity.SelectedValue);
            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Flat");
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
                hfUploadPhoto1.Value = "~/images/Flat/" + Name + "\\" + fuUploadPhoto1.FileName;
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
                hfUploadPhoto2.Value = "~/images/Flat/" + Name + "\\" + fuUploadPhoto2.FileName;
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
                hfUploadPhoto3.Value = "~/images/Flat/" + Name + "\\" + fuUploadPhoto3.FileName;
            }
            else
            {
                hfUploadPhoto3.Value = null;
            } 
            Session.Add("UploadPhoto1", hfUploadPhoto1.Value);
            Session.Add("UploadPhoto2", hfUploadPhoto2.Value);
            Session.Add("UploadPhoto3", hfUploadPhoto3.Value);
            PanelUploadFlat2.Visible = true;
            PanelUploadFlat1.Visible = false;
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
            Session.Add("FlatType", ddlFlatType.SelectedValue);
            Session.Add("BathRoom", txtBathRoom.Text);
            Session.Add("Floor", txtFloor.Text);
            Session.Add("Rent", txtRent.Text);
            Session.Add("SecurityDeposit", txtSecurityDeposit.Text);
            Session.Add("FlatArea", txtFlatArea.Text);
            Session.Add("LightBill", rblLightBill.SelectedValue);
            Session.Add("Parking", rblParking.SelectedValue);
            Session.Add("MoreAboutFlat", txtMoreAboutFlat.Text);
            hfStatus.Value = "No";
            hfConfirm.Value = "No";
            hfCounter.Value = "0";
            hfNo.Value = "No";
            hfNew.Value = "1";
            int n = SqlUploadFlat.Insert();
            if (n == 1)
            {
                DataView dv = (DataView)SqlUploadFlat.Select(new DataSourceSelectArguments());
                if (dv.Count == 1)
                {
                     m = (int)dv[0][0];
                     hfFlatId.Value = Convert.ToString(m);
                     PanelUploadFlat3.Visible = true;
                     PanelUploadFlat2.Visible = false;
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Flat");
            String upath = path + "\\" + Name;
            String[] arr = Directory.GetFiles(upath);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("FlatLocation");
            Session.Remove("State");
            Session.Remove("City");
            Session.Remove("NearestLocation");
            Session.Remove("FlatGender");
            Session.Remove("ContactNo1");
            Session.Remove("ContactNo2");
            Session.Remove("UploadPhoto1");
            Session.Remove("UploadPhoto2");
            Session.Remove("UploadPhoto3");
            Session.Remove("FlatArea");
            Session.Remove("FlatType");
            Session.Remove("LightBill");
            Session.Remove("BathRoom");
            Session.Remove("Floor");
            Session.Remove("SecurityDeposit");
            Session.Remove("Parking");
            Session.Remove("Rent");
            Session.Remove("MoreAboutFlat");
            int n = SqlDeleteDetails.Delete();
            if (n == 1)
            {
                PanelUploadFlat1.Visible = true;
                PanelUploadFlat3.Visible = false;
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                hfNew2.Value = "2";
                SqlDeleteDetails.Update();
                Response.Write("<script>alert('Congratulations.. Your Flat is Uploaded on Our Site. Please Kindly Login Twice in a Week to Check Your Booking Status.')</script>");
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
            String path = Server.MapPath("~/images/Flat");
            String upath = path + "\\" + Name;
            String[] arr = Directory.GetFiles(upath);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("FlatLocation");
            Session.Remove("NearestLocation");
            Session.Remove("FlatGender");
            Session.Remove("ContactNo1");
            Session.Remove("ContactNo2");
            Session.Remove("State");
            Session.Remove("City");
            Session.Remove("UploadPhoto1");
            Session.Remove("UploadPhoto2");
            Session.Remove("UploadPhoto3");
            Session.Remove("FlatArea");
            Session.Remove("FlatType");
            Session.Remove("LightBill");
            Session.Remove("BathRoom");
            Session.Remove("Floor");
            Session.Remove("SecurityDeposit");
            Session.Remove("Parking");
            Session.Remove("Rent");
            Session.Remove("MoreAboutFlat");
            int n = SqlDeleteDetails.Delete();
            if (n == 1)
            {
                Response.Write("<script>alert('Add Deleted...')</script>");
                Server.Transfer("~/Account/UserPanel.aspx");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Flat");
            String upath = path + "\\" + Name;
            String[] arr = Directory.GetFiles(upath);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("FlatLocation");
            Session.Remove("NearestLocation");
            Session.Remove("FlatGender");
            Session.Remove("ContactNo1");
            Session.Remove("ContactNo2");
            Session.Remove("UploadPhoto1");
            Session.Remove("UploadPhoto2");
            Session.Remove("UploadPhoto3");
            Session.Remove("State");
            Session.Remove("City");
            PanelUploadFlat1.Visible = true;
            PanelUploadFlat2.Visible = false;
        }
    }
}