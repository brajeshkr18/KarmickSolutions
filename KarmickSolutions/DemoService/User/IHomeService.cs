
using DemoModel.ViewModel;
using System.Collections.Generic;

namespace DemoService.HomeService
{
    public interface IHomeService
    {
        List<DesignationViewModel> GetDesignation(int DepartmentId);
    }
}
