
using FormGenerator.Data.Repository;
using FormGenerator.Data.UnitofWork;
using FormGenerator.Models.User;
using FormGenerator.Services.Helpers;
using FormGenerator.Services.Interfaces.User;
using System;
using System.Linq;
using FormGenerator.Data.Helpers;

namespace FormGenerator.Services.User
{
    public  class TokenService : Repository<Token>, ITokenService
    {
        private readonly IUnitOfWork _unitOfWork;

        public TokenService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public void AddToken(string token)
        {
            int userID  = SecurityHelper.GetUserIDFromToken(token);
            int branchID = SecurityHelper.GetBranchIDFromToken(token);
            if (!string.IsNullOrEmpty(token))
            {
                token = SecurityHelper.Encrypt(token);
                Token newToken = new Token() {  UserID = userID, Active = true, IP = HttpRequestHelper.GetClientIP(), Code = token, ExpirationDate = DateTime.Now.AddDays(100), UserAgent = HttpRequestHelper.GetUserAgent() };
                Add(newToken);
            }
            
        }
        public bool isValidToken(int userID, string token)
        {
            DateTime currentDateTime = DateTime.Now;
           return this.GetAll().Any(accessToken => !accessToken.IsDeleted && accessToken.UserID == userID && accessToken.ExpirationDate > currentDateTime && !accessToken.User.IsDeleted && accessToken.User.IsActive);
        }

        public void AddLog(string accessToken,bool isAuthorized,string url,string ip)
        {
            var existToken = this.GetAll().FirstOrDefault(token => !token.IsDeleted && token.Code == accessToken);
            if(existToken!=null)
            {
                existToken.TokenLogs.Add(new TokenLog() {IsAuthorized= isAuthorized,URL= url, IP= FormGenerator.Services.Helpers.HttpRequestHelper.GetClientIP() });
            }
           
        }

        //public void RemoveToken(string token)
        //{
        //    var logoutToken=dbSet.
        //}





    }
}
