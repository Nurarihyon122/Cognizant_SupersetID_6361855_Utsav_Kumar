using Microsoft.EntityFrameworkCore;

public class AppDbContext : DbContext {
    public DbSet<Product> Products { get; set; }
    public DbSet<Category> Categories { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) {
        optionsBuilder.UseSqlServer("Server=localhost\\SQLEXPRESS;Database=RetailDB;Trusted_Connection=True;TrustServerCertificate=True;");

    }
}
