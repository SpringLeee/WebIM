using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(WebApplication8.Startup))]

namespace WebApplication8
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();


        }
    }
}
