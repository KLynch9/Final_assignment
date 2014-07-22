using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zoo_ClassLibrary;

namespace Final_Assignment
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetWeather_Click(object sender, EventArgs e)
        {
            string zip = txtZip.Text;
            weather.Weather myService = new weather.Weather();
            lblCity.Text = myService.GetCityWeatherByZIP(zip).City;
            lblWeather.Text = myService.GetCityWeatherByZIP(zip).Temperature+'F';
            int k = myService.GetCityWeatherByZIP(zip).WeatherID;
            if (k==1 || k==18)
            {
                imgWeather.ImageUrl = "http://ws.cdyne.com/WeatherWS/Images/thunderstorms.gif";
            }
            if (k == 2 || k== 10 || k==12 || k==37)
            {
                imgWeather.ImageUrl = "http://ws.cdyne.com/WeatherWS/Images/partlycloudy.gif";
            }
            if (k == 3 || k==9 ||k==14)
            {
                imgWeather.ImageUrl = "http://ws.cdyne.com/WeatherWS/Images/mostlycloudy.gif";
            }
            if (k == 4 || k==11)
            {
                imgWeather.ImageUrl = "http://ws.cdyne.com/WeatherWS/Images/sunny.gif";
            }
            if (k == 5 || k==28 || k==32 || k==33)
            {
                imgWeather.ImageUrl = "http://ws.cdyne.com/WeatherWS/Images/rain.gif";
            }
            if (k == 6)
            {
                imgWeather.ImageUrl = "http://ws.cdyne.com/WeatherWS/Images/showers.gif";
            }
            if (k == 7)
            {
                imgWeather.ImageUrl = "http://ws.cdyne.com/WeatherWS/Images/haze.gif";
            }        
            if (k == 15 ||k==34 ||k==36)
            {
                imgWeather.ImageUrl = "http://ws.cdyne.com/WeatherWS/Images/na.gif";
            }
            if (k == 17)
            {
                imgWeather.ImageUrl = "http://ws.cdyne.com/WeatherWS/Images/drizzle.gif";
            }
            if (k == 19||k==35||k==29||k==26||k==21)
            {
                imgWeather.ImageUrl = "http://ws.cdyne.com/WeatherWS/Images/blowingsnow.gif";
            }
            if (k == 27)
            {
                imgWeather.ImageUrl = "http://ws.cdyne.com/WeatherWS/Images/snow.gif";
            }
        }
    }
}