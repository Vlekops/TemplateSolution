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
    public partial class RepositoryResponse: IMapResponse<RepositoryResponse, Vleko.TemplateProject.Data.Model.Repository>
    {
		public Guid Id{ get; set; }
		public string Code{ get; set; }
		public string CreateBy{ get; set; }
		public DateTime CreateDate{ get; set; }
		public string Description{ get; set; }
		public string Extension{ get; set; }
		public string FileName{ get; set; }
		public bool IsPublic{ get; set; }
		public string MimeType{ get; set; }
		public string Modul{ get; set; }


        public void Mapping(IMappingExpression<Vleko.TemplateProject.Data.Model.Repository, RepositoryResponse> map)
        {
            //use this for mapping
            //map.ForMember(d => d.object, opt => opt.MapFrom(s => s.EF_COLUMN));

        }
    }
}
