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

namespace Vleko.TemplateProject.Core.Response
{
    public partial class UserResponse: IMapResponse<UserResponse, Vleko.TemplateProject.Data.Model.User>
    {
		public Guid Id{ get; set; }
        public string Username { get; set; }
        public string Fullname { get; set; }
        public string Mail { get; set; }
        public string Nrk { get; set; }
        public string PhoneNumber { get; set; }
        public string PersonnelNo { get; set; }
        public DateTime LastSynchronize { get; set; }
        public string Status { get; set; }

        public void Mapping(IMappingExpression<Vleko.TemplateProject.Data.Model.User, UserResponse> map)
        {
            //use this for mapping
            map.ForMember(d => d.Status, opt => opt.MapFrom(s => CheckStatus(s)));
        }
        private string CheckStatus(Vleko.TemplateProject.Data.Model.User s)
        {
            if (!s.Active)
                return "Not Active";
            if (s.IsLockout)
                return "Locked";
            else
                return "Active";
        }
    }
}
