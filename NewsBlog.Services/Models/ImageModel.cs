using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BlogSystem.Model;

namespace BlogSystem.Services.Models
{
    public class ImageModel
    {
        public int Id { get; set; }
        public int ArticleId { get; set; }
        public byte[] Image { get; set; }

        public ImageModel(Image image)
        {
            Id = image.Id;
            ArticleId = image.ArticleId;
            Image = image.Image1;
        }
    }
}