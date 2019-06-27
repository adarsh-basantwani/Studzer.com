using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

namespace students1.cba321.Blogs
{
    public partial class Blogs : System.Web.UI.Page
    {
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
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            String ppath = Server.MapPath("~/cba321/Blogs/BlogImage");
            String img1 = txtName.Text;
            String img = ppath + "\\" + img1 + ".jpg";
            Stream strm = FileUpload1.PostedFile.InputStream;
            var targetFile = img;
            //Based on scalefactor image size will vary
            GenerateThumbnails(0.5, strm, targetFile);
            hfImage.Value = "~/cba321/Blogs/BlogImage/" + FileUpload1.FileName; ;
            hfCounter.Value = "0";
            int n = sqlds.Insert();
            if (n == 1)
            {
                lbl.Text = "Blog Inserted Successfully...";
            }
        }
    }
}