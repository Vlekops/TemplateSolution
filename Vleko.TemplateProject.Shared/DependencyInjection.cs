using Microsoft.Extensions.DependencyInjection;
using Vleko.TemplateProject.Shared.Interface;
using Vleko.TemplateProject.Shared.Helper;

namespace Vleko.TemplateProject.Shared
{
    public static class DependencyInjection
    {
        public static IServiceCollection RegisterShared(this IServiceCollection services)
        {
            services.AddSingleton<IGeneralHelper, GeneralHelper>();
            services.AddSingleton<IWrapperHelper, WrapperHelper>();
            services.AddSingleton<IHttpRequest, HttpRequest>();

            return services;
        }
    }
}
