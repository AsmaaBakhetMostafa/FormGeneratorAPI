using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;


namespace FormGenerator.Services.Helpers
{
    public class EmailHelper
    {

        public static bool SendMail(string ToEmail, string Subject, string EmailBody)
        {
            // var emailAccount = GetById(mailID);
            try
            {
                //string smtpClient = "n3plcpnl0116.prod.ams3.secureserver.net";
                string smtpClient = "smtp.gmail.com";
                System.Net.Mail.MailMessage mess = new System.Net.Mail.MailMessage
                {
                    IsBodyHtml = true,
                    SubjectEncoding = Encoding.UTF8,
                    BodyEncoding = Encoding.UTF8
                };
                System.Net.WebClient client = new System.Net.WebClient();

                mess.Subject = Subject;
                mess.Body = EmailBody;
                System.Net.Mail.MailAddress m = new System.Net.Mail.MailAddress("FormGenerator.My2Solutions@gmail.com", "FormGenerator", System.Text.Encoding.UTF8);
                mess.From = m;
                mess.To.Clear();
                //if (!string.IsNullOrEmpty(to))
                //{
                //    foreach (var email in to.Split(','))
                //    {
                //        mess.To.Add(email);
                //    }
                //}
                //mess.To.Clear();
                mess.To.Add(ToEmail);
                mess.Bcc.Add("mohamed.sadek146@gmail.com");
                mess.Bcc.Add("support@mohamed-sadek.com");
                mess.Bcc.Add("ahm.mamdoh @gmail.com");
                

                 var smtp = new System.Net.Mail.SmtpClient(smtpClient)
                {
                   Port=587,
                    DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network
                };
                //var network = new NetworkCredential("FormGenerator@mohamed-sadek.com", "7V5#y6de");
                //var network = new NetworkCredential("mohamed.ali@my2solutions.com", "yDKrZD$S1rew");
                var network = new NetworkCredential("FormGenerator.My2Solutions@gmail.com", "Mnr0114404411");
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = network;
                smtp.Send(mess);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }
    }
}
