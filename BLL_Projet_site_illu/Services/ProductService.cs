
using BLL_Projet_site_illu.Entities;
using BLL_Projet_site_illu.Mappers;
using DAL_Projet_site_illu.Entities;
using Shared_Projet_site_illu.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAL = DAL_Projet_site_illu.Entities;
using Product = BLL_Projet_site_illu.Entities.Product;


namespace BLL_Projet_site_illu.Services
{
    public class ProductService : IProductRepository<Product>
    {
        private readonly IProductRepository<DAL.Product> _productRepository;

        public ProductService(IProductRepository<DAL.Product> productRepository)
        {
            _productRepository = productRepository;
        }

        public void Delete(int id)
        {
            _productRepository.Delete(id);
        }

        public IEnumerable<Product> Get()
        {
            return _productRepository.Get().Select(d => d.ToBLL());
        }

        public Product Get(int id)
        {
            return _productRepository.Get(id).ToBLL();
        }

        public IEnumerable<Product> GetByCategory(string category)
        {
            return _productRepository.GetByCategory(category).Select(d => d.ToBLL());
        }

        public int Insert(Product entity)
        {
            return _productRepository.Insert(entity.ToDAL());
        }

        public void Update(Product entity)
        {
            _productRepository.Update(entity.ToDAL());
        }
    }
}
