using AppObjectFinder.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppObjectFinder.Controllers
{
    public class ObjetoController:Controller
    {
        // GET: Objeto
        public ActionResult Index()
        {
            return View();
        }

        // GET: Objeto/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Objeto/Create
        public ActionResult Create()
        {
            cargarCategorias();

            return View();
        }

        private void cargarCategorias()
        {
            ObjetoModels objeto = new ObjetoModels();

            var items = LogicaObjectFinder.Logica.LogObjectFinder.getCategoria();

            ViewBag.ListaCategoria = new SelectList(items, "ID_CATEGORIA", "NOMBRE_CATEGORIA");
        }

        // POST: Objeto/Create
        [HttpPost]
        public ActionResult Create(ObjetoModels Objeto, HttpPostedFileBase image)
        {
            EntidadesObjectFinder.Media.entMedia entMedia = new EntidadesObjectFinder.Media.entMedia();
            EntidadesObjectFinder.Objeto.entObjeto entObjeto = new EntidadesObjectFinder.Objeto.entObjeto();
            Int32 idObjeto = 0;

            if(image != null)
            {
                //Entidades de la Imagen
                entMedia.tipoImagen = image.ContentType;
                int tamanio = image.ContentLength;
                byte[] buffer = new byte[tamanio];
                image.InputStream.Read(buffer,0, tamanio);
                entMedia.imagen = buffer;
                entMedia.nombreImagen = image.FileName;
                entMedia.palabrasClaves = Objeto.P_palabrasClaves;

                //Entidades del Objeto
                entObjeto.idCategoria = Objeto.P_idCategoria;
                entObjeto.idEstado = 1;
                entObjeto.nombreObjeto = Objeto.P_nombreObjeto;
                entObjeto.palabrasClaves = Objeto.P_palabrasClaves;


                LogicaObjectFinder.Logica.LogObjectFinder.insertarObjeto(entObjeto, entMedia, out idObjeto);

            }
           
            //if(ModelState.IsValid)
            //{
            //    // TODO: Add insert logic here
            //    EntidadesObjectFinder.Objeto.entObjeto objObjeto = new EntidadesObjectFinder.Objeto.entObjeto();


            //    //objObjeto.idCategoria = collection

            //    return RedirectToAction("Index");
            //}

            cargarCategorias();

            return View(Objeto);
        }


        // GET: Objeto/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Objeto/Edit/5
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

        // GET: Objeto/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Objeto/Delete/5
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
