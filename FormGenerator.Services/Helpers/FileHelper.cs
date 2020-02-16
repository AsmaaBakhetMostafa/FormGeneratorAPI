using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace FormGenerator.Services.Helpers
{
   public class FileHelper
    {
        private const string _TEMP_PATH = "uploads/temp";
        public static bool MoveFileFromTempPathToAnotherFolder(string fileName,string newPath)
        {
            try
            {
                if(!Directory.Exists(HttpContext.Current.Server.MapPath($"~/{newPath}")))
                    Directory.CreateDirectory(HttpContext.Current.Server.MapPath($"~/uploads/{newPath}"));

                    if (!string.IsNullOrEmpty(fileName) &&File.Exists(HttpContext.Current.Server.MapPath($"~/{_TEMP_PATH}/{fileName}")))
                {
                    File.Move(HttpContext.Current.Server.MapPath($"~/{_TEMP_PATH}/{fileName}"), HttpContext.Current.Server.MapPath($"~/{newPath}/{fileName}"));
                    return true;
                }
                return false;
                 
            }
            catch
            {
            }
            return false;
        }
    }
}
