using FormGenerator.Models;
using System;
using System.Data.Entity;

namespace FormGenerator.Data.Factory
{
    public class DbContextFactory : IDbContextFactory
    {
        private readonly DbContext _context;

        public DbContextFactory()
        {
           _context= _context ?? new Entities();
        }

        public DbContext GetDbContext()
        {
            return _context;
        }

  
    }
}