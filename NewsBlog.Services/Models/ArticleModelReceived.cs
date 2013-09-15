using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace BlogSystem.Services.Models
{
    public class ArticleModelReceived : ArticleModel
    {
        public byte[] ArticleImage { get; set; }
    }
}