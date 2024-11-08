using Shared_Projet_site_illu.Repositories;
using BLL = BLL_Projet_site_illu;
using DAL = DAL_Projet_site_illu;

namespace ASP_MVC_Projet_site_illu
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            //Localization
            builder.Services.Configure<RequestLocalizationOptions>(options =>
            {
                string[] supportedCultures = new string[]
                {
                    "en-US",    //Si en-US, alors le pattern des input de prix sera :  pattern="^\d*\.{0,1}\d*$"
                    "fr-BE"     //Si fr-BE, alors le pattern des input de prix sera :  pattern="^\d*,{0,1}\d*$"
                };
                string defaultCulture = supportedCultures[1];   //Choisir la culture (c'est la d�finision du format selon la r�gion)
                options.SetDefaultCulture(defaultCulture);      //D�finir la culture par d�faut
                //options.AddSupportedCultures(supportedCultures);      //Si multilingue, d�finir les cultures support�es par le site
                //options.AddSupportedUICultures(supportedCultures);
            });

            // Add services to the container.
            builder.Services.AddControllersWithViews();

            builder.Services.AddScoped<IProductRepository<BLL.Entities.Product>, BLL.Services.ProductService>();
            builder.Services.AddScoped<IProductRepository<DAL.Entities.Product>, DAL.Services.ProductService>();

            builder.Services.AddScoped<DAL_Projet_site_illu.Services.CategoryService>();
            builder.Services.AddScoped<BLL_Projet_site_illu.Services.CategoryService>();


            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
            }
            app.UseStaticFiles();

            app.UseRouting();

            //Localization
            app.UseRequestLocalization();

            app.UseAuthorization();

            // Au cas o� utilisation des attributs pour routing 
            app.MapControllers();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.MapControllerRoute(
                name: "creations",
                pattern: "{controller=Product}/{action=Index}/{id?}");

            app.MapControllerRoute(
                name: "contact",
                pattern: "{controller=Contact}/{action=Index}/{id?}");

            app.Run();
        }
    }
}
