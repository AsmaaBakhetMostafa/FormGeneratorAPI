using FormGenerator.Models.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.ViewModels
{
    public class DisplayOrderViewModel
    {
        public int ID {get;set;}
        public int DisplayOrder { get; set; }
    }
    public static class DisplayOrderExtension
    {
        public static T ToModel<T>(this DisplayOrderViewModel model) where T : IDisplayOrder, new()
        {
            T result = new T();
            result.ID = model.ID;
            result.DisplayOrder = model.DisplayOrder;
            return result;
        }
    }
}
