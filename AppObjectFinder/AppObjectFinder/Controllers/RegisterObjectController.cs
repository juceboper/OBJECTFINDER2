using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppObjectFinder.Controllers
{
    public class RegisterObjectController : Controller
    {
        // GET: RegisterObject
        public ActionResult Index()
        {
            return View();
        }

        // GET: RegisterObject/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: RegisterObject/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: RegisterObject/Create
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

        // GET: RegisterObject/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: RegisterObject/Edit/5
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

        // GET: RegisterObject/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: RegisterObject/Delete/5
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
