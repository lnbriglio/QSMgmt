using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public enum VersionOrigin
    {
        Yes = 1,
        No = 2
    }

    public enum Role
    {
        SysAdmin = 1,
        PM = 2,
        Dev = 3,
        Tester = 4
    }

    public enum TestOutcome
    {
        SuccessYes = 1,
        SuccessNo = 2
    }

    public enum Approval
    {
        Yes = 1,
        No = 2
    }

    public enum Impact
    {
        RiskLevel1 = 1,
        RiskLevel2 = 2,
        RiskLevel3 = 3,
        RiskLevel4 = 4,
    }

    public enum ChangeType
    {
        Normal = 1,
        Standard = 2,
        Emergency = 3,
    }

    public enum Priority
    {
        Immediate = 1,
        High = 2,
        Medium = 3,
        Low = 4,
    }

    public enum TaskState
    {
        ToDo = 1,
        Doing = 2,
        Done = 3,
    }
}
