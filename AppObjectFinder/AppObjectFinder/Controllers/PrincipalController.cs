using System;
using System.Web.Mvc;

namespace AppObjectFinder.Controllers
{
    public class PrincipalController : Controller
    {
        // GET: Principal
        public ActionResult Index()
        {
            Models.PrincipalModels obj = new Models.PrincipalModels();
            obj.P_nroObjetos = LogicaObjectFinder.Logica.LogObjectFinder.getNroObjetos(1);

            foreach(var item in LogicaObjectFinder.Logica.LogObjectFinder.getObjetos(1))
            {
                obj.P_idCategoria = item.idCategoria;
                obj.P_idEstado = item.idEstado;
                obj.P_nombreObjeto = item.nombreObjeto;
                obj.P_palabrasClaves = item.palabrasClaves;
                obj.P_idObjeto = item.idObjeto;
            }

            return View(obj);
        }

        // GET: Principal/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Principal/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Principal/Create
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

        // GET: Principal/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Principal/Edit/5
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

        // GET: Principal/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Principal/Delete/5
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

        public FileContentResult GetImage(int idObjeto)
        {
            string type = string.Empty;
            byte[] image = new byte[0];

            foreach(var item in LogicaObjectFinder.Logica.LogObjectFinder.GetImage(idObjeto))
            {
                type = item.tipoImagen;
                image = item.imagen;
            }

            return File(image, type);
        }

    }
}
