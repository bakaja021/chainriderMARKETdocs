# Data Objects

<a id="divider"></a>

<h2 id="tocTokenUsage">Token Usage Object</h2>

<a id="schemetokenusageobject"></a>

|Name|Type|Description|
|---|---|---|
|message|JSON|Message object containing token usage data.|
|hour|[Usage Object](#tocTokenUsage)|Provides info regarding API usage, for the current hour.|
|day|[Usage Object](#tocTokenUsage)|Provides info regarding API usage, for the current day.|
|forward|[Usage Object](#tocTokenUsage)|Provides info regarding payment forward API usage, for the current month.|

> Example

```json
{
  "message":{
      "hour":{
          "usage":2,
          "limit":300,
          "time_left":1857
      },
      "day":{
          "usage":2,
          "limit":3000,
          "time_left":34257
      },
      "forward":{
          "usage":0,
          "limit":3,
          "time_left":1675857
      }
  }
}
```

<h2 id="tocUsageObject">Usage Object</h2>

<a id="schemeusageobject"></a>

|Name|Type|Description|
|---|---|---|
|usage|Integer|Number of API calls within the corresponding time period.|
|limit|Integer|Total number of available API calls within the corresponding time period.|
|time_left|Integer|Seconds until the counter restarts and **usage** is reset.|

> Example

```json
{
  "usage":2,
  "limit":300,
  "time_left":1857
}
```

<h2 id="tocVWAPObject">VWAP Object</h2>

<a id="schemevwapobject"></a>

|Name|Type|Description|
|---|---|---|
|pair|String|The digital asset you requested VWAP for. See [Supported Pairs](#supported-pairs-and-exchanges)|
|upper_unix|Integer|Upper time range in seconds. See <a href="https://www.unixtimestamp.com/" target="_blank">Unix Timestamp</a>|
|lower_unix|Integer|Lower time range in seconds.|
|vwap|Float|Volume weighted average price in **USD**.|
|analytics|[Analytics Object](#tocAnalyticsObject)|Includes total number of data points used in the VWAP calculation, and amount for each individual exchange.|

> Example

```json
{
    "message": {
        "pair": "BTCUSD",
        "upper_unix": 1535466227,
        "lower_unix": 1535466002,
        "vwap": 7064.24,
        "analytics": {
            "data_points": 1153,
            "exchange_data": {
                "Bitfinex": 289,
                "Kucoin": 12,
                "Binance": 852
            }
        }
    }
}
```

<h2 id="tocAnalyticsObject">Analytics Object</h2>

<a id="schemeanalyticsobject"></a>

|Name|Type|Description|
|---|---|---|
|data_points|Integer|Total number of data points used for the calculation. A single data point would include the volume of a trade, and the price point for that trade.|
|exchange_data|JSON|All exchanges that were part of the original request will be listed as keys, in which the value indicates the number of distinct trades gathered from that exchange and used accordingly in the calculation.|

> Example

```json
{
  "data_points": 1153,
  "exchange_data": {
      "Bitfinex": 289,
      "Kucoin": 12,
      "Binance": 852
    }
}
```

<h2 id="tocVolumeExchangeObject">Volume Exchange Object</h2>

<a id="schemevolumeexchangeobject"></a>

|Name|Type|Description|
|---|---|---|
|exchange|String|The exchange requested. See [Supported Exchanges](#supported-pairs-and-exchanges)
|volume_data|JSON|Keys indicate the pairs on an exchange, while their values represent the volume traded in `BTC`, `ETH`, etc.|
|upper_unix|Integer|Upper time range in seconds. See <a href="https://www.unixtimestamp.com/" target="_blank">Unix Timestamp</a>|
|lower_unix|Integer|Lower time range in seconds.|

> Example

```json
{
    "message": {
        "exchange": "Bitfinex",
        "volume_data": {
            "BTCUSD": 52.3741,
            "ETHUSD": 683.7672,
            "ETCUSD": 2045.4391,
            "LTCUSD": 413.115,
            "DASHUSD": 22.1823
        },
        "upper_unix": 1535466227,
        "lower_unix": 1535466026
    }
}
```


<h2 id="tocVolumePairObject">Volume Pair Object</h2>

<a id="schemevolumepairobject"></a>

|Name|Type|Description|
|---|---|---|
|pair|String|The asset pair you requested volume for. See [Supported Pairs](#supported-pairs-and-exchanges)|
|volume_data|JSON|Keys indicate an exchange, while their values represent the volume traded for whichever **pair** you supplied. `BTC`, `ETH`, etc.|
|upper_unix|Integer|Upper time range in seconds. See <a href="https://www.unixtimestamp.com/" target="_blank">Unix Timestamp</a>|
|lower_unix|Integer|Lower time range in seconds.|

> Example

```json
{
    "message": {
        "pair": "BTCUSD",
        "volume_data": {
            "Binance": 408.6127,
            "Bitfinex": 0,
            "Bitstamp": 0,
            "Coinbase": 0,
            "Gemini": 0.5026,
            "HitBTC": 34.49,
            "Huobi": 300.8407,
            "Kraken": 7.5747,
            "Kucoin": 0.4886,
            "Poloniex": 17.8651
        },
        "upper_unix": 1535989565,
        "lower_unix": 1535988565
    }
}
```

<h2 id="tocInfoObject">Info Object</h2>

<a id="schemeinfoobject"></a>

|Name|Type|Description|
|---|---|---|
|valid_pairs|Array of Strings|All asset pairs supported by **ChainRider**.|
|valid_exchanges|Array of Strings|All exchanges supported by **ChainRider**.|
|valid_exchange_pairs|JSON|Valid exchanges for all supported pairs.|
|valid_pairs_on_exchanges|JSON|Valid pairs for all supported exchanges.|
|valid_intervals_twap|JSON|Valid intervals for a **TWAP** calculation, in minutes.|
|max_intervals_by_interval|JSON|Maximum number of intervals which can be returned, for a given interval duration.|


> Example

```json
{
    "message": {
        "valid_pairs": [
            "BTCUSD",
            "ETHUSD",
            "ETCUSD",
            "LTCUSD",
            "DASHUSD"
        ],
        "valid_exchanges": [
            "Binance",
            "Bitfinex",
            "Bitstamp",
            "Coinbase",
            "Gemini",
            "HitBTC",
            "Huobi",
            "Kraken",
            "Kucoin",
            "Poloniex"
        ],
        "valid_exchange_pairs": {
            "BTCUSD": [
                "Binance",
                "Bitfinex",
                "Bitstamp",
                "Coinbase",
                "Gemini",
                "HitBTC",
                "Huobi",
                "Kraken",
                "Kucoin",
                "Poloniex"
            ],
            "ETHUSD": [
                "Binance",
                "Bitfinex",
                "Bitstamp",
                "Coinbase",
                "Gemini",
                "HitBTC",
                "Huobi",
                "Kraken",
                "Kucoin",
                "Poloniex"
            ],
            "ETCUSD": [
                "Binance",
                "Bitfinex",
                "HitBTC",
                "Huobi",
                "Kraken",
                "Poloniex"
            ],
            "LTCUSD": [
                "Binance",
                "Bitfinex",
                "Bitstamp",
                "Coinbase",
                "HitBTC",
                "Huobi",
                "Kraken",
                "Kucoin",
                "Poloniex"
            ],
            "DASHUSD": [
                "Bitfinex",
                "HitBTC",
                "Huobi",
                "Kraken",
                "Poloniex"
            ]
        },
        "valid_pairs_on_exchanges": {
            "Binance": [
                "BTCUSD",
                "ETHUSD",
                "ETCUSD",
                "LTCUSD"
            ],
            "Bitfinex": [
                "BTCUSD",
                "ETHUSD",
                "ETCUSD",
                "LTCUSD",
                "DASHUSD"
            ],
            "Bitstamp": [
                "BTCUSD",
                "ETHUSD",
                "LTCUSD"
            ],
            "Coinbase": [
                "BTCUSD",
                "ETHUSD",
                "ETCUSD",
                "LTCUSD"
            ],
            "Gemini": [
                "BTCUSD",
                "ETHUSD"
            ],
            "HitBTC": [
                "BTCUSD",
                "ETHUSD",
                "ETCUSD",
                "LTCUSD",
                "DASHUSD"
            ],
            "Huobi": [
                "BTCUSD",
                "ETHUSD",
                "ETCUSD",
                "LTCUSD",
                "DASHUSD"
            ],
            "Kraken": [
                "BTCUSD",
                "ETHUSD",
                "ETCUSD",
                "LTCUSD",
                "DASHUSD"
            ],
            "Kucoin": [
                "BTCUSD",
                "ETHUSD",
                "LTCUSD"
            ],
            "Poloniex": [
                "BTCUSD",
                "ETHUSD",
                "ETCUSD",
                "LTCUSD",
                "DASHUSD"
            ]
        },
        "valid_intervals_twap": [
            1,
            5,
            10,
            15,
            30,
            60
        ],
        "max_intervals_by_interval": {
            "1": 720,
            "5": 144,
            "10": 72,
            "15": 48,
            "30": 24,
            "60": 12
        }
    }
}
```


<h2 id="tocErrorObject">Error Object</h2>

<a id="schemeerrorobject"></a>

|Name|Type|Description|
|---|---|---|
|error|JSON|Contains a description of the error for certain API parameters, or a general description of the error.|

> Example

```json
{
    "error": {
        "pair": [
            "Bad Request [Invalid pair BTCCUSD provided. Only use ['BTCUSD', 'ETHUSD', 'ETCUSD', 'LTCUSD', 'DASHUSD']]"
        ],
        "exchanges": [
            "Bad Request [Invalid exchange provided {'Bitffinex'} -- valid exchanges for BTCCUSD: {'BTCUSD': ['Binance', 'Bitfinex', 'Bitstamp', 'Coinbase', 'Gemini', 'HitBTC', 'Huobi', 'Kraken', 'Kucoin', 'Poloniex'], 'ETHUSD': ['Binance', 'Bitfinex', 'Bitstamp', 'Coinbase', 'Gemini', 'HitBTC', 'Huobi', 'Kraken', 'Kucoin', 'Poloniex'], 'ETCUSD': ['Binance', 'Bitfinex', 'HitBTC', 'Huobi', 'Kraken', 'Poloniex'], 'LTCUSD': ['Binance', 'Bitfinex', 'Bitstamp', 'Coinbase', 'HitBTC', 'Huobi', 'Kraken', 'Kucoin', 'Poloniex'], 'DASHUSD': ['Bitfinex', 'HitBTC', 'Huobi', 'Kraken', 'Poloniex']}"
        ]
    }
}
```
