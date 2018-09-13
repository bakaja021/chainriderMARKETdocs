# ChainRider Finance

ChainRider offers a powerful set of RESTful APIs to view **real-time information** on cryptocurrency markets.
Our database aggregates up-to-the-second trade data from 10+ exchanges, giving you access to indicators and price feeds that are accurate and reliable.

ChainRider allows you to customize data feeds, selecting which exchanges to include or exclude from a calculation. We generally offer two versions of an indicator or price feed: a **real time** version which accounts for information within the last 24 hours, and a **historical** version to provide insight into previous market trends.

## Functionality

The initial version of **ChainRider Finance** supports the following data feeds:

Market Indicator |  Time Frame | Base URL
-------------    |  --------   | ---------------
[Volume Weighted Average Price](#volume-weighted-average-price), Moving | Real-Time | `https://api.chainrider.io/v1/finance/vwap/realtime/`
[Volume Weighted Average Price](#vwap-historic) | Historic  | `https://api.chainrider.io/v1/finance/vwap/historic/`
[Time Weighted Average Price](#time-weighted-average-price) | R.T. & Historic | `https://api.chainrider.io/v1/finance/twap/historic/`
[Exchange Volume](#market-volume) (e.g. Poloniex, Gemini)| R.T. & Historic | `https://api.chainrider.io/v1/finance/volume/exchange/realtime`
[Pair Volume](#market-volume) (e.g. BTCUSD, ETHUSD)| R.T. & Historic | `https://api.chainrider.io/v1/finance/volume/pair/realtime`

For specific inquiries or general help using ChainRider Finance, please contact us at [support@vizlore.com](mailto:ognjen.ikovic@vizlore.com). We are always open to new ideas or suggestions for improving our service.

## How to Register
In order to use **ChainRider Finance**, you must <a href="https://chainrider.io/register" target="_blank">Register an Account</a> to obtain a unique authentication token (*tokens can be generated through the ChainRider dashboard once logged in*). Registration is free and you can begin using ChainRider right away. However, keep in mind that basic accounts are only given a limited number of API calls (*3,000 per day*).

To upgrade an account to MVP or Production level, please visit our <a href="https://chainrider.io/pricing" target="_blank">Pricing Page</a> to learn more.

## Authentication Token

ChainRider requires an authentication token to access API calls. The token is passed as a parameter to all GET and DELETE requests. For all POST and PUT requests, tokens are added in the request body.

The URL examples throughout this documentation use **`<token>`** as a placeholder. When testing out our examples, substitute **`<token>`** with your unique authentication token.

## Base URL and API Version

The Base URL for all ChainRider API calls is:

  * `https://api.chainrider.io/`

Therefore, if you see `POST /v1/ratelimit/`, then the corresponding API URL would be: `https://api.chainrider.io/v1/ratelimit/`

Currently, only **`v1`** version of ChainRider Finance exists. Any future updates which might introduce conflicts with **`v1`** will result in introducing **`v2`** accordingly. API versioning will ensure backwards compatibility with existing integrations.

## Token Usage

The following API call allows you to check the current status of your authentication token, including usage statistics on an hourly and daily basis.

<h3 id="postCheckToken">POST /v1/ratelimit/ </h3>

<a id="opIdpostCheckToken"></a>

|Parameter|Location|Type|Description|
|---|---|---|---|---|
|token|Body|String|Your unique authentication token.|

<h3 id="response">Response</h3>

|Status|Meaning|Schema|
|---|---|---|
|200|<a href="https://tools.ietf.org/html/rfc7231#section-6.3.1" target="_blank">OK</a>|[TokenUsageObject](#tocTokenUsage)|
|400|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.1" target="_blank">Bad Request</a>|[Error Object](#tocErrorObject)|
|401|<a href="https://tools.ietf.org/html/rfc7235#section-3.1" target="_blank">Unauthorized</a>|None|
|403|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.3" target="_blank">Forbidden</a>|None|
|404|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.4" target="_blank">Not Found</a>|None|

<a id="divider">

> Code samples.

```shell
curl -X POST https://api.chainrider.io/v1/ratelimit/ \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -D '<body_here>'
```

```php

    $body="<body_here>";
    $opts = array('http' =>
      array(
        'method'  => 'POST',
        'header'  => Content-Type: application/json\r\nAccept: application/json\r\n",
        'content' => $body
      )
    );
    $context  = stream_context_create($opts);
    $URL = "https://api.chainrider.io/v1/ratelimit/";
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
};

var requestBody=<body_here>

$.ajax({
  url: 'https://api.chainrider.io/v1/ratelimit/',
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
  'Accept' => 'application/json'
}

result = RestClient.post 'https://api.chainrider.io/v1/ratelimit/',
         payload:<body_here>, headers: headers

p JSON.parse(result)
```

```python
import requests

headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json'
}

r = requests.post('https://api.chainrider.io/v1/ratelimit/',
                  data=<body_here>, params={}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://api.chainrider.io/v1/ratelimit/");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestProperty("Accept", "application/json");
con.setRequestProperty("Content-Type", "application/json");
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

> Body parameter.


```json
{
    "token": "o2IEP1p50pe1jfDtz8osOc7RpWZkwbfp"
}
```

> Example response.

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
