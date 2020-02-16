using FormGenerator.Models.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.ViewModels
{
    public class ActivateViewModel
    {
        public int ID {get;set;}
        public bool IsActive { get; set; }
    }
    public static class ActivateExtension
    {
        public static T ToModel<T>(this ActivateViewModel model) where T : IActive, new()
        {
            T result = new T();
            result.ID = model.ID;
            result.IsActive = model.IsActive;
            return result;
        }
    }

}
