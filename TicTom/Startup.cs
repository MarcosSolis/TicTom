﻿using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TicTom.Startup))]
namespace TicTom
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
