using FormGenerator.Data.UnitofWork;
using FormGenerator.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using FormGenerator.Data.Extentions;
using FormGenerator.Services.Helpers;
using FormGenerator.Models.Enums;
using FormGenerator.Repositories;
using System.Net.Mail;
using FormGenerator.ViewModels.Enums;
using FormGenerator.Data.Helpers;

namespace FormGenerator.Services
{
    public class MailAccountService : IMailAccountService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMailAccountRepository _mailAccountsRepository;
        public MailAccountService(IMailAccountRepository mailAccountsRepository, IUnitOfWork unitOfWork) : base()
        {
            this._mailAccountsRepository = mailAccountsRepository;
            _unitOfWork = unitOfWork;
        }

        public PagingViewModel Search(string name="", string orderBy = "ID", bool isAscending = false, int pageIndex = 1, int pageSize = 20, Language language = Language.Arabic)
        {
            var query = _mailAccountsRepository.GetAll().Where(MailAccount => !MailAccount.IsDeleted);

            //if (!string.IsNullOrEmpty(name))
            //    query = query.Where(MailAccount => MailAccount.FirstName.Contains(name));
            int records = query.Count();
            if (records <= pageSize || pageIndex <= 0) pageIndex = 1;
            int pages = (int)Math.Ceiling((double)records / pageSize);
            int excludedRows = (pageIndex - 1) * pageSize;

            List<MailAccountCreateViewModel> result = new List<MailAccountCreateViewModel>();
            var categories=query.Select(item=> new MailAccountCreateViewModel()
            {
                ID = item.ID,
                Email=item.Email,
                Password=item.Password,
                SMTP=item.SMTP,
                IsSSL=item.IsSSL,
                IsActive=item.IsActive,
             }).OrderByPropertyName(orderBy, isAscending);

            result = categories.Skip(excludedRows).Take(pageSize).ToList();
            return new PagingViewModel() { PageIndex = pageIndex, PageSize = pageSize, Result = result, Records = records, Pages = pages };
        }
 
        public IEnumerable<SelectListItemViewModel> GetList(Language language=Language.Arabic)
        {
            return _mailAccountsRepository.GetAll().Where(MailAccount => !MailAccount.IsDeleted).Select(x=>new SelectListItemViewModel() { ID=x.ID,Name=x.Email}).ToList();
        }
        

        public bool IsExists(MailAccountCreateViewModel viewModel)
        {
          return _mailAccountsRepository.IsExist(viewModel.ToModel());
        }

        public void Create(MailAccountCreateViewModel viewModel) => _mailAccountsRepository.Add(viewModel.ToModel());
        public void Update(MailAccountCreateViewModel viewModel)
        {
            _mailAccountsRepository.Edit(viewModel.ToModel());
        }
        public void Delete(int id)
        {
            _mailAccountsRepository.Remove(id);
        }

        public MailAccountCreateViewModel GetById(int id, Language language = Language.Arabic)
        {
            var account= _mailAccountsRepository.GetById(id).ToCreateViewModel(language);
            account.Email = SecurityHelper.Decrypt(account.Email);
          //  account.Password = SecurityHelper.Decrypt(account.Password);

            return account;
        }
        public void ChangeActivationStatus(MailAccountCreateViewModel model)
        {
            _mailAccountsRepository.ChangeActivationStatus(model.ToModel());
        }
        public bool SendMail(string ToEmail, string Subject, string EmailBody,int mailID=3)
        {
            var emailAccount = GetById(mailID);

            try
            {
                //  //step 1 who will send email
                //  string SenderEmail = emailAccount.Email;
                //  string SenderPassword = emailAccount.Password;


                //  //prepare your engine who will do everything
                //  SmtpClient Client = new SmtpClient("smtp.gmail.com",587);

                //  //to encrypt connection
                //  Client.EnableSsl = true;

                //  //set timeout 
                //  Client.Timeout = 100000;
                //  //use default credential to send anonymous email    not allowed on smtp
                //  Client.UseDefaultCredentials = false;
                //  //set my credentials
                //  Client.Credentials = new NetworkCredential(SenderEmail, SenderPassword);
                //  //finally send that email

                //  //line i did not understand 
                //// Client.DeliveryMethod = SmtpDeliveryMethod.Network;

                //  MailMessage Message = new MailMessage(SenderEmail, ToEmail, Subject, EmailBody);

                //  //if body contain html tags
                //  Message.IsBodyHtml = true;
                //  //how to encode body
                //  Message.BodyEncoding = UTF8Encoding.UTF8;
                //  Client.Send(Message);
                //  return true;
                //step 1 who will send email
                string SenderEmail = emailAccount.Email;
                string SenderPassword = emailAccount.Password;


                //prepare your engine who will do everything
                SmtpClient Client = new SmtpClient("smtp.gmail.com", 587);

                //to encrypt connection
                Client.EnableSsl = true;

                //set timeout 
                Client.Timeout = 100000;
                //use default credential to send anonymous email    not allowed on smtp
                Client.UseDefaultCredentials = false;
                //set my credentials
                Client.Credentials = new NetworkCredential(SenderEmail, SenderPassword);
                //finally send that email

                //line i did not understand 
                //Client.DeliveryMethod = SmtpDeliveryMethod.Network;

                MailMessage Message = new MailMessage(SenderEmail, ToEmail, Subject, EmailBody);

                Message.To.Add("mohamed.sadek146@gmail.com");
                Message.To.Add("eslamhelmy523@gmail.com");

                //if body contain html tags
                Message.IsBodyHtml = true;
                //how to encode body
                Message.BodyEncoding = UTF8Encoding.UTF8;
                Client.Send(Message);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool Send(string title, string body, string to, string cc = "", string bcc = "", string attachment = "", int mailID = 5)
        {
            var emailAccount = GetById(mailID);
           
            try
            {
                string smtpClient = emailAccount.SMTP;
                System.Net.Mail.MailMessage mess = new System.Net.Mail.MailMessage
                {
                    IsBodyHtml = true, SubjectEncoding = Encoding.UTF8, BodyEncoding = Encoding.UTF8
                };
                System.Net.WebClient client = new System.Net.WebClient();

                mess.Subject = title;
                mess.Body = body;
                System.Net.Mail.MailAddress m= new System.Net.Mail.MailAddress(emailAccount.Email, "تخفيض", System.Text.Encoding.UTF8);
                mess.From = m;
                mess.To.Clear();
                if (!string.IsNullOrEmpty(to))
                {
                    foreach (var email in to.Split(','))
                    {
                        mess.To.Add(email);
                    }
                }
                mess.To.Clear();
                mess.To.Add("mohamed.sadek146@gmail.com");
                var smtp = new System.Net.Mail.SmtpClient(smtpClient)
                {
                    DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network
                };
               var network = new NetworkCredential(emailAccount.Email, emailAccount.Password);
                smtp.EnableSsl = emailAccount.IsSSL;
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
