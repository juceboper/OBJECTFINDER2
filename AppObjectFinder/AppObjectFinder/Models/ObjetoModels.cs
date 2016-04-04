using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppObjectFinder.Models
{
    public class ObjetoModels: PrincipalModels
    {
        [Required]
        [Display(Name = "Categoría")]
        public string P_nombreCategoria { get; set; }

        [Required]
        [Display(Name = "Categoría")]
        public IEnumerable<SelectListItem> ListCategoria { get; set; }
    }
}