# Supported Pairs and Exchanges

### Supported pairs

* `BTCUSD`
* `ETHUSD`
* `ETCUSD`
* `LTCUSD`
* `DASHUSD`
* `BCHUSD`
* `BTGUSD`
* `EOSUSD`
* `TRXUSD`
* `XMRUSD`
* `VETUSD`
* `IOTAUSD`
* `ZECUSD`
* `TUSDUSD`
* `NEOUSD`
* `ADAUSD`

### Supported exchanges

* `Binance`
* `Bitfinex`
* `Bitstamp`
* `Coinbase`
* `Gemini`
* `HitBTC`
* `Huobi`
* `Kraken`
* `Kucoin`
* `Poloniex`

### Supported websocket intervals

|Interval|Description|
|---|---|
|1m|Provides Moving VWAP for last 60 seconds|
|5m|Provides Moving VWAP for last 5 minutes|
|10m|Provides Moving VWAP for last 10 minutes|
|30m|Provides Moving VWAP for last 30 minutes|
|1h|Provides Moving VWAP for last hour|
|6h|Provides Moving VWAP for last 6 hours|
|12h|Provides Moving VWAP for last 12 hours|
|24h|Provides Moving VWAP for last 24 hours|

<a id="divider"></a>

## API Query

View information about ChainRider supported exchanges and asset pairs through the API.

<h3 id="getSupportedParameters">GET /v1/finance/info/ </h3>

<a id="opIdGetSupportedParameters"></a>

|Parameter|In|Type|Description|
|---|---|---|---|---|
|Chain-Rider|Headers|String|Your unique authentication token.|

<h3 id="response">Response</h3>

|Status|Meaning|Schema|
|---|---|---|
|200|<a href="https://tools.ietf.org/html/rfc7231#section-6.3.1" target="_blank">OK</a>|[Info Object](#tocInfoObject)|
|400|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.1" target="_blank">Bad Request</a>|[Error Object](#tocErrorObject)|
|401|<a href="https://tools.ietf.org/html/rfc7235#section-3.1" target="_blank">Unauthorized</a>|None|
|403|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.3" target="_blank">Forbidden</a>|None|
|404|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.4" target="_blank">Not Found</a>|None|

<a id="divider"></a>

> Code samples

```shell
curl -X GET https://api.chainrider.io/v1/finance/info/ \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Chain-Rider: <TOKEN>'

# Response example
{
  "message": {
    "pairs": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "DASHUSD", "BCHUSD",
              "BTGUSD", "EOSUSD", "TRXUSD", "XMRUSD", "VETUSD",
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
                   "BTGUSD",  "EOSUSD", "TRXUSD", "XMRUSD", "IOTAUSD",
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

```php
<?php
$URL = "https://api.chainrider.io/v1/finance/info/";

$aHTTP['http']['method']  = 'GET';

$aHTTP['http']['header']  = "Content-Type: application/json\r\nAccept: application/json\r\n\r\nChain-Rider: <TOKEN>\r\n";

$context = stream_context_create($aHTTP);

$response = file_get_contents($URL, false, $context);

// Response example
{
  "message": {
    "pairs": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "DASHUSD", "BCHUSD",
              "BTGUSD", "EOSUSD", "TRXUSD", "XMRUSD", "VETUSD",
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
                   "BTGUSD",  "EOSUSD", "TRXUSD", "XMRUSD", "IOTAUSD",
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
?>
```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Chain-Rider': '<TOKEN>'
};

$.ajax({
  url: 'https://api.chainrider.io/v1/finance/info/',
  method: 'get',
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
});

// Response example
{
  "message": {
    "pairs": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "DASHUSD", "BCHUSD",
              "BTGUSD", "EOSUSD", "TRXUSD", "XMRUSD", "VETUSD",
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
                   "BTGUSD",  "EOSUSD", "TRXUSD", "XMRUSD", "IOTAUSD",
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

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type'=>'application/json',
  'Accept'=>'application/json',
  'Chain-Rider' => '<TOKEN>'
}

result = RestClient.get 'https://api.chainrider.io/v1/finance/info/',
         params: {}, headers: headers

p JSON.parse(result)

# Response example
{
  "message": {
    "pairs": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "DASHUSD", "BCHUSD",
              "BTGUSD", "EOSUSD", "TRXUSD", "XMRUSD", "VETUSD",
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
        "BTGUSD": ["Bitfinex", "HitBTC"]
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
                   "BTGUSD",  "EOSUSD", "TRXUSD", "XMRUSD", "IOTAUSD",
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

```python
import requests

headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Chain-Rider': '<TOKEN>'
}

r = requests.get('https://api.chainrider.io/v1/finance/info/',
                  params={}, headers = headers)

print r.json()

# Response example
{
  "message": {
    "pairs": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "DASHUSD", "BCHUSD",
              "BTGUSD", "EOSUSD", "TRXUSD", "XMRUSD", "VETUSD",
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
                   "BTGUSD",  "EOSUSD", "TRXUSD", "XMRUSD", "IOTAUSD",
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

```java
URL obj = new URL("https://api.chainrider.io/v1/finance/info/");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestProperty("Accept", "application/json");
con.setRequestProperty("Content-Type", "application/json");
con.setRequestProperty("Chain-Rider", "<TOKEN>");
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

// Response example
{
  "message": {
    "pairs": ["BTCUSD", "ETHUSD", "ETCUSD", "LTCUSD", "DASHUSD", "BCHUSD",
              "BTGUSD", "EOSUSD", "TRXUSD", "XMRUSD", "VETUSD",
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
                   "BTGUSD",  "EOSUSD", "TRXUSD", "XMRUSD", "IOTAUSD",
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
