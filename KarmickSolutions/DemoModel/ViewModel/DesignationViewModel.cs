using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoModel.ViewModel
{
    public class DesignationViewModel
    {
        public long Id { get; set; }
        public string Designation { get; set; }
        public int DepartmentId { get; set; }
        public System.DateTime CreatedOn { get; set; }
    }
}
