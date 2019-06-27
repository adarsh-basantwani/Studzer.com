using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using students1.Classes;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Data;
namespace students1.Services.Tution
{
    public partial class UploadTution : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtContactNo.Text = Session["UserId"].ToString();
                txtEmailId.Text = Session["EmailId"].ToString();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            if (dv.Count == 1)
            {
                Response.Write("<script>alert('ContactNo Already Exists...Please Choose different ContactNo')</script>");
                txtContactNo.Text = " ";
                return;
            }
            Password pwd = new Password();
            hfPassword.Value = pwd.Encrypt(CreateRandomPassword(6));
            if (fuUploadPhoto1.HasFile == true)
            {
                String path = Server.MapPath("~/images/Tution");
                String imgpath = path + "\\" + txtContactNo.Text + ".jpg";
                Stream strm = fuUploadPhoto1.PostedFile.InputStream;
                var targetFile = imgpath;
                //Based on scalefactor image size will vary
                GenerateThumbnails(0.5, strm, targetFile);
                hfUploadPhoto1.Value = "~/images/Tution/" + txtContactNo.Text + ".jpg";
            }
            else
            {
                hfUploadPhoto1.Value = null;
            }
            hfDisable.Value = "Yes";
            int n = SqlTution.Insert();
            if (n == 1)
            {
                Response.Write("<script>alert('Tution Uploaded...Please wait for Email on your submitted emailid to fill up your remaining details. The mail will arrive within 1 or 2 working days')</script>");
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
        public static string CreateRandomPassword(int PasswordLength)
        {
            string _allowedChars = "0123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
            Random randNum = new Random();
            char[] chars = new char[PasswordLength];
            int allowedCharCount = _allowedChars.Length;
            for (int i = 0; i < PasswordLength; i++)
            {
                chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
            }
            return new string(chars);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Account/UserPanel.aspx");
        }
        
    }
}