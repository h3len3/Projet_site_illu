using DAL_Projet_site_illu.Entities;
using DAL_Projet_site_illu.Services;
using Microsoft.Extensions.Configuration;
using Shared_Projet_site_illu.Repositories;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Projet_site_illu.Mappers;

namespace DAL_Projet_site_illu.Services
{
    public class ProductService : BaseService, IProductRepository<Product>
    {
        public ProductService(IConfiguration configuration) : base(configuration, "Database1")
        {
        }

        public void Delete(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Product_Delete";
                    command.Parameters.AddWithValue("id_product", id);
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    if (command.ExecuteNonQuery() <= 0) throw new ArgumentOutOfRangeException(nameof(id), $"L'identifiant {id} ne correspond à aucune valeur");
                }
            }
        }

        public IEnumerable<Product> Get()
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Product_GetAll";
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            yield return reader.ToProduct();
                        }
                    }
                }
            }
        }

        public Product Get(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Product_GetById";
                    command.Parameters.AddWithValue("Id_Product", id);
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read()) return reader.ToProduct();
                        throw new ArgumentOutOfRangeException(nameof(id), $"L'identifiant {id} ne correspond à aucune valeur");
                    }
                }
            }
        }

        public IEnumerable<Product> GetByCategory(string category)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Product_GetByCategory";
                    command.Parameters.AddWithValue("name_category", category);
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            yield return reader.ToProduct();
                        }

                    }
                }
            }
        }

        public int Insert(Product entity)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Product_Insert";
                    command.Parameters.AddWithValue("name_product", entity.Name_Product);
                    command.Parameters.AddWithValue("description_product", entity.Description_Product);
                    command.Parameters.AddWithValue("price_product", entity.Price_Product);
                    command.Parameters.AddWithValue("name_category", entity.Name_Category);

                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    return (int)command.ExecuteScalar();
                }
            }
        }

        public void Update(Product entity)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Product_Update";
                    command.Parameters.AddWithValue("id_product", entity.Id_Product);
                    command.Parameters.AddWithValue("name_product", entity.Name_Product);
                    command.Parameters.AddWithValue("description_product", entity.Description_Product);
                    command.Parameters.AddWithValue("price_product", entity.Price_Product);
                    command.Parameters.AddWithValue("name_category", entity.Name_Category);
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    if (command.ExecuteNonQuery() <= 0) throw new ArgumentOutOfRangeException(nameof(entity.Id_Product), $"L'identifiant {entity.Id_Product} ne correspond à aucune valeur");
                }
            }
        }
    }
}





