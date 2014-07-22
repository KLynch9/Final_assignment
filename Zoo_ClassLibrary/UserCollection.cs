using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zoo_ClassLibrary
{
    public class UserCollection
    {
        public List<Users> Collection { get; private set; }

        public UserCollection()
        {
            Collection = new List<Users>();
        }

        public void Add(Users user)
        {
            Collection.Add(user);
        }
        public void Remove(Users user)
        {
            Collection.Remove(user);
        }

    }
}
