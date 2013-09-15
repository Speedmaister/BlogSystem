using BlogSystem.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BlogSystem.Repository;
using BlogSystem.Services.Models;
using BlogSystem.Services.Persisters;

namespace BlogSystem.Services.Controllers
{
    public class ImagesController : ApiController
    {
        private db09a4acd973cf4f99811ba239008d873dEntities context = new db09a4acd973cf4f99811ba239008d873dEntities();

        private IRepository<Image> repository;

        public ImagesController()
        {
            repository = new Repository<Image>(context);
        }
        
        // GET api/images/5
        [HttpGet]
        [ActionName("read")]
        public ImageModel Get(int id)
        {
            Image image = this.repository.Get(id);
            ImageModel imageModel = new ImageModel(image);
            return imageModel;
        }

        // POST api/images
        [HttpPost]
        [ActionName("create")]
        public HttpResponseMessage Post(string sessionKey, Image image)
        {
            bool result = UserPersister.ValidateSessionKey(sessionKey);

            if (result == true)
            {
                var entityToAdd = new Image()
                {
                    Image1 = image.Image1,
                    ArticleId = image.ArticleId
                };

                var createdEntity = this.repository.Add(entityToAdd);

                var imageModel = new ImageModel(createdEntity);

                var response = Request.CreateResponse<ImageModel>(HttpStatusCode.Created, imageModel);
                var resourceLink = Url.Link("DefaultApi", new { id = imageModel.Id });

                response.Headers.Location = new Uri(resourceLink);
                return response;
            }

            return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "The user is not valid");
        }
    }
}
