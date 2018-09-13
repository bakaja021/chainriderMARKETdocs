# Volume Weighted Average Price

**VWAP** represents the average price of an asset, for the given time range. Commonly referred to as **Moving VWAP** for real time calculations, this indicator provides an accurate price discovery mechanism for shorter time durations (*1-minute or 5-minutes*). For longer time durations, **VWAP** reflects whether or not an entry price or exit price was profitable, relative to the average market price at the time.

For more info, see the following Investopedia articles: <a href="https://www.investopedia.com/terms/v/vwap.asp" target="_blank">Definition</a> and <a href="https://www.investopedia.com/ask/answers/031115/why-volume-weighted-average-price-vwap-important-traders-and-analysts.asp" target="_blank">Importance of VWAP</a>


## Moving VWAP - Realtime

Calculate the **Moving VWAP** for the last "X" seconds, ranging from 1 to 86,400 seconds (*up to a maximum of 24 hours*).

With each subsequent API call (*using the same parameters*), you will receive a different MVWAP calculation that includes any recent trades within the last "X" seconds. This means that any trades older than "X" seconds are discarded, even if they were included in the previous call, thus creating a **Moving VWAP** calculation.


<h3 id="postVWAPRealtime">POST /v1/finance/vwap/realtime/ </h3>

<a id="opIdpostVWAPRealtime"></a>

|Parameter|In|Type|Description|
|---|---|---|---|
|pair|Body|String|The digital asset pair to calculate MVWAP for. See [Supported Pairs](#supported-pairs-and-exchanges)
|seconds|Body|Integer|Number of seconds in the past to consider, ranging from 1 to 86,400 seconds.
|analytics|Body|Boolean|Provides the total number of data points used for each exchange, when set to **`True`**. Setting this to **`False`** will optimize response time.
|exchanges|Body|Array of Strings|Exchanges to include in the calculation. See [Supported Exchanges](#supported-pairs-and-exchanges)
|Chain-Rider|Headers|String|Your unique authentication token.|

<h3 id="response">Response</h3>

|Status|Meaning|Schema|
|---|---|---|
|200|<a href="https://tools.ietf.org/html/rfc7231#section-6.3.1" target="_blank">OK</a>|[VWAP Object](#tocVWAPObject)|
|400|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.1" target="_blank">Bad Request</a>|[Error Object](#tocErrorObject)|
|401|<a href="https://tools.ietf.org/html/rfc7235#section-3.1" target="_blank">Unauthorized</a>|None|
|403|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.3" target="_blank">Forbidden</a>|None|
|404|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.4" target="_blank">Not Found</a>|None|

<a id="divider"></a>

> Code samples

```shell
curl -X POST https://api.chainrider.io/v1/finance/vwap/realtime/ \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Chain-Rider: <TOKEN>' \
  -D '<body_here>'
```

```php
<?php
    $body="<body_here>";
    $opts = array('http' =>
      array(
        'method'  => 'POST',
        'header'  => Content-Type: application/json\r\nAccept: application/json\r\nChain-Rider: <TOKEN>\r\n",
        'content' => $body
      )
    );
    $context  = stream_context_create($opts);
    $URL = "https://api.chainrider.io/v1/finance/vwap/realtime/";
    $result = file_get_contents($url, false, $context, -1, 40000);
);


$context = stream_context_create($aHTTP);
    $response = file_get_contents($URL, false, $context);
?>

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Chain-Rider': '<TOKEN>'
};

var requestBody=<body_here>

$.ajax({
  url: 'https://api.chainrider.io/v1/finance/vwap/realtime/',
  method: 'POST',
  headers: headers,
  data: requestBody,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Chain-Rider' => '<TOKEN>'
}

result = RestClient.post 'https://api.chainrider.io/v1/finance/vwap/realtime/',
         payload:<body_here>, headers: headers

p JSON.parse(result)
```

```python
import requests

headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Chain-Rider': '<TOKEN>'
}

r = requests.post('https://api.chainrider.io/v1/finance/vwap/realtime/',
                  data=<body_here>, params={}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://api.chainrider.io/v1/finance/vwap/realtime/");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestProperty("Accept", "application/json");
con.setRequestProperty("Content-Type", "application/json");
con.setRequestProperty("Chain-Rider", "<TOKEN>");
con.setDoOutput(true);
con.setRequestMethod("POST");
OutputStream os = con.getOutputStream();
OutputStreamWriter osw = new OutputStreamWriter(os, "UTF-8");
osw.write("<body_here>");
osw.flush();
osw.close();
os.close();  //don't forget to close the OutputStream
httpCon.connect();


//read the inputstream and print it
String result;
BufferedInputStream bis = new BufferedInputStream(con.getInputStream());
ByteArrayOutputStream buf = new ByteArrayOutputStream();
int result2 = bis.read();
while(result2 != -1) {
    buf.write((byte) result2);
    result2 = bis.read();
}
result = buf.toString();
System.out.println(result);
```

> Body parameter


```json
{
 	"pair": "DASHUSD",
 	"seconds": 1000,
 	"analytics": true,
 	"exchanges": ["Bitfinex", "HitBTC", "Huobi", "Kraken", "Poloniex"]
 }
```

> Example response

```json
{
    "message": {
        "pair": "DASHUSD",
        "upper_unix": 1535987905,
        "lower_unix": 1535986905,
        "vwap": 210.19,
        "analytics": {
            "data_points": 219,
            "exchange_data": {
                "Bitfinex": 4,
                "HitBTC": 24,
                "Huobi": 189,
                "Kraken": 2,
                "Poloniex": 0
            }
        }
    }
}
```

## VWAP - Historical

When calculating VWAP for time durations longer than 24 hours, or for a specific time range such as 2:00 AM to 3:00 AM, use the **Historical VWAP** calcuation.

VWAP parameters are almost identical to MVWAP, except that you must specify an **upper_unix** and a **lower_unix** to indicate which time range to calculate the VWAP for.

<h3 id="postVWAPHistory">POST /v1/finance/vwap/historic/ </h3>

<a id="opIdpostVWAPHistoric"></a>

|Parameter|In|Type|Description|
|---|---|---|---|
|pair|Body|String|The digital asset to calculate MVWAP for. See [Supported Pairs](#supported-pairs-and-exchanges)
|upper_unix|Body|Integer|Upper unix timestamp in seconds. See <a href="https://www.unixtimestamp.com/" target="_blank">Unix Timestamp</a>
|lower_unix|Body|Integer|Lower unix timestamp in seconds.
|analytics|Body|Boolean|Returns the number of data points gathered from each exchange if set to **`True`**. Setting this to **`False`** will optimize API response time.
|exchanges|Body|Array of Strings|Exchanges to include in the calculation. See [Supported Exchanges](#supported-pairs-and-exchanges)
|Chain-Rider|Headers|String|Your unique authentication token.|

<h3 id="response">Response</h3>

|Status|Meaning|Schema|
|---|---|---|
|200|<a href="https://tools.ietf.org/html/rfc7231#section-6.3.1" target="_blank">OK</a>|[VWAP Object](#tocVWAPObject)|
|400|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.1" target="_blank">Bad Request</a>|[Error Object](#tocErrorObject)|
|401|<a href="https://tools.ietf.org/html/rfc7235#section-3.1" target="_blank">Unauthorized</a>|None|
|403|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.3" target="_blank">Forbidden</a>|None|
|404|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.4" target="_blank">Not Found</a>|None|

<a id="divider"></a>

> Code samples

```shell
curl -X POST https://api.chainrider.io/v1/finance/vwap/historic/ \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Chain-Rider: <TOKEN>' \
  -D '<body_here>'
```

```php
<?php
    $body="<body_here>";
    $opts = array('http' =>
      array(
        'method'  => 'POST',
        'header'  => Content-Type: application/json\r\nAccept: application/json\r\nChain-Rider: <TOKEN>\r\n",
        'content' => $body
      )
    );
    $context  = stream_context_create($opts);
    $URL = "https://api.chainrider.io/v1/finance/vwap/historic/";
    $result = file_get_contents($url, false, $context, -1, 40000);
);


$context = stream_context_create($aHTTP);
    $response = file_get_contents($URL, false, $context);
?>

```

```javascript
var headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'Chain-Rider': '<TOKEN>'
};

var requestBody=<body_here>

$.ajax({
  url: 'https://api.chainrider.io/v1/finance/vwap/historic/',
  method: 'POST',
  headers: headers,
  data: requestBody,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})
```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'Chain-Rider' => '<TOKEN>'
}

result = RestClient.post 'https://api.chainrider.io/v1/finance/vwap/historic/',
         payload:<body_here>, headers: headers

p JSON.parse(result)
```

```python
import requests

headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Chain-Rider': '<TOKEN>'
}

r = requests.post('https://api.chainrider.io/v1/finance/vwap/historic/',
                  data=<body_here>, params={}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://api.chainrider.io/v1/finance/vwap/historic/");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestProperty("Accept", "application/json");
con.setRequestProperty("Content-Type", "application/json");
con.setRequestProperty("Chain-Rider", "<TOKEN>");
con.setDoOutput(true);
con.setRequestMethod("POST");
OutputStream os = con.getOutputStream();
OutputStreamWriter osw = new OutputStreamWriter(os, "UTF-8");
osw.write("<body_here>");
osw.flush();
osw.close();
os.close();  //don't forget to close the OutputStream
httpCon.connect();


//read the inputstream and print it
String result;
BufferedInputStream bis = new BufferedInputStream(con.getInputStream());
ByteArrayOutputStream buf = new ByteArrayOutputStream();
int result2 = bis.read();
while(result2 != -1) {
    buf.write((byte) result2);
    result2 = bis.read();
}
result = buf.toString();
System.out.println(result);
```

> Body parameter


```json
{
 	"pair": "BTCUSD",
 	"upper_unix": 1535466227,
 	"lower_unix": 1535466002,
 	"analytics": true,
 	"exchanges": ["Bitfinex", "Kucoin", "Binance"]
 }
```

> Example response

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
