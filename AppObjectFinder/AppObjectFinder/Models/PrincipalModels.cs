using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AppObjectFinder.Models
{
    public class PrincipalModels
    {
        [Required]
        [Display(Name = "Nro Objetos")]
        public int P_nroObjetos { get; set; }

        [Required]
        [Display(Name = "Id Categoria")]
        public int P_idCategoria { get; set; }

        [Required]
        [Display(Name = "Id Estado")]
        public int P_idEstado { get; set; }

        [Required]
        [Display(Name = "Id Objeto")]
        public int P_idObjeto { get; set; }

        [Required]
        [Display(Name = "Descripción")]
        public string P_nombreObjeto { get; set; }

        [Required]
        [Display(Name = "Palabras Claves")]
        public string P_palabrasClaves { get; set; }

        [Required]
        [Display(Name = "Imagen")]
        public byte[] P_Image { get; set; }

    }
}