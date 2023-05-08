using Vleko.TemplateProject.Core.Helper;
using Vleko.TemplateProject.Shared.Attributes;
using System.ComponentModel.DataAnnotations;

namespace Vleko.TemplateProject.Core.Request
{
    public partial class RepositoryRequest
    {
        [Required]
        public ModulType Modul { get; set; }
        [Required]
        public FileObject File { get; set; }
        [Required]
		public string Code{ get; set; }
		public string Description{ get; set; }
		[Required]
		public bool IsPublic{ get; set; }

    }
}

