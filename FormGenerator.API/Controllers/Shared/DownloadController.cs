using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace FormGenerator.API.Controllers.Shared
{
    [RoutePrefix("download")]
    public class DownloadController : BaseController
    {
        private const string _TEMP_PATH = "uploads/temp";
        string protocol = HttpContext.Current.Request.Url.Scheme.ToString();
        string hostName = HttpContext.Current.Request.Url.Authority.ToString();

       
        public HttpResponseMessage Get(string img)
        {
            try
            {
                var result = new HttpResponseMessage(HttpStatusCode.OK);
                string filePath = HttpContext.Current.Server.MapPath($"~/{_TEMP_PATH}/") + img;

                FileStream fileStream = new FileStream(filePath, FileMode.Open);
                Image image = Image.FromStream(fileStream);
                MemoryStream memoryStream = new MemoryStream();
                image.Save(memoryStream, ImageFormat.Jpeg);
                result.Content = new ByteArrayContent(memoryStream.ToArray());
                result.Content.Headers.ContentType = new MediaTypeHeaderValue("image/png");
                fileStream.Close();
                return result;
            }
            catch (Exception ex)
            {
                return new HttpResponseMessage(HttpStatusCode.Conflict);

            }

        }

    }
}