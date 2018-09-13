# Time Weighted Average Price

**TWAP** represents the average price of an asset for a given time. Instead of using volume, **TWAP** tracks the **Typical Price** across all time intervals, and then calculates the rolling average.

**TWAP** is commonly used by algorithmic traders when placing large orders over an extended period of time. This indicator will help ensure market orders are placed near the asset's true market price.
For more information, visit the following <a href="https://en.wikipedia.org/wiki/Time-weighted_average_price" target="_blank">Wikipedia</a> and <a href="https://www.quora.com/Quantitative-Finance-Whats-a-good-tutorial-for-implementing-the-TWAP-Time-weighted-average-price" target="_blank">Quora</a> page.

* `Typical Price: (Open + High + Low + Close) / 4`

* `TWAP: (Sum of Typical Price) / (# of Intervals)`

## TWAP Calculation

This calculation will return an array of intervals, each including a time range, typical price for that time range, and the corresponding **TWAP**. Depending on how you structure the call, a different **TWAP** value could be returned for the same time interval, because **TWAP** is directly tied to the **start_unix** provided.

This indicator is **real-time** by nature. Each subsequent call using the same parameters will return the same number of **intervals_required**, but will incorporate new trade data as time goes on while discarding old trade data (*similar to the Moving VWAP calculation*).

<h3 id="postTwapPairRealtime">POST /v1/finance/volume/twap/realtime/ ??? </h3>

<a id="opIdpostTwapPairRealtime"></a>

|Parameter|In|Type|Description|
|---|---|---|---|
|pair|body|String|The digital asset to calculate TWAP for. See [Supported Pairs](#supported-pairs-and-exchanges)
|interval|body|Integer|Interval duration in minutes, accepted values include: `1, 5, 10, 15, 30, 60`
|intervals_required|body|Integer|Number of intervals required. See [Info Object](#tocInfoObject)
|start_unix|body|Integer|Start time in seconds. See <a href="https://www.unixtimestamp.com/" target="_blank">Unix Timestamp</a>
|Chain-Rider|Headers|String|Your unique authentication token.

<h3 id="response">Response</h3>

|Status|Meaning|Schema|
|---|---|---|
|200|<a href="https://tools.ietf.org/html/rfc7231#section-6.3.1" target="_blank">OK</a>|[TWAP Object](#schemetwapobject)|
|400|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.1" target="_blank">Bad Request</a>|[Error Object](#tocErrorObject)|
|401|<a href="https://tools.ietf.org/html/rfc7235#section-3.1" target="_blank">Unauthorized</a>|None|
|403|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.3" target="_blank">Forbidden</a>|None|
|404|<a href="https://tools.ietf.org/html/rfc7231#section-6.5.4" target="_blank">Not Found</a>|None|

<a id="divider"></a>

> Code samples

```shell
curl -X POST https://api.chainrider.io/v1/finance/twap/realtime/\
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
    $URL = "https://api.chainrider.io/v1/finance/twap/realtime/";
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
  url: 'https://api.chainrider.io/v1/finance/twap/realtime/',
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

result = RestClient.post 'https://api.chainrider.io/v1/finance/twap/realtime/',
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

r = requests.post('https://api.chainrider.io/v1/finance/twap/realtime/',
                  data=<body_here>, params={}, headers = headers)

print r.json()
```

```java
URL obj = new URL("https://api.chainrider.io/v1/finance/twap/realtime/");
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
 	"pair": "ETCUSD",
	"interval": 60,
	"intervals_required": 10,
	"unix_start": 1536306456
 }
```

> Example response

```json
{
    "message": {
        "1536306480": {
            "typical_price": 11.75,
            "twap": 11.75
        }
    }
}
```
