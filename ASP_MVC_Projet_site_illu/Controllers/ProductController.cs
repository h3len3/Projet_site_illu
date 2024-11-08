using ASP_MVC_Projet_site_illu.Handlers;
using ASP_MVC_Projet_site_illu.Models;
using BLL_Projet_site_illu.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Shared_Projet_site_illu.Repositories;
using System.Diagnostics;

namespace ASP_MVC_Projet_site_illu.Controllers
{
    public class ProductController : Controller
    {

        private readonly IProductRepository<Product> _productRepository;

        public ProductController(IProductRepository<Product> productRepository)
        {
            _productRepository = productRepository;
        }


        // GET: ProductController

        public IActionResult Index(string[]? selectedCateg)
        {
            IEnumerable<ProductListItemViewModel> model;

            if (selectedCateg != null && selectedCateg.Length > 0)
            {
                List<ProductListItemViewModel> categ = new List<ProductListItemViewModel>();
                foreach (string categoryName in selectedCateg)
                {
                    categ.AddRange(_productRepository.GetByCategory(categoryName).Select(d => d.ToListItem()));
                }
                model = categ.Distinct();

                ViewBag.filter = true;

            }

            else
            {

                model = _productRepository.Get().Select(d => d.ToListItem());
                ViewBag.filter = false;
            }

            return View(model);
        }

        // GET: ProductController/Details/5
        public ActionResult DetailsProduct(int id)
        {
            ProductDetailsViewModel model = _productRepository.Get(id).ToDetails();
            return View(model);
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        // GET: ProductController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ProductController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ProductController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ProductController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ProductController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ProductController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
