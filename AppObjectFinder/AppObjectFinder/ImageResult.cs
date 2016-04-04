using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppObjectFinder
{
    public class ImageResult: ViewResult
    {
        public int Width { get; set; }
        public int Height { get; set; }
        public string Text { get; set; }

        public override void ExecuteResult(ControllerContext context)
        {
            context.HttpContext.Response.ContentType = "image/jpeg";

            Rectangle rect = new Rectangle(0, 0, Width, Height);
            Bitmap bmp = new Bitmap(rect.Width, rect.Height);
            Graphics g = Graphics.FromImage(bmp);
            Font font = new Font("Arial", Height / 1.6f);
            LinearGradientBrush brush =
                   new LinearGradientBrush(rect, Color.Blue, Color.Navy, 90f);

            g.FillRectangle(brush, rect);                  // Pinta el degradado...
            g.DrawString(Text, font, Brushes.Black, 2, 2); // ... la sombra del texto...
            g.DrawString(Text, font, Brushes.White, 0, 0); // ... y el texto.

            g.Dispose();
            font.Dispose();
            brush.Dispose();

            bmp.Save(context.HttpContext.Response.OutputStream, ImageFormat.Jpeg);
            bmp.Dispose();
        }
    }
}