using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
namespace students1.Services.Mess
{
    public partial class UploadMess : System.Web.UI.Page
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
            Session.Add("MessLocation", txtMessLocation.Text);
            Session.Add("NearestLocation", ddlNearestLocation.SelectedValue);
            Session.Add("State", ddlState.SelectedValue);
            Session.Add("City", ddlCity.SelectedValue);
            Session.Add("MonthlyPrice", txtMonthlyPrice.Text);
            Session.Add("MessType", rblMessType.SelectedValue);
            Session.Add("TiffinFacility", rblTiffinFacility.SelectedValue);
            Session.Add("ContactNo1", txtContactNo1.Text);
            Session.Add("ContactNo2", txtContactNo2.Text);
            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Mess");
            String upath = path + "\\" + Name;
            String img1path;
            String img2path;
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
                hfUploadPhoto1.Value = "~/images/Mess/" + Name + "\\" + fuUploadPhoto1.FileName;
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
                hfUploadPhoto2.Value = "~/images/Mess/" + Name + "\\" + fuUploadPhoto2.FileName;
            }
            else
            {
                hfUploadPhoto2.Value = null;
            }
            Session.Add("UploadPhoto1", hfUploadPhoto1.Value);
            Session.Add("UploadPhoto2", hfUploadPhoto2.Value);
            Session.Add("Counter", hfCounter.Value);
            Session.Add("Disable", hfDisable.Value);
            Session.Add("Scheme", rblScheme.SelectedValue);
            if (rblTiffinFacility.SelectedValue.Equals("Yes"))
            {
                PanelUploadMess2.Visible = true;
                PanelUploadMess1.Visible = false;
            }
            else
            {
                int n=SqlUploadMess.Insert();
                if (n == 1)
                {
                    DataView dv = (DataView)SqlUploadMess.Select(new DataSourceSelectArguments());
                    if (dv.Count == 1)
                    {
                        m = (int)dv[0][0];
                        hfMessId.Value = Convert.ToString(m);
                        PanelUploadMess3.Visible = true;
                        PanelUploadMess1.Visible = false;
                    }
                }
            }
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
            Session.Add("FullChapati", txtChapati.Text);
            Session.Add("FullSabji", txtSabji.Text);
            Session.Add("FullRice", rblRice.SelectedValue);
            Session.Add("FullDal", rblDal.SelectedValue);
            Session.Add("FullSalad", rblSalad.SelectedValue);
            Session.Add("FullMonthlyprice", txtMonthlyPrice1.Text);
            Session.Add("HalfChapati", txtChapati1.Text);
            Session.Add("Halfsabji", txtSabji1.Text);
            Session.Add("HalfRice", rblRice1.SelectedValue);
            Session.Add("HalfDal", rblDal1.SelectedValue);
            Session.Add("HalfSalad", rblSalad1.SelectedValue);
            Session.Add("HalfMonthlyprice", txtMonthlyPrice2.Text);
            int n = SqlUploadMess1.Insert();
            if (n == 1)
            {
                DataView dv = (DataView)SqlUploadMess.Select(new DataSourceSelectArguments());
                if (dv.Count == 1)
                {
                    m = (int)dv[0][0];
                    hfMessId.Value = Convert.ToString(m);
                    PanelUploadMess3.Visible = true;
                    PanelUploadMess2.Visible = false;
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Mess");
            String upath = path + "\\" + Name;
            String[] arr = Directory.GetFiles(upath);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("MessLocation");
            Session.Remove("NearestLocation");
            Session.Remove("State");
            Session.Remove("City");
            Session.Remove("MonthlyPrice");
            Session.Remove("MessType");
            Session.Remove("TiffinFacility");
            Session.Remove("UploadPhoto1");
            Session.Remove("UploadPhoto2");
            Session.Remove("Disable");
            Session.Remove("Counter");
            Session.Remove("Scheme");
            Session.Remove("ContactNo1");
            Session.Remove("ContactNo2");
            PanelUploadMess1.Visible = true;
            PanelUploadMess2.Visible = false;
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            String Name = (String)Session["UserId"];
            String path = Server.MapPath("~/images/Mess");
            String upath = path + "\\" + Name;
            String[] arr = Directory.GetFiles(upath);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("MessLocation");
            Session.Remove("NearestLocation");
            Session.Remove("State");
            Session.Remove("City");
            Session.Remove("MonthlyPrice");
            Session.Remove("MessType");
            Session.Remove("TiffinFacility");
            Session.Remove("UploadPhoto1");
            Session.Remove("UploadPhoto2");
            Session.Remove("Disable");
            Session.Remove("Counter");
            Session.Remove("Scheme");
            Session.Remove("ContactNo1");
            Session.Remove("ContactNo2");
            Session.Remove("FullChapati");
            Session.Remove("FullSabji");
            Session.Remove("FullRice");
            Session.Remove("FullDal");
            Session.Remove("FullSalad");
            Session.Remove("FullMonthlyPrice");
            Session.Remove("HalfChapati");
            Session.Remove("HalfSabji");
            Session.Remove("HalfRice");
            Session.Remove("HalfDal");
            Session.Remove("HalfSalad");
            Session.Remove("HalfMonthlyPrice");
            int n = SqlDeleteDetails.Delete();
            if (n == 1)
            {
                PanelUploadMess1.Visible = true;
                PanelUploadMess3.Visible = false;
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            if (CheckBox1.Checked)
            {
                hfNew2.Value = "2";
                SqlDeleteDetails.Update();
                Response.Write("<script>alert('Congratulations.. Your Mess is Uploaded on Our Site. Please Kindly Login Twice in a Week to Check Your Booking Status.')</script>");
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
            String path = Server.MapPath("~/images/Mess");
            String upath = path + "\\" + Name;
            String[] arr = Directory.GetFiles(upath);
            foreach (String ipath in arr)
            {
                File.Delete(ipath);
            }
            Session.Remove("MessLocation");
            Session.Remove("NearestLocation");
            Session.Remove("State");
            Session.Remove("City");
            Session.Remove("MonthlyPrice");
            Session.Remove("MessType");
            Session.Remove("TiffinFacility");
            Session.Remove("UploadPhoto1");
            Session.Remove("UploadPhoto2");
            Session.Remove("Disable");
            Session.Remove("Counter");
            Session.Remove("Scheme");
            Session.Remove("ContactNo1");
            Session.Remove("ContactNo2");
            Session.Remove("FullChapati");
            Session.Remove("FullSabji");
            Session.Remove("FullRice");
            Session.Remove("FullDal");
            Session.Remove("FullSalad");
            Session.Remove("FullMonthlyPrice");
            Session.Remove("HalfChapati");
            Session.Remove("HalfSabji");
            Session.Remove("HalfRice");
            Session.Remove("HalfDal");
            Session.Remove("HalfSalad");
            Session.Remove("HalfMonthlyPrice");
            
            int n = SqlDeleteDetails.Delete();
            if (n == 1)
            {
                Response.Write("<script>alert('Add Deleted...')</script>");
                Server.Transfer("~/Account/UserPanel.aspx");
            }
        }
    }
}