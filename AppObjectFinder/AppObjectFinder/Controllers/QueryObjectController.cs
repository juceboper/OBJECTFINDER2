using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppObjectFinder.Controllers
{
    public class QueryObjectController : Controller
    {
        // GET: QueryObject
        public ActionResult Index()
        {
            return View();
        }

        // GET: QueryObject/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: QueryObject/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: QueryObject/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: QueryObject/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: QueryObject/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: QueryObject/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: QueryObject/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
