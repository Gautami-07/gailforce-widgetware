WITH
Num2022TempDatesByStation AS
(
  SELECT
    daily_weather.stn,

    COUNT(DISTINCT
      DATE(
        CAST(daily_weather.year AS INT64),
        CAST(daily_weather.mo AS INT64),
        CAST(daily_weather.da AS INT64)
        )) AS num_2022_temp_dates

  FROM
    `bigquery-public-data.noaa_gsod.gsod2022` daily_weather

  WHERE
    daily_weather.temp IS NOT NULL AND
    daily_weather.max IS NOT NULL AND
    daily_weather.min IS NOT NULL AND
    daily_weather.temp != 9999.9 AND
    daily_weather.max != 9999.9 AND
    daily_weather.min != 9999.9

  GROUP BY
    daily_weather.stn
),

MaxNum2022TempDates AS
(
  SELECT
    MAX(num_2022_temp_dates) AS max_num_2022_temp_dates

  FROM
    Num2022TempDatesByStation
)

SELECT
  Stations.*,
  Num2022TempDatesByStation.num_2022_temp_dates

FROM
  `bigquery-public-data.noaa_gsod.stations` Stations

INNER JOIN
  Num2022TempDatesByStation ON (
    stations.usaf = Num2022TempDatesByStation.stn
    )

CROSS JOIN
  MaxNum2022TempDates

WHERE
  Stations.usaf != '999999' AND
  Stations.begin <= '20000101' AND
  Stations.end >= '20201231' AND
  Num2022TempDatesByStation.num_2022_temp_dates >=
    (0.90 * MaxNum2022TempDates.max_num_2022_temp_dates)

ORDER BY
  stations.usaf
