using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

namespace students1.cba321.Home
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string targetPath = Server.MapPath("~/cba321/Home/Adds/" + filename);
            Stream strm = FileUpload1.PostedFile.InputStream;
            var targetFile = targetPath;
            //Based on scalefactor image size will vary
            GenerateThumbnails(0.5, strm, targetFile);
            hfImage.Value = "~/cba321/Home/Adds/" + filename;
            hfDate.Value = DateTime.Today.ToString();
            int m = int.Parse(txtNoOfDays.Text);
            hfEndingDate.Value = DateTime.Today.AddDays(m).ToString();
            int n = sqlds.Insert();
            if (n == 1)
            {
                lbl.Text = "Add Uploaded Successfully...";
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