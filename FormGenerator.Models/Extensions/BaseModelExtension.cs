using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.Models.Extensions
{
    public static class BaseModelExtension
    {
        public static int[] GetCurrentItemsIDs<T>(this ICollection<T> collection) where T : BaseModel
        {
            return collection.Select(c => c.ID).ToArray();
        }

        public static IEnumerable<T> GetCreatedItemsList<T>(this ICollection<T> collection) where T : BaseModel
        {
            return
                collection.Where(x => x.ID == 0);
        }

        public static IEnumerable<T> GetEditedItemsList<T>(this ICollection<T> collection) where T : BaseModel
        {
            return
                collection.Where(x => x.ID != 0);
        }

        public static IQueryable<T> GetRemovedItemsList<T>(this ICollection<T> newCollection, IQueryable<T> oldCollection) where T : BaseModel
        {
            var lstDetailsID = newCollection.GetCurrentItemsIDs();

            return
                oldCollection.Where(x => !lstDetailsID.Contains(x.ID));
        }
    }
}
