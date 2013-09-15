using BlogSystem.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogSystem.Repository
{
    public class UserRepository : Repository<User>
    {
        public UserRepository(db09a4acd973cf4f99811ba239008d873dEntities context)
            : base(context)
        {
        }

        public bool IsValidSessionKey(string sessionKey)
        {
            var user = DbSet.Where(x => x.SessionKey == sessionKey).FirstOrDefault();
            if (user != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void SaveSessionKey(string sessionKey,int userId)
        {
            var user = DbSet.Find(userId);
            user.SessionKey = sessionKey;
            Context.SaveChanges();
        }
    }
}
