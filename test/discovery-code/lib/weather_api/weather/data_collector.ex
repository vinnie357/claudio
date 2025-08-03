defmodule WeatherApi.Weather.DataCollector do
  @moduledoc """
  GenServer responsible for collecting weather data from multiple providers
  and maintaining real-time weather information in the cache.
  """

  use GenServer
  require Logger

  alias WeatherApi.Weather.{OpenWeatherMap, AccuWeather, NOAA}
  alias WeatherApi.Cache

  @collection_interval :timer.minutes(5)

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    Logger.info("Starting WeatherApi.Weather.DataCollector")
    schedule_collection()
    {:ok, %{last_collection: DateTime.utc_now()}}
  end

  @impl true
  def handle_info(:collect_data, state) do
    Logger.debug("Collecting weather data from all providers")
    
    # Collect data from multiple providers concurrently
    tasks = [
      Task.async(fn -> OpenWeatherMap.collect_data() end),
      Task.async(fn -> AccuWeather.collect_data() end),
      Task.async(fn -> NOAA.collect_data() end)
    ]

    results = Task.await_many(tasks, 30_000)
    
    # Process and cache the collected data
    process_weather_data(results)
    
    # Schedule next collection
    schedule_collection()
    
    {:noreply, %{state | last_collection: DateTime.utc_now()}}
  end

  @impl true
  def handle_call(:get_status, _from, state) do
    status = %{
      last_collection: state.last_collection,
      next_collection: DateTime.add(state.last_collection, @collection_interval, :millisecond),
      providers_active: [:openweathermap, :accuweather, :noaa]
    }
    {:reply, status, state}
  end

  def get_status do
    GenServer.call(__MODULE__, :get_status)
  end

  defp schedule_collection do
    Process.send_after(self(), :collect_data, @collection_interval)
  end

  defp process_weather_data(results) do
    Enum.each(results, fn result ->
      case result do
        {:ok, data} ->
          Cache.put_weather_data(data)
          Logger.debug("Successfully processed weather data: #{inspect(data)}")
        
        {:error, reason} ->
          Logger.error("Failed to collect weather data: #{inspect(reason)}")
      end
    end)
  end
end