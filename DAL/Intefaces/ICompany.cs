﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Intefaces
{
    public interface ICompany
    {
        bool IsCompanyValid(int companyId);
    }
}
