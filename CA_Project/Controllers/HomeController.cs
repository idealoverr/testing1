using CA_Project.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace CA_Project.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ShopContext _context;
        private readonly IHttpContextAccessor _HttpContextAccessor;
        public HomeController(ILogger<HomeController> logger, ShopContext context, IHttpContextAccessor HttpContextAccessor)
        {
            _logger = logger;
            _context = context;
            _HttpContextAccessor = HttpContextAccessor;
        }

        public IActionResult Index()
        {
            IEnumerable<Good> GoodList = _context.Goods.ToList();
            return View(GoodList);
        }

        [HttpPost]
        public IActionResult Add(string ProductName)
        {
            ProductName = ProductName.Replace(".", "dot");
            ProductName = ProductName.Replace(" ", "");
            if (_HttpContextAccessor.HttpContext.Session.GetString("Nickname") != null)
            {
                string cookie = _HttpContextAccessor.HttpContext.Request.Cookies[ProductName];
                if (cookie == null)
                {
                    CookieOptions option = new CookieOptions();
                    option.Expires = DateTime.Now.AddDays(7);
                    _HttpContextAccessor.HttpContext.Response.Cookies.Append(ProductName, ProductName, option);
                    TempData["Message"] = "Successfully added";
                    return Redirect("/");
                }
                else
                {
                    TempData["Message"] = "Already in cart";
                    return Redirect("/");
                }
            }
            else
            {
                TempData["Message"] = "Please login";
                return Redirect("/");
            }            
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}