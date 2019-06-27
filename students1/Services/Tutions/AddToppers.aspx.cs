using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
namespace students1.Services.Tutions
{
    public partial class AddToppers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (fuUploadPhoto1.HasFile == true)
            {
                String path = Server.MapPath("~/images/Tution");
                String id = Session["TutionId"].ToString();
                String upath = path + "\\" + id;
                String imgpath;
                if (Directory.Exists(upath))
                {
                    imgpath = upath + "\\" + fuUploadPhoto1.FileName;
                }
                else
                {
                    Directory.CreateDirectory(upath);
                    imgpath = upath + "\\" + fuUploadPhoto1.FileName;
                }
                Stream strm = fuUploadPhoto1.PostedFile.InputStream;
                var targetFile = imgpath;
                //Based on scalefactor image size will vary
                GenerateThumbnails(0.5, strm, targetFile);
                hfUploadPhoto1.Value = "~/images/Tution/" + id + "\\" + fuUploadPhoto1.FileName;
            }
            else
            {
                hfUploadPhoto1.Value = null;
            }
            int n = SqlTopper.Insert();
            if (n == 1)
            {
                Response.Write("<script>alert('Topper Uploaded...')</script>");
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
    }
}