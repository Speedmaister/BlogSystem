//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BlogSystem.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Vote
    {
        public int Id { get; set; }
        public int AuthorId { get; set; }
        public int ArticleId { get; set; }
        public bool Value { get; set; }
    
        public virtual Article Article { get; set; }
        public virtual User User { get; set; }
    }
}
