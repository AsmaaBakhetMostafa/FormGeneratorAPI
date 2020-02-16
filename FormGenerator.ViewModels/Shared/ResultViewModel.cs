using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.ViewModels
{
    public class ResultViewModel
    {
        public object Data { get; set; }
        public string Message { get; set; }
        public bool Success { get; set; }
        public bool Authorized { get; set; }

        public ResultViewModel CreateError(string message)
        {
            return new ResultViewModel() { Data = null, Authorized = true, Message = message, Success = false };
        }
       
        public ResultViewModel()
        {
            Data = null;
            Success = true;
            Message = string.Empty;
            Authorized = true;
        }

        public ResultViewModel(object data, string message = "", bool success = true, bool authorized = true)
        {
            Data = data;
            Success = success;
            Message = message;
            Authorized = authorized;
        }
    }
}
