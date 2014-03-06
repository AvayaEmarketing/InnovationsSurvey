<%@ WebHandler Language="C#" Class="DescargarArchivo" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

    /// <summary>
    /// Descripción breve de DescargarArchivo
    /// </summary>
    public class DescargarArchivo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string filename = context.Request.QueryString["File"];
            
            context.Response.Buffer = true;
            context.Response.Clear();
            context.Response.AddHeader("content-disposition", "attachment; filename=" + filename);
            context.Response.ContentType = "application/octet-stream";
            int fileExtPos = filename.LastIndexOf(".");
            if (fileExtPos >= 0)
            {
                string extension = filename.Substring(fileExtPos + 1).ToUpper();
                if (extension == "XLS")
                {
                    string path = HttpContext.Current.Server.MapPath("~");
                    
					//path = path + "\\mx\\events\\movieinv\\ExcelFiles\\";
                    
                    context.Response.WriteFile(path + filename);
                }
                else if (extension == "PDF")
                {
                    string path = HttpContext.Current.Server.MapPath("~");
                    //path = path + "\\usa\\events\\ATF-2014\\ExcelFiles\\";
                    path = path + "\\pdfFiles\\";
                    context.Response.WriteFile(path + filename);
                }
                
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
