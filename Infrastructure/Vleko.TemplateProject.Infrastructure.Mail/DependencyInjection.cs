using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Vleko.TemplateProject.Infrastructure.Mail.Interface;
using Vleko.TemplateProject.Infrastructure.Mail.Service;
using Vleko.TemplateProject.Infrastructure.Mail.Object;

namespace Vleko.TemplateProject.Infrastructure.Mail
{
    public static class DependencyInjection
    {
        public static IServiceCollection RegisterMail(this IServiceCollection services, IConfiguration configuration)
        {
            services.Configure<MailConfig>(options => configuration.Bind(nameof(MailConfig), options));
            services.AddTransient<IEmailService, EmailService>();
            
            return services;
        }
    }
}
