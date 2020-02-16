namespace FormGenerator.Data.Migrations
{
    using Models;
    using Models.Enums;
    using Models.User;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<FormGenerator.Data.Entities>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(FormGenerator.Data.Entities context)
        {
            //AddUsers(context);
        }
   
    }
}
