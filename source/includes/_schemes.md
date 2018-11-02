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

<h2 id="tocWebsocketWelcomeObject">WebSocket Welcome Object</h2>

<a id="schemewebsocketwelcomeobject"></a>

|Name|Type|Description|
|---|---|---|
|message|String|Welcome message upon successful connection|

> Example

```json
{
  "message": "Welcome to ChainRider VWAP websockets"
}
```

<h2 id="tocWebsocketVWAPObject">WebSocket VWAP Object</h2>

<a id="schemewebsocketvwapobject"></a>

|Name|Type|Description|
|---|---|---|
|message|JSON|Message object containing array of VWAP JSON objects for each specified pair in the stream.|
|pair|String|The digital asset you requested VWAP for. See [Supported Pairs](#supported-pairs-and-exchanges)|
|upper_unix|Integer|Upper time range in seconds. See <a href="https://www.unixtimestamp.com/" target="_blank">Unix Timestamp</a>|
|lower_unix|Integer|Lower time range in seconds.|
|vwap|Float|Volume weighted average price in **USD**.|
|difference|Float|Difference between current VWAP and VWAP for the previous interval expressed in percentage. It could be positive (indicating the price has gone up for X% compared to the same interval) or negative value (indicating that the price has gone down for X% compared to the same interval). **Example** if we have requested VWAP for BTC for interval of 1h, and we receive `difference: 1.53`, it means that the price for last hour has gone up for 1.53% compared to an hour before that. In case we request VWAP for interval of 1 minute, difference will indicate compraration between the price for the last minute and one minute before that.|

> Example

```json
{
  "message": [
      {"pair": "BTCUSD", "lower_unix": 1541066704, "upper_unix": 1541066764, "vwap": 6367.78, "difference": 0.21},
      {"pair": "ETHUSD", "lower_unix": 1541066704, "upper_unix": 1541066764, "vwap": 198.48, "difference": 0.01},
      {"pair": "ETCUSD", "lower_unix": 1541066704, "upper_unix": 1541066764, "vwap": 9.05, "difference": 0.11},
      {"pair": "LTCUSD", "lower_unix": 1541066704, "upper_unix": 1541066764, "vwap": 50.02, "difference": -0.02},
      {"pair": "DASHUSD", "lower_unix": 1541066704, "upper_unix": 1541066764, "vwap": 152.92, "difference": 0.03},
      {"pair": "BCHUSD", "lower_unix": 1541066704, "upper_unix": 1541066764, "vwap": 425.62, "difference": 0.03},
      {"pair": "BTGUSD", "lower_unix": 1541066704, "upper_unix": 1541066764, "vwap": 26.51, "difference": 0.0}
  ]
}
```

<h2 id="tocWebSocketErrorObject">WebSocket Error Object</h2>

<a id="schemewebsocketerrorobject"></a>

|Name|Type|Description|
|---|---|---|
|error|String|Error message. List of possible error messages is given in the table below.|

> Example

```json
{
  "error": "Unknown user."
}
```

|Error|
|---|
|Token missing.|
|Token invalid.|
|Unknown user.|
|Please activate token in order to use ChainRider websockets.|
|You have exceeded number of possible connections. Please upgrade current plan|
|You have unsupported pairs in request "REQUESTED_PAIRS_ARRAY"|


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

<h2 id="tocTWAPObject">TWAP Object</h2>

*TWAP object comprises all intervals you have requested where key of the interval is the start unix_time of the interval. Each interval provides info about typical price and TWAP.*

<a id="schemetwapobject"></a>

|Name|Type|Description|
|---|---|---|
|typical_price|Float|Typical price: (Open + High + Low + Close) / 4|
|twap|Float|TWAP price: (Sum of Typical Price) / (# of Intervals)|


> Example

```json
{
    "message": {
        "1537175340": {
            "typical_price": 11.09,
            "twap": 11.09
        },
        "1537175940": {
            "typical_price": 11.09,
            "twap": 11.09
        },
        "1537176540": {
            "typical_price": 11.15,
            "twap": 11.11
        },
        "1537177140": {
            "typical_price": 11.17,
            "twap": 11.12
        },
        "1537177740": {
            "typical_price": 11.16,
            "twap": 11.13
        }
    }
}
```

<h2 id="tocInfoObject">Info Object</h2>

<a id="schemeinfoobject"></a>

|Name|Type|Description|
|---|---|---|
|pairs|Array of Strings|All asset pairs supported by **ChainRider**.|
|exchanges|Array of Strings|All exchanges supported by **ChainRider**.|
|exchange_pairs|JSON|Valid exchanges for all supported pairs.|
|pairs_exchanges|JSON|Valid pairs for all supported exchanges.|
|intervals_twap|JSON|Valid intervals for a **TWAP** calculation, in minutes.|
|max_intervals_twap|JSON|Maximum number of intervals which can be returned, for a given interval duration.|


> Example

```json
{
  "message": {
    "pairs": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "DASHUSD", "BCHUSD",
              "BTGUSD", "OMGUSD","EOSUSD", "TRXUSD", "XMRUSD", "VETUSD",
              "IOTAUSD", "ZECUSD", "TUSDUSD", "NEOUSD", "ADAUSD"],
    "exchanges": ["Binance", "Bitfinex", "Bitstamp", "Coinbase",
                  "Gemini", "HitBTC", "Huobi", "Kraken", "Kucoin", "Poloniex"],
    "exchange_pairs": {
        "BTCUSD": ["Binance", "Bitfinex", "Bitstamp", "Coinbase",
                   "Gemini", "HitBTC", "Huobi", "Kraken", "Kucoin", "Poloniex"],
        "ETHUSD": ["Binance", "Bitfinex", "Bitstamp", "Coinbase",
                   "Gemini", "HitBTC", "Huobi", "Kraken", "Kucoin", "Poloniex"],
        "ETCUSD": ["Binance", "Bitfinex", "HitBTC", "Huobi", "Kraken", "Poloniex"],
        "LTCUSD": ["Binance", "Bitfinex", "Bitstamp", "Coinbase", "HitBTC",
                   "Huobi", "Kraken", "Kucoin", "Poloniex"],
        "DASHUSD": ["Bitfinex", "HitBTC", "Huobi", "Kraken", "Poloniex"],
        "BCHUSD": ["Binance", "Bitfinex", "Bitstamp", "Coinbase", "HitBTC",
                   "Huobi", "Kraken", "Kucoin", "Poloniex"],
        "BTGUSD": ["Bitfinex", "HitBTC"],
        "OMGUSD": ["HitBTC"],
        "EOSUSD": ["Binance", "Bitfinex", "HitBTC", "Huobi", "Kraken",
                   "Kucoin", "Poloniex"],
        "TRXUSD": ["Binance", "Bitfinex", "HitBTC", "Huobi", "Kucoin"],
        "XMRUSD": ["Bitfinex", "HitBTC", "Kraken", "Poloniex"],
        "VETUSD": ["Binance", "Bitfinex", "Huobi", "Kucoin"],
        "IOTAUSD": ["Binance", "Bitfinex", "HitBTC", "Huobi"],
        "ZECUSD": ["Bitfinex", "Gemini", "HitBTC", "Huobi", "Kraken", "Poloniex"],
        "TUSDUSD": ["Binance"],
        "NEOUSD": ["Binance", "Bitfinex", "HitBTC", "Huobi", "Kucoin"],
        "ADAUSD": ["Binance", "HitBTC", "Huobi", "Kraken"]
    },
    "pairs_exchanges": {
        "Binance": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "BCHUSD", "EOSUSD",
                    "TRXUSD", "VETUSD", "IOTAUSD", "TUSDUSD", "NEOUSD", "ADAUSD"],
        "Bitfinex": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "DASHUSD", "BCHUSD",
                     "BTGUSD", "EOSUSD", "TRXUSD", "XMRUSD", "VETUSD", "IOTAUSD",
                     "ZECUSD", "NEOUSD"],
        "Bitstamp": ["BTCUSD", "ETHUSD", "LTCUSD", "BCHUSD"],
        "Coinbase": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "BCHUSD"],
        "Gemini": ["BTCUSD", "ETHUSD", "ZECUSD"],
        "HitBTC": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "DASHUSD", "BCHUSD",
                   "BTGUSD", "OMGUSD", "EOSUSD", "TRXUSD", "XMRUSD", "IOTAUSD",
                   "ZECUSD", "NEOUSD"],
        "Huobi": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "DASHUSD", "BCHUSD",
                  "EOSUSD", "TRXUSD", "XMRUSD", "IOTAUSD", "ZECUSD", "NEOUSD",
                  "ADAUSD"],
        "Kraken": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "DASHUSD", "BCHUSD",
                   "EOSUSD", "XMRUSD", "ZECUSD", "NEOUSD", "ADAUSD"],
        "Kucoin": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "BCHUSD", "EOSUSD",
                   "TRXUSD", "VETUSD", "IOTAUSD", "NEOUSD", "ADAUSD"],
        "Poloniex": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "DASHUSD",
                     "BCHUSD", "EOSUSD", "XMRUSD", "ZECUSD"]
    },
    "intervals_twap": [1, 5, 10, 15, 30, 60],
    "max_intervals_twap": {"1": 720, "5": 144, "10": 72,
                           "15": 48, "30": 24, "60": 12}
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
