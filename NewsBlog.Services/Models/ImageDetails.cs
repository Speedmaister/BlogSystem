using BlogSystem.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BlogSystem.Services.Models
{
    public class ImageDetails : ImageModel
    {
        public virtual Article Article { get; set; }

        public ImageDetails(Image image) 
            : base(image)
        {
            this.Article = image.Article;
        }
    }
}