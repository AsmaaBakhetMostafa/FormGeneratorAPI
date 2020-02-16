using FormGenerator.Models.Enums;
using FormGenerator.Models.Enums;
using FormGenerator.ViewModels;

using System;
using System.Collections.Generic;

using FormGenerator.Models;
using FormGenerator.Data.Repository;
using FormGenerator.ViewModels.Enums;

namespace FormGenerator.Services
{
    public interface IMailAccountService
    {
        void Create(MailAccountCreateViewModel model);
        void Update(MailAccountCreateViewModel model);
        void Delete(int id);
        MailAccountCreateViewModel GetById(int id, Language language = Language.Arabic);
        PagingViewModel Search(string name="", string orderBy = "ID", bool isAscending = false, int pageIndex = 1, int pageSize = 20, Language language=Language.Arabic);
        IEnumerable<SelectListItemViewModel> GetList(Language language = Language.Arabic);
        bool IsExists(MailAccountCreateViewModel model);
        void ChangeActivationStatus(MailAccountCreateViewModel model);
        bool Send(string title, string body, string to,string cc="",string bcc="", string attachment="", int mailID=5);
        bool SendMail(string ToEmail, string Subject, string EmailBody, int mailID = 3);



    }
}
