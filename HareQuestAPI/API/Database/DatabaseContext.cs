using API.Models;
using Microsoft.EntityFrameworkCore;
namespace API.Database
{
  public class DatabaseContext : DbContext
  {

    public DbSet<User> Users {get; set;}
    public DbSet<ParentChild> ParentChildren {get; set;}
    
    public DbSet<ClassGroup> ClassGroups {get; set;}

    public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
      modelBuilder.Entity<User>()
        .HasIndex(u => u.Email)
        .IsUnique();
    }
      public DbSet<API.Models.ParentChild> ParentChild { get; set; } = default!;
      public DbSet<API.Models.ClassGroup> ClassGroup { get; set; } = default!;

  }
}