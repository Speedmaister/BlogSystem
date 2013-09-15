using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BlogSystem.Model;
using BlogSystem.Repository;
using BlogSystem.Services.Persisters;
using BlogSystem.Services.Models;

namespace BlogSystem.Services.Controllers
{
    public class VotesController : ApiController
    {
        private db09a4acd973cf4f99811ba239008d873dEntities context = new db09a4acd973cf4f99811ba239008d873dEntities();

        private IRepository<Vote> repository;

        public VotesController()
        {
            repository = new Repository<Vote>(context);
        }

         //POST api/votes/5
        [HttpPost]
        [ActionName("create")]
        public HttpResponseMessage CreateVote(string sessionKey, Vote vote)
        {
            bool result = UserPersister.ValidateSessionKey(sessionKey);
                        
            if (result == true)
            {
                var voteFound = this.repository.All().
                    Where(x => x.ArticleId == vote.ArticleId && x.AuthorId == vote.AuthorId).FirstOrDefault();

                if(voteFound != null)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "You have already voted for this article"); 
                }
                
                var entityToAdd = new Vote()
                {
                    ArticleId=vote.ArticleId,
                    AuthorId = vote.AuthorId,
                    Value = vote.Value
                };

                var createdEntity = this.repository.Add(entityToAdd);

                var response = Request.CreateResponse(HttpStatusCode.Created);
                return response;
            }
           
            return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "The user is not valid");            
        }
    }
}
