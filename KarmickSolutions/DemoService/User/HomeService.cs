using Demo.Core.EntityModel;
using DemoModel.ViewModel;
using ExpressMapper;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utility;
using static Utility.Enums;

namespace DemoService.HomeService
{
    public class HomeService:IHomeService
    {
        private OnBoadTaskEntities _Context = new OnBoadTaskEntities();

        public List<DesignationViewModel> GetDesignation(int DepartmentId)
        {
            List<DesignationViewModel> designationModel = new List<DesignationViewModel>();
            var designations = _Context.Desigations.Where(x=>x.DepartmentId==DepartmentId).ToList();
            Mapper.Map(designations, designationModel);
            return designationModel;
        }

    }
}
