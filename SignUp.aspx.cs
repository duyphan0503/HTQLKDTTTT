using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void SendVerificationEmail(string email, string verificationCode)
    {
        string senderEmail = "autosendcodez@gmail.com"; // Địa chỉ email của bạn
        string senderPassword = "ntgs lqjg wssy mxyh"; // Mật khẩu email của bạn

        SmtpClient smtpClient = new SmtpClient("smtp.gmail.com")
        {
            Port = 587,
            Credentials = new NetworkCredential(senderEmail, senderPassword),
            EnableSsl = true,
        };

        MailMessage mailMessage = new MailMessage(senderEmail, email)
        {
            Subject = "Xác thực tài khoản",
            Body = "Mã xác thực của bạn là: {verificationCode}",
            IsBodyHtml = false,
        };
        try
        {
            smtpClient.Send(mailMessage);
            Console.WriteLine("Email đã được gửi thành công.");
        }
        catch (Exception ex)
        {
            Console.WriteLine("Gửi email thất bại: {ex.Message}");
        }
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        string verificationCode = Guid.NewGuid().ToString();
        SendVerificationEmail(txtEmail.Text, verificationCode);
        Response.Write("Một email xác thực đã được gửi đến địa chỉ email của bạn.");
    }
}