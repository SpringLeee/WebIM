using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System.Net;
using System.Text;

namespace WebApplication8
{
    [HubName("myhub")] 
    public class MyHub : Hub
    {
        
          
        public void SendMessage(string name, string message)
        {
           
                string AddressIP = string.Empty;
                foreach (IPAddress _IPAddress in Dns.GetHostEntry(Dns.GetHostName()).AddressList)
                {
                    if (_IPAddress.AddressFamily.ToString() == "InterNetwork")
                    {
                        AddressIP = _IPAddress.ToString();
                    }
                }

                string url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=" + AddressIP;

                var result = HttpHelper.GetJson(url);

                var city = Newtonsoft.Json.JsonConvert.DeserializeObject<info>(result).city;

               Clients.All.receiveMessage(city+ "网友" , message);
        }
    }

    public class info
    {
        public string city { get; set; }

      
    }

  
}