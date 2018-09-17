# Market Volume

There are four different tools available for viewing market volume across different exchanges:

 * A [real-time](#asset-volume-realtime) and [historical](#asset-volume-historic) volume for specific asset pairs. `BTCUSD, ETHUSD, ETCUSD, LTCUSD, DASHUSD`
 * A [real-time](#exchange-volume-realtime) and [historical](#exchange-volume-historic) volume for specific exchanges. `Kraken, Poloniex, Binance, etc.`

Values returned indicate the amount of cryptocurrency traded. For example, `"BTCUSD": 1.52` indicates 1.52 BTC were either bought or sold for a given time period.

## Asset Volume - Realtime

Retrieve the volume of a specific asset pair across all supported exchanges, for the last "X" seconds.

<h3 id="postVolumePairRealtime">POST /v1/finance/volume/pair/realtime/</h3>

<a id="opIdpostVolumePairRealtime"></a>

|Parameter|In|Type|Description|
|---|---|---|---|
|pair|Body|String|The digital asset pair to retrieve volume for. See [Supported Pairs](#supported-pairs-and-exchanges)
|seconds|Body|Integer|Number of seconds to retrieve volume for. Minimum value is 1, maximum value is 86,400 (exactly 24 hours).
|Chain-Rider|Headers|String|Your unique authentication token.|

<h3 id="response">Response</h3>

|Status|Meaning|Schema|
|---|---|---|
|200|<a href="https://tools.ietf.org/html/rfc7231#section-6.3.1" target="_blank">OK</a>|[Volume Pair Object](#tocVolumePairObject)|
|400|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.1" target="_blank">Bad Request</a>|[Error Object](#tocErrorObject)|
|401|<a href="https://tools.ietf.org/html/rfc7235#section-3.1" target="_blank">Unauthorized</a>|None|
|403|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.3" target="_blank">Forbidden</a>|None|
|404|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.4" target="_blank">Not Found</a>|None|

<a id="divider"></a>

> Code samples

```shell
curl -X POST https://api.chainrider.io/v1/finance/volume/pair/realtime/\
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
    $URL = "https://api.chainrider.io/v1/finance/volume/pair/realtime/";
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
  url: 'https://api.chainrider.io/v1/finance/volume/pair/realtime/',
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

result = RestClient.post 'https://api.chainrider.io/v1/finance/volume/pair/realtime/',
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

r = requests.post('https://api.chainrider.io/v1/finance/volume/pair/realtime/',
                  json=<body_here>, params={}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://api.chainrider.io/v1/finance/volume/pair/realtime/");
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
 "seconds": 1000,
 "pair": "BTCUSD"
}
```

> Example response

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

## Asset Volume - Historic

Retrieve the historical volume of an asset pair across all supported exchanges. You must specify a time interval between **upper_unix** and **lower_unix**.

<h3 id="postVolumePairHistoric">POST /v1/finance/volume/pair/historic/</h3>

<a id="opIdpostVolumePairHistoric"></a>

*Get historic information about a volume for a given pair across all supported exchanges*

|Parameter|In|Type|Description|
|---|---|---|---|
|pair|Body|String|The digital asset pair to retrieve volume for. See [Supported Pairs](#supported-pairs-and-exchanges)
|upper_unix|Body|Integer|Upper time range in seconds. See <a href="https://www.unixtimestamp.com/" target="_blank">Unix Timestamp</a>
|lower_unix|Body|Integer|Lower time range in seconds.
|Chain-Rider|Headers|String|Your unique authentication token.|

<h3 id="response">Response</h3>

|Status|Meaning|Schema|
|---|---|---|
|200|<a href="https://tools.ietf.org/html/rfc7231#section-6.3.1" target="_blank">OK</a>|[Volume Pair Object](#tocVolumePairObject)|
|400|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.1" target="_blank">Bad Request</a>|[Error Object](#tocErrorObject)|
|401|<a href="https://tools.ietf.org/html/rfc7235#section-3.1" target="_blank">Unauthorized</a>|None|
|403|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.3" target="_blank">Forbidden</a>|None|
|404|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.4" target="_blank">Not Found</a>|None|

<a id="divider"></a>

> Code samples

```shell
curl -X POST https://api.chainrider.io/v1/finance/volume/pair/historic/\
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
    $URL = "https://api.chainrider.io/v1/finance/volume/pair/historic/";
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
  url: 'https://api.chainrider.io/v1/finance/volume/pair/historic/',
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

result = RestClient.post 'https://api.chainrider.io/v1/finance/volume/pair/historic/',
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

r = requests.post('https://api.chainrider.io/v1/finance/volume/pair/historic/',
                  json=<body_here>, params={}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://api.chainrider.io/v1/finance/volume/pair/historic/");
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
 "upper_unix": 1535466227,
 "lower_unix": 1535466002,
 "pair": "BTCUSD"
}
```

> Example response

```json
{
    "message": {
        "pair": "BTCUSD",
        "volume_data": {
            "Binance": 102.4649,
            "Bitfinex": 61.1467,
            "Bitstamp": 14.7418,
            "Coinbase": 14.2054,
            "Gemini": 12.3009,
            "HitBTC": 5.36,
            "Huobi": 74.229,
            "Kraken": 26.8009,
            "Kucoin": 0.1383,
            "Poloniex": 0.4425
        },
        "upper_unix": 1535466227,
        "lower_unix": 1535466002
    }
}
```

## Exchange Volume - Realtime

Retrieve the volume on a specific exchange for all supported asset pairs, for the last "X" seconds.

<h3 id="postVolumeRealtime">POST /v1/finance/volume/exchange/realtime/</h3>

<a id="opIdpostVolumeRealtime"></a>

|Parameter|In|Type|Description|
|---|---|---|---|
|exchange|body|String|Exchange to retrieve volume for. See [Supported Exchanges](#supported-pairs-and-exchanges)
|seconds|Body|Integer|Number of seconds to retrieve volume for. Minimum value is 1, maximum value is 86,400 (exactly 24 hours).
|Chain-Rider|Headers|String|Your unique authentication token.|

<h3 id="response">Response</h3>

|Status|Meaning|Schema|
|---|---|---|
|200|<a href="https://tools.ietf.org/html/rfc7231#section-6.3.1" target="_blank">OK</a>|[Volume Exchange Object](#tocVolumeExchangeObject)|
|400|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.1" target="_blank">Bad Request</a>|[Error Object](#tocErrorObject)|
|401|<a href="https://tools.ietf.org/html/rfc7235#section-3.1" target="_blank">Unauthorized</a>|None|
|403|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.3" target="_blank">Forbidden</a>|None|
|404|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.4" target="_blank">Not Found</a>|None|

<a id="divider"></a>

> Code samples

```shell
curl -X POST https://api.chainrider.io/v1/finance/volume/exchange/realtime/ \
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
    $URL = "https://api.chainrider.io/v1/finance/volume/exchange/realtime/";
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
  url: 'https://api.chainrider.io/v1/finance/volume/exchange/realtime/',
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

result = RestClient.post 'https://api.chainrider.io/v1/finance/volume/exchange/realtime/',
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

r = requests.post('https://api.chainrider.io/v1/finance/volume/exchange/realtime/',
                  json=<body_here>, params={}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://api.chainrider.io/v1/finance/volume/exchange/realtime/");
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
 	"seconds": 100,
 	"exchange": "Kraken"
 }
```

> Example response

```json
{
    "message": {
        "exchange": "Kraken",
        "volume_data": {
            "BTCUSD": 0.06,
            "ETHUSD": 0,
            "ETCUSD": 0,
            "LTCUSD": 0,
            "DASHUSD": 0.03
        },
        "upper_unix": 1536058383,
        "lower_unix": 1536058283
    }
}
```

## Exchange Volume - Historic

Retrieve the historical volume on an exchange for all supported asset pairs. You must specify a time interval between **upper_unix** and **lower_unix**.

<h3 id="postVolumeHistoric">POST /v1/finance/volume/exchange/historic/</h3>

<a id="opIdpostVolumeHistoric"></a>

*Get historic information about a volume at corresponding exchange*

|Parameter|In|Type|Description|
|---|---|---|---|
|exchange|body|String|Exchange to retrieve volume for. See [Supported Exchanges](#supported-pairs-and-exchanges)
|upper_unix|Body|Integer|Upper time range in seconds. See <a href="https://www.unixtimestamp.com/" target="_blank">Unix Timestamp</a>
|lower_unix|Body|Integer|Lower time range in seconds.
|Chain-Rider|Headers|String|Your unique authentication token.|

<h3 id="response">Response</h3>

|Status|Meaning|Schema|
|---|---|---|
|200|<a href="https://tools.ietf.org/html/rfc7231#section-6.3.1" target="_blank">OK</a>|[Volume Exchange Object](#tocVolumeExchangeObject)|
|400|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.1" target="_blank">Bad Request</a>|[Error Object](#tocErrorObject)|
|401|<a href="https://tools.ietf.org/html/rfc7235#section-3.1" target="_blank">Unauthorized</a>|None|
|403|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.3" target="_blank">Forbidden</a>|None|
|404|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.4" target="_blank">Not Found</a>|None|

<a id="divider"></a>

> Code samples

```shell
curl -X POST https://api.chainrider.io/v1/finance/volume/exchange/historic/ \
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
    $URL = "https://api.chainrider.io/v1/finance/volume/exchange/historic/";
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
  url: 'https://api.chainrider.io/v1/finance/volume/exchange/historic/',
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

result = RestClient.post 'https://api.chainrider.io/v1/finance/volume/exchange/historic/',
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

r = requests.post('https://api.chainrider.io/v1/finance/volume/exchange/historic/',
                  json=<body_here>, params={}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://api.chainrider.io/v1/finance/volume/exchange/historic/");
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
 	"upper_unix": 1535466227,
 	"lower_unix": 1535466026,
 	"exchange": "Bitfinex"
 }
```

> Example response

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
