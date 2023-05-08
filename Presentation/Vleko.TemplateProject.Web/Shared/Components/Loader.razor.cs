using Microsoft.AspNetCore.Components;

namespace Vleko.TemplateProject.Web.Shared.Components
{
    public partial class Loader : ComponentBase
    {
        #region Inject, Cascading, Parameter
        [Parameter]
        public bool IsLoading { get; set; }
        #endregion
    }
}
