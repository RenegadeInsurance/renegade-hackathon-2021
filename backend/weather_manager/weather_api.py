import logging

import requests


class WeatherAPI:
    """
    API wrapper to extract data from multiple weather API if required.
    """
    AVAILABLE_APIS = {"weatherapi", }

    WEATHERAPI_CURRENT_WEATHER_API_ENDPOINT = "http://api.weatherapi.com/v1/current.json"
    WEATHERAPI_FORECAST_WEATHER_API_ENDPOINT = "http://api.weatherapi.com/v1/forecast.json"

    def __init__(self, api_key: dict[str, str]) -> None:
        """
        :param api_key: Dictionary of api keys for available APIS.
        """
        for api_name in api_key:
            assert (api_name in self.AVAILABLE_APIS), (
                f"`{api_key}` Invalid API key provided, AVAILABLE APIS: [`{', '.join(self.AVAILABLE_APIS)}`]"
            )

        self.api_key = api_key

    def get_weather_for_location(
            self, location: str, get_air_quality_index: bool = False, get_alerts: bool = False,
            days: int = None
    ) -> dict[str, any]:
        """
        Gets location data from available APIS , depending on the parameters.

        :param location: Location name to search for
        :param get_air_quality_index: Includes air quality index in result, if set `True`
        :param get_alerts: Includes any alerts in result, if set `True`
        :param days: Gives forecast for given number of days, but must be less than 6 and greater than 0
        :return: Dictionary of weather information.
        """
        additional_params = {}

        if get_air_quality_index is True:
            additional_params["aqi"] = "yes"
        if get_alerts is True:
            additional_params["alerts"] = "yes"
        if days is not None:
            additional_params["days"] = days

        if additional_params:
            resp = requests.get(self.WEATHERAPI_FORECAST_WEATHER_API_ENDPOINT, params={
                "key": self.api_key.get("weatherapi"),
                "q": location,
                **additional_params
            })
        else:
            resp = requests.get(self.WEATHERAPI_CURRENT_WEATHER_API_ENDPOINT, params={
                "key": self.api_key,
                "q": location,
            })

        if resp.ok:
            try:
                return resp.json()
            except Exception as e:
                logging.error(e)
                raise ValueError("Invalid input or Location not found.")
        else:
            raise ValueError("Location Not Found.")
