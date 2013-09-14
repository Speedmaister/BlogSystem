using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace NewsBlog.Services.Models
{
    public class ArticleModelReceived : ArticleModel
    {
        public byte[] ArticleImage { get; set; }
    }
}