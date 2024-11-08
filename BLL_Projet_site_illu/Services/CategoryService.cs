using BLL_Projet_site_illu.Entities;
using Shared_Projet_site_illu.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DAL_Projet_site_illu.Services;

namespace BLL_Projet_site_illu.Services
{
    public class CategoryService : ICategoryRepository<Category>
    {
        private readonly DAL.CategoryService _Repository;

        public CategoryService(DAL.CategoryService repository)
        {
            _Repository = repository;
        }

        public void Delete(string id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<string> Get()
        {
            return _Repository.Get();
        }

        public string Get(string id)
        {
            throw new NotImplementedException();
        }

        public string Insert(string entity)
        {
            throw new NotImplementedException();
        }

        public string Insert(Category entity)
        {
            throw new NotImplementedException();
        }

        public void Update(string entity)
        {
            throw new NotImplementedException();
        }

        public void Update(Category entity)
        {
            throw new NotImplementedException();
        }

        IEnumerable<Category> ICRUDRepository<Category, string>.Get()
        {
            throw new NotImplementedException();
        }

        Category ICRUDRepository<Category, string>.Get(string id)
        {
            throw new NotImplementedException();
        }
    }
}
