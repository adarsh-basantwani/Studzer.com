using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Net.Mail;
using students1.Classes;
namespace students1.cba321.Tution
{
    public partial class TutionMail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Password pwd = new Password();
            if (!IsPostBack)
            {
                txtTo.Text = Request.QueryString["EmailId"];
                String s = "";
                s = s + "Thank you..<br>For Posting Your Add on our site.";
                s = s + "Your UserId is: '" + Request.QueryString["ContactNo"] + "'";
                s= s + "<br>Password is: '" + pwd.Decrypt(Request.QueryString["Password"]) + "'";
                s=s + "<br>Click on this link and enter your UserId and Password";
                s=s + "<br><a href ='http://www.studzer.com/Services/Tutions/Login.aspx'>Click here to activate your account.</a>";
                txtBody.Text = s;
            }
        }
        protected void SendEmail(object sender, EventArgs e)
        {
            using (MailMessage mm = new MailMessage(txtEmail.Text, txtTo.Text))
            {
                mm.Subject = txtSubject.Text;
                mm.Body = txtBody.Text;
                if (fuAttachment.HasFile)
                {
                    string FileName = Path.GetFileName(fuAttachment.PostedFile.FileName);
                    mm.Attachments.Add(new Attachment(fuAttachment.PostedFile.InputStream, FileName));
                }
                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential(txtEmail.Text, txtPassword.Text);
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
            }
        }
    }
}