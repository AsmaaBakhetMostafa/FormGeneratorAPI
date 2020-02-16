using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Web;

namespace FormGenerator.API.Helpers
{
    public class CustomMultipartFormDataStreamProvider : MultipartFormDataStreamProvider
    {
        public string OldFileName { get; set; }
        public string FileExtension { get; set; }
        public CustomMultipartFormDataStreamProvider(string path) : base(path)
        { }
        public override string GetLocalFileName(System.Net.Http.Headers.HttpContentHeaders headers)
        {
            var filename = headers.ContentDisposition.FileName.Replace("\"", string.Empty);
            if (filename.IndexOf('.') < 0)
                throw new Exception("File doesn't have known extension.");
            var extension = filename.Split('.').Last();
            OldFileName = filename;
            FileExtension = extension;
            return Guid.NewGuid().ToString() + Path.GetExtension(filename);
        }
    }
}