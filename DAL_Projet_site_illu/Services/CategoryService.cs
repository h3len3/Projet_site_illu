using Microsoft.Extensions.Configuration;
using Shared_Projet_site_illu.Repositories;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Projet_site_illu.Entities;

namespace DAL_Projet_site_illu.Services
{
    public class CategoryService : BaseService, ICategoryRepository<Category>
    {
        public CategoryService(IConfiguration configuration) : base(configuration, "Database1")
        {
        }
        public void Delete(string id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<string> Get()
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Category_GetAll";
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            yield return reader["name_category"].ToString();
                        }
                    }
                }
            }
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
