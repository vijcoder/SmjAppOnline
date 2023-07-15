using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Services
{
    public static class EmailManager
    {
        public static Task<bool> SendEmail(string Subject, string ToEmail, string emailBody, ListDictionary replacements)
        {
            try
            {
                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress("vijay.darji2404@gmail.com");
                    mail.To.Add(ToEmail);
                    mail.Subject = Subject;
                    mail.Body = emailBody;
                    mail.IsBodyHtml = true;
                    //mail.Attachments.Add(new Attachment("C:\\file.zip"));

                    using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtp.Credentials = new NetworkCredential("vijay.darji2404@gmail.com", "FindMe@8991");
                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                        return Task.FromResult(true);
                    }
                }
            }
            catch (Exception ex)
            {
                return Task.FromResult(false);
            }
        }



    }
}
