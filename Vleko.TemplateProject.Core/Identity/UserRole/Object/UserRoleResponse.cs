//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using Vleko.TemplateProject.Core.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Vleko.TemplateProject.Data.Model;
using Vleko.TemplateProject.Shared.Attributes;

namespace Vleko.TemplateProject.Core.Response
{
    public partial class UserRoleResponse: IMapResponse<UserRoleResponse, Vleko.TemplateProject.Data.Model.UserRole>
    {
		public Guid Id{ get; set; }
		public ReferensiStringObject Role { get; set; }
		public UserResponse User { get; set; }
        public string CreateBy { get; set; }
        public DateTime CreateDate { get; set; }


        public void Mapping(IMappingExpression<Vleko.TemplateProject.Data.Model.UserRole, UserRoleResponse> map)
        {
            map.ForMember(d => d.User, opt => opt.MapFrom(s => s.IdUserNavigation))
            .ForMember(d => d.Role, opt => opt.MapFrom(s => new ReferensiStringObject()
            {
                Id = s.IdRole,
                Nama = s.IdRoleNavigation.Name
            }));

        }
    }
}
