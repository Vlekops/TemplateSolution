using System.ComponentModel.DataAnnotations;
using Vleko.TemplateProject.Shared.Attributes;

namespace Vleko.TemplateProject.Core.Request
{
    public class UserInfoRequest
    {
        [Required]
        public string Fullname { get; set; }
        [Required]
        public string Mail { get; set; }
        public string PhoneNumber { get; set; }
    }
}
