using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBlog.Models
{
    //Модель используется при создании новой записи
    public class CreateNewModel
    {
        /// <summary>список языков</summary>
        public List<Lang> LangList=new List<Lang>();

        /// <summary>список технологий</summary>
        public List<Technology> TechnologyList=new List<Technology>();

        /// <summary>список тегов</summary>
        public List<Tag> TagList=new List<Tag>();
    }
}