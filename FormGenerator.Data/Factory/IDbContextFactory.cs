using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.Data.Factory
{
    public interface IDbContextFactory 
    {
        DbContext GetDbContext();
    }
  
}
