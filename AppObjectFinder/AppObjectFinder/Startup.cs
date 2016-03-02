using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AppObjectFinder.Startup))]
namespace AppObjectFinder
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
