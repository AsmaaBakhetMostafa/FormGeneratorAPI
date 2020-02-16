using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.Models.Extensions
{
    public static class DateTimeExtension
    {
        public static int GetAge(this DateTime birthdate)
        {
            return (int) ((DateTime.Today - birthdate).TotalDays / 365.25);
        }
    }
}
