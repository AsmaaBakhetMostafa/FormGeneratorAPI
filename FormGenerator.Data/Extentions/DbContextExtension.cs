using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.Data.Extentions
{
    public static class DbContextExtension
    {
        public static List<T> ExecuteStored<T>(this DbContext context, string storedName, params object[] parameters)
        {
            string command = string.Join(",", parameters.Select(p => FormatParameter(p)).ToList());

            return context.Database.SqlQuery<T>($"{storedName} {command}").AsEnumerable().ToList<T>();
        }

        public static List<T> ExecuteTableFunction<T>(this DbContext context, string functionName, params object[] parameters)
        {
            string command = string.Join(",", parameters.Select(p => FormatParameter(p)).ToList());

            return context.Database.SqlQuery<T>($"select * from {functionName}({command})").AsEnumerable().ToList<T>();
        }

        public static T ExecuteScalarFunction<T>(this DbContext context, string functionName, params object[] parameters)
        {
            string command = string.Join(",", parameters.Select(p => FormatParameter(p)).ToList());

            return context.Database.SqlQuery<T>($"select {functionName}({command})").FirstOrDefault();
        }

        public static bool ExecuteNonQuery(this DbContext context, string storedName, params object[] parameters)
        {
            string command = string.Join(",", parameters.Select(p => FormatParameter(p)).ToList());

            var affectedRows = context.Database.ExecuteSqlCommand($"{storedName} {command}");

            return affectedRows > 0;
        }

        private static string FormatParameter(object parameter)
        {
            if (parameter == null)
                return "null";

            if (parameter is string && (string)parameter == "default")
                return $"{parameter}";

            if (parameter is string || parameter is TimeSpan)
                return $"'{parameter}'";

            if (parameter is DateTime)
            {
                var str = ((DateTime)parameter).ToString("MM-dd-yyyy hh:mm:ss tt");
                return $"'{str}'";
            }

            return parameter.ToString();
        }
    }
}
