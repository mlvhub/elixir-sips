defmodule CurrentWeather.YahooFetcher do
  require Record

  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText, Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlAttribute, Record.extract(:xmlAttribute, from_lib: "xmerl/include/xmerl.hrl")

  def fetch(woeid) do
    body = get(woeid)
    temp = extract_temperature(body)
  end

  defp extract_temperature(body) do
    #Put code here to extract the temperature from the xml
    {xml, _rest} = :xmerl_scan.string(to_char_list(body))
    [condition] = :xmerl_xpath.string('/rss/channel/item/yweather:condition/@temp', xml)
    xmlAttribute(condition, :value)
  end

  defp get(woeid) do
    {:ok, 200, _headers, client} = :hackney.get(url_for(woeid))
    {:ok, body} = :hackney.body(client)
    body
  end

  defp url_for(woeid) do
    base_url <> woeid
  end

  defp base_url do
    "http://weather.yahooapis.com/forecastrss?w="
  end

end
