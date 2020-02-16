
using FormGenerator.Models;
using FormGenerator.Models.User;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace FormGenerator.Data
{
    class Entities : DbContext
    {
        public Entities() : base("name=Entities")
        {
        }

     
        #region Admin
        #endregion

        #region Users
     

        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserRole> UserRoles { get; set; }
        public virtual DbSet<Token> Tokens { get; set; }
        public virtual DbSet<TokenLog> TokenLogs { get; set; }
      
        #endregion

        #region Location
        #endregion

        //public virtual DbSet<ApplicationLog> ApplicationLogs { get; set; }
     
      //  public virtual DbSet<Page> Pages { get; set; }
        public virtual DbSet<MailAccount> MailAccounts { get; set; }
     

    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();
        }
    }
}
