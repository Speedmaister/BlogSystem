using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BlogSystem.Services.Models
{
    public class SessionKeyModel
    {
        public string Username { get; set; }
        public string SessionKey { get; set; }
        public int UserId { get; set; }
    }
}