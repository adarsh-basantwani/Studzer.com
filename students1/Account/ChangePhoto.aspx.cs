using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

namespace students1.Account
{
    public partial class ChangePhoto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String ppath = Server.MapPath("~/images/ProfilePhotos");
            String uid = (String)Session["UserId"];
            String imgpath = ppath + "\\" + uid + ".jpg";
            Stream strm = fuUploadPhoto.PostedFile.InputStream;
            var targetFile = imgpath;
            //Based on scalefactor image size will vary
            GenerateThumbnails(0.5, strm, targetFile);

            hfUploadPhoto.Value = "~/images/ProfilePhotos/" + uid + ".jpg";
            SqlPhoto.Update();

        }
    }
}