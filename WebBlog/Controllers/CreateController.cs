using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBlog.Models;

namespace WebBlog.Controllers
{
    //контролер предназначенный для создания поста
    public class CreateController : Controller
    {
        //Создать новую страницу
        [HttpGet]
        [Authorize(Roles = "Master")]
        public ActionResult New()
        {
            ViewBag.Title = "Создание новой страницы";
            CreateNewModel model =new CreateNewModel();
            WebBlogEntities entities =new WebBlogEntities();

            model.LangList = entities.Lang.OrderBy(l=>l.LangID).ToList();
            model.TechnologyList = entities.Technology.OrderBy(t => t.TechID).ToList();

            return View(model);
        }
    }
}