using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Text;


    public class HttpHelper
    {
        public static string GetJson(string url)
        {
            WebClient wc = new WebClient();
            byte[] bResponse = wc.DownloadData(url);
            string strResponse = Encoding.UTF8.GetString(bResponse);
            return strResponse;
            
        }
    }
