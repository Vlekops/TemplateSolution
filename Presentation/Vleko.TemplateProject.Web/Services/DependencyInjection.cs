using Vleko.TemplateProject.Web.Services.User;

namespace Vleko.TemplateProject.Web.Services
{
    public static class DependencyInjection
    {
        public static IServiceCollection RegisterServices(this IServiceCollection services)
        {
            services.AddTransient<IUserService, UserService>();

            return services;
        }
    }
}
