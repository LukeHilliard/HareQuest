using API.Models;
using Microsoft.EntityFrameworkCore;
namespace API.Database
{
 public class DatabaseContext : DbContext
  {

    public DbSet<User> Users {get; set;}

    public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
      modelBuilder.Entity<User>()
        .HasIndex(u => u.Email)
        .IsUnique();
    }

  }
}
