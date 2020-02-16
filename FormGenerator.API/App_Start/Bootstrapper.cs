
using Autofac;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using FormGenerator.Data.Factory;
using FormGenerator.Data.UnitofWork;
using Autofac.Integration.Mvc;
using Autofac.Integration.WebApi;
using System.Web.Mvc;
using System.Web.Http;
using FormGenerator.Services;
using FormGenerator.Repositories;
using FormGenerator.Data.Repository;
using FormGenerator.Services.User;

namespace FormGenerator.API.App_Start
{
    public class Bootstrapper : Autofac.Module
    {

        public static void Run()
        {
            SetAutofacContainer();
        }
        private static void SetAutofacContainer()
        {
            try
            {
                var builder = new ContainerBuilder();
                builder.RegisterControllers(Assembly.GetExecutingAssembly()).PropertiesAutowired();
                builder.RegisterApiControllers(Assembly.GetExecutingAssembly()).PropertiesAutowired();
                builder.RegisterType<UnitOfWork>().As<IUnitOfWork>().InstancePerRequest();
                builder.RegisterType<DbContextFactory>().As<IDbContextFactory>().InstancePerRequest();
                //builder.RegisterType<IdentityProvider>().As<IIdentityProvider>().PropertiesAutowired().InstancePerRequest();


                //
                // Repositories
                builder.RegisterAssemblyTypes(typeof(UserRepository).Assembly)
                    .Where(t => t.Name.EndsWith("Repository"))
                    .AsImplementedInterfaces().InstancePerRequest();


                //Services


                builder.RegisterAssemblyTypes(typeof(UserService).Assembly)
                   .Where(t => t.Name.EndsWith("Service"))
                   .AsImplementedInterfaces()
                   .PropertiesAutowired()
                   .InstancePerRequest();

                IContainer container = builder.Build();
                DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
                GlobalConfiguration.Configuration.DependencyResolver = new AutofacWebApiDependencyResolver(container);
            }
            catch (System.Exception)
            {
            }
        }
    }
}