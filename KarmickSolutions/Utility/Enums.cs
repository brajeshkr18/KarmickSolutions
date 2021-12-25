using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utility
{
    public class Enums
    {
        public enum AccountStatus
        {
            Active = 1,
            Inactive = 2,
            Suspended = 3,
            Deactivated = 4,
            Delete = 5
        }

        public enum IsActive
        {
            Active = 1,
            Inactive = 0
        }

        public enum UserType
        {
            SuperAdmin = 1,
            Admin = 2,
            User = 3
        }
        public enum Department
        {
            Content=1,
            Design=2,
            Marketing=3
        }
        public enum Designation
        {
            Content = 1,
            Design = 2,
            Marketing = 3
        }
    }
}
