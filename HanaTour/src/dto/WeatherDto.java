package dto;

public class WeatherDto {

	private int weatherIdx;
	private double lat;
	private double lon;
	private String iata;
	private String weatherDate;
	private String weather;
	private double temp;
	private double pressure;
	private int humidity;
	private int clouds;
	private double wind;
	private double rain;
	private double snow;
	private String city;
	private String country;
	private int timeZone;
	private int sunRise;
	private int sunSet;
	private String iconUrl;
	
	public WeatherDto() {
	}
	
	public WeatherDto(int weatherIdx, double lat, double lon, String iata, String weatherDate, String weather,
			double temp, double pressure, int humidity, int clouds, double wind, double rain, double snow, String city,
			String country, int timeZone, int sunRise, int sunSet, String iconUrl) {
		super();
		this.weatherIdx = weatherIdx;
		this.lat = lat;
		this.lon = lon;
		this.iata = iata;
		this.weatherDate = weatherDate;
		this.weather = weather;
		this.temp = temp;
		this.pressure = pressure;
		this.humidity = humidity;
		this.clouds = clouds;
		this.wind = wind;
		this.rain = rain;
		this.snow = snow;
		this.city = city;
		this.country = country;
		this.timeZone = timeZone;
		this.sunRise = sunRise;
		this.sunSet = sunSet;
		this.iconUrl = iconUrl;
	}

	public int getWeatherIdx() {
		return weatherIdx;
	}

	public void setWeatherIdx(int weatherIdx) {
		this.weatherIdx = weatherIdx;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	public String getIata() {
		return iata;
	}

	public void setIata(String iata) {
		this.iata = iata;
	}

	public String getWeatherDate() {
		return weatherDate;
	}

	public void setWeatherDate(String weatherDate) {
		this.weatherDate = weatherDate;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public double getTemp() {
		return temp;
	}

	public void setTemp(double temp) {
		this.temp = temp;
	}

	public double getPressure() {
		return pressure;
	}

	public void setPressure(double pressure) {
		this.pressure = pressure;
	}

	public int getHumidity() {
		return humidity;
	}

	public void setHumidity(int humidity) {
		this.humidity = humidity;
	}

	public int getClouds() {
		return clouds;
	}

	public void setClouds(int clouds) {
		this.clouds = clouds;
	}

	public double getWind() {
		return wind;
	}

	public void setWind(double wind) {
		this.wind = wind;
	}

	public double getRain() {
		return rain;
	}

	public void setRain(double rain) {
		this.rain = rain;
	}

	public double getSnow() {
		return snow;
	}

	public void setSnow(double snow) {
		this.snow = snow;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getTimeZone() {
		return timeZone;
	}

	public void setTimeZone(int timeZone) {
		this.timeZone = timeZone;
	}

	public int getSunRise() {
		return sunRise;
	}

	public void setSunRise(int sunRise) {
		this.sunRise = sunRise;
	}

	public int getSunSet() {
		return sunSet;
	}

	public void setSunSet(int sunSet) {
		this.sunSet = sunSet;
	}

	public String getIconUrl() {
		return iconUrl;
	}

	public void setIconUrl(String iconUrl) {
		this.iconUrl = iconUrl;
	}
	
	
}

