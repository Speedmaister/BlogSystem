using BlogSystem.Model;
using BlogSystem.Repository;
using BlogSystem.Services.Models;
using BlogSystem.Services.Persisters;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BlogSystem.Services.Controllers
{
    public class SubCommentsController : ApiController
    {
        private IRepository<SubComment> subCommentsRepository;


        public SubCommentsController()
        {
            DbContext dbContext = new db09a4acd973cf4f99811ba239008d873dEntities();
            this.subCommentsRepository = new Repository<SubComment>(dbContext);
        }

        public SubCommentsController(IRepository<SubComment> repository)
        {
            this.subCommentsRepository = repository;
        }

        [HttpPost]
        [ActionName("create")]
        public HttpResponseMessage Add(string sessionKey, [FromBody]SubCommentModel comment)
        {
            if (comment == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Can't send null subcomment.");
            }

            if (string.IsNullOrWhiteSpace(comment.Content))
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Can't send empty or whitespace comment.");
            }

            if (string.IsNullOrWhiteSpace(comment.Author))
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Can't send comment with no author name.");
            }

            var isValidSessionKey = UserPersister.ValidateSessionKey(sessionKey);
            if (!isValidSessionKey)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Invalid Session Key.");
            }

            SubComment newComment = CreateSubComment(comment);

            var addedComment = subCommentsRepository.Add(newComment);

            return Request.CreateResponse(HttpStatusCode.OK, addedComment.Id);
        }

        private SubComment CreateSubComment(SubCommentModel comment)
        {

            var user = UserPersister.GetUser(comment.Author);
            var newComment = new SubComment();
            newComment.AuthorId = user.Id;
            newComment.Content = comment.Content;
            newComment.Date = DateTime.Now;
            newComment.ParentComment = comment.ParentCommentId;

            return newComment;
        }

        [HttpDelete]
        [ActionName("delete")]
        public HttpResponseMessage Delete(string sessionKey, int id)
        {
            if (id < 1)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Incorrect comment id.");
            }

            var isValidSessionKey = UserPersister.ValidateSessionKey(sessionKey);
            if (!isValidSessionKey)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Invalid Session Key.");
            }

            subCommentsRepository.Delete(id);

            return Request.CreateResponse(HttpStatusCode.OK);
        }
    }
}
