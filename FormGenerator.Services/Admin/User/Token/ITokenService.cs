


using FormGenerator.Data.Repository;
using FormGenerator.Models.User;

namespace FormGenerator.Services.Interfaces.User
{
    public interface ITokenService : IRepository<Token> 
    {
      
        void AddToken(string token);
        bool isValidToken(int userID, string token);
        void AddLog(string accessToken, bool isAuthorized, string url, string ip);
    }
}
