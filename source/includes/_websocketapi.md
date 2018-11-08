# Websocket API

ChainRider provides option for streaming real time information about **Moving VWAP** via web sockets. Websockets are commonly used for client side applications for instant update of mobile or web UI displaying real time crypto currency price charts.

The base URL for accessing websocket APIs is: `wss://websocketapi.chainrider.io/ws/private/vwap/`
In a single connection, you can specify one or more [supported pairs](#supported-pairs) and exactly one [supported interval](#supported-websocket-intervals) to receive real time updates on moving VWAP. Regardless of the interval specified, you will receive updates every 30s.

## WebSocket Moving VWAP

<h3 id="opIdVWAPSocketsHeader">wss://websocketapi.chainrider.io/ws/private/vwap/ </h3>

<a id="opIdVWAPSockets"></a>

Calculate the **Moving VWAP** for specified interval and pairs. Streams can be access either in a single raw stream or a combined stream, meaning you can specify one or multiple pairs for a given interval and you will receive stream of results for all provided pairs.

|Parameter|In|Type|Description|
|---|---|---|---|
|pairs|query|String|List of pairs separated with forward-slash `/`. In case only one pair is requested, `/` should be omitted. See [Supported Pairs](#supported-pairs)|
|interval|query|String|Interval for which you would like to receive stream updates. See [Supported Websocket Intervals](#supported-websocket-intervals)|
|token|query|String|Your unique Chain-Rider authentication token.|

<h3 id="response">Response</h3>

|Event|Schema|
|---|---|---|
|Connection successful|[WebSocket Welcome Object](#tocWebsocketWelcomeObject)|
|Data streaming|[WebSocket VWAP Object](#tocWebsocketVWAPObject)|
|Connection error|[WebSocket Error Object](#tocWebSocketErrorObject)|

<a id="divider"></a>

> Code samples

```shell
websocat wss://websocketapi.chainrider.io/ws/private/vwap/?interval=1m&pairs=BTCUSD/ETHUSD/LTCUSD/DASHUSD&token=<TOKEN>
```

```php
<?php

require 'vendor/autoload.php';
use WSSC\WebSocketClient;
use \WSSC\Components\ClientConfig;

$client = new WebSocketClient('wss://websocketapi.chainrider.io/ws/private/vwap/?interval=1m&pairs=BTCUSD/ETHUSD/ETCUSD/LTCUSD/DASHUSD/BCHUSD/BTGUSD&token=<TOKEN>', new ClientConfig());


while(true){
    try{
        echo $client->receive();
        sleep(5);
    }catch (Exception $e) {
        print("exception");
        continue;
    }
}
?>
```

```javascript
function WebSocketTest() {

    if ("WebSocket" in window) {
        alert("WebSocket is supported by your Browser!");
       // Let us open a web socket
       var ws = new WebSocket("wss://websocketapi.chainrider.io/ws/private/vwap/?interval=1m&pairs=BTCUSD/ETHUSD/LTCUSD/DASHUSD&token=<TOKEN>");

       ws.onopen = function(evt) {
          // Connection open
       };

       ws.onmessage = function (evt) {
          var received_msg = evt.data;
          // Data received, do stuff.
          console.log(received_msg);
       };

       ws.onclose = function() {  
          // websocket is closed.
          alert("Connection is closed...");
       };
    } else {
       // The browser doesn't support WebSocket
       alert("WebSocket NOT supported by your Browser!");
    }
 }
```

```ruby
require 'rubygems'
require 'websocket-client-simple'

ws = WebSocket::Client::Simple.connect 'wss://websocketapi.chainrider.io/ws/private/vwap/?interval=1m&pairs=BTCUSD/ETHUSD/LTCUSD/DASHUSD&token=<TOKEN>'

ws.on :message do |msg|
  puts msg.data
end

ws.on :open do
  puts "Opened"
end

ws.on :close do |e|
  p e
  exit 1
end

ws.on :error do |e|
  p e
end

loop do
  ws.send STDIN.gets.strip
end
```

```python
import websocket

def on_message(ws, message):
    print(message)

def on_error(ws, error):
    print(error)

def on_close(ws):
    print("### closed ###")

def on_open(ws):
    print("### opened ###")

if __name__ == "__main__":
    websocket.enableTrace(True)
    ws = websocket.WebSocketApp("wss://websocketapi.chainrider.io/ws/private/vwap/?interval=1m&pairs=BTCUSD/ETHUSD/LTCUSD/DASHUSD&token=<TOKEN>",
      on_message = on_message,
      on_error = on_error,
      on_close = on_close
    )
    ws.on_open = on_open
    ws.run_forever()
```

```java
package ws.client.example;

import org.eclipse.jetty.websocket.api.Session;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketClose;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketConnect;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketMessage;
import org.eclipse.jetty.websocket.api.annotations.WebSocket;
import org.eclipse.jetty.websocket.client.ClientUpgradeRequest;
import org.eclipse.jetty.websocket.client.WebSocketClient;

import java.net.URI;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class Main {
    public static void main(String[] args) {
        String destUri = "wss://websocketapi.chainrider.io/ws/private/vwap/?interval=1m&pairs=BTCUSD/ETHUSD/ETCUSD/LTCUSD/DASHUSD/BCHUSD/BTGUSD&token=<TOKEN>";

        WebSocketClient client = new WebSocketClient();
        WSClient socket = new Main.WSClient();
        try {
            client.start();

            URI echoUri = new URI(destUri);
            ClientUpgradeRequest request = new ClientUpgradeRequest();
            client.connect(socket, echoUri, request);
            System.out.printf("Connecting to : %s%n", echoUri);
            // wait for closed socket connection.
            while (true) {
                Thread.sleep(100);
            }

        } catch (Throwable t) {
            t.printStackTrace();
        } finally {
            try {
                client.stop();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @WebSocket(maxTextMessageSize = 64 * 1024)
    public static class WSClient {
        private final CountDownLatch closeLatch;

        @SuppressWarnings("unused")
        private Session session;

        public WSClient() {
            this.closeLatch = new CountDownLatch(1);
        }

        public boolean awaitClose(int duration, TimeUnit unit) throws InterruptedException {
            return this.closeLatch.await(duration, unit);
        }

        @OnWebSocketClose
        public void onClose(int statusCode, String reason) {
            System.out.printf("Connection closed: %d - %s%n", statusCode, reason);
            this.session = null;
            this.closeLatch.countDown(); // trigger latch
        }

        @OnWebSocketConnect
        public void onConnect(Session session) {
            System.out.printf("Got connect: %s%n", session);
            this.session = session;
            try {

            } catch (Throwable t) {
                t.printStackTrace();
            }
        }

        public void closeSession() {
            if (session != null) {
                this.session.close();
            }
        }

        @OnWebSocketMessage
        public void onMessage(String msg) {
            System.out.printf("Got msg: %s%n", msg);
        }
    }
}
```

> Example response

```json
{
  "message": [
      {"pair": "BTCUSD", "lower_unix": 1541066704, "upper_unix": 1541066764, "vwap": 6367.78, "difference": 0.21},
      {"pair": "ETHUSD", "lower_unix": 1541066704, "upper_unix": 1541066764, "vwap": 198.48, "difference": 0.01},
      {"pair": "LTCUSD", "lower_unix": 1541066704, "upper_unix": 1541066764, "vwap": 50.02, "difference": -0.02},
      {"pair": "DASHUSD", "lower_unix": 1541066704, "upper_unix": 1541066764, "vwap": 152.92, "difference": 0.03}
  ]
}
```


## Websockets exemplified

Let's say that we need BTC price real time updates for last hour. In order to access websocket stream, our final websocket URI will be:

`wss://websocketapi.chainrider.io/ws/private/vwap/?pairs=BTCUSD&interval=1h&token=<YOUR_CHAINRIDER_TOKEN>`

When the connection with ChainRider websocket server is established, we will receive BTC price (Moving VWAP) for the last hour every 30 seconds.

Let's look at another example where we want to receive updates for more than one pair (i.e. BTC, DASH and ETH) for an interval of last 10 minutes. In that case, our final websocket URI would be:

`wss://websocketapi.chainrider.io/ws/private/vwap/?pairs=BTCUSD/DASHUSD/ETHUSD&interval=10m&token=<YOUR_CHAINRIDER_TOKEN>`

Again, we will receive updates every 30s but the provided results would be VWAP price of BTC, DASH and ETH for last 10 minutes.


<a id="divider"></a>

> Example 1

```shell
websocat wss://websocketapi.chainrider.io/ws/private/vwap/?interval=1h&pairs=BTCUSD&token=<TOKEN>
```

```php
<?php

require 'vendor/autoload.php';
use WSSC\WebSocketClient;
use \WSSC\Components\ClientConfig;

$client = new WebSocketClient('wss://websocketapi.chainrider.io/ws/private/vwap/?interval=1h&pairs=BTCUSD&token=<TOKEN>', new ClientConfig());


while(true){
    try{
        echo $client->receive();
        sleep(5);
    }catch (Exception $e) {
        print("exception");
        continue;
    }
}
?>
```

```javascript
function WebSocketTest() {

    if ("WebSocket" in window) {
        alert("WebSocket is supported by your Browser!");
       // Let us open a web socket
       var ws = new WebSocket("wss://websocketapi.chainrider.io/ws/private/vwap/?interval=1h&pairs=BTCUSD&token=<TOKEN>");

       ws.onopen = function(evt) {
          // Connection open
       };

       ws.onmessage = function (evt) {
          var received_msg = evt.data;
          // Data received, do stuff.
          console.log(received_msg);
       };

       ws.onclose = function() {  
          // websocket is closed.
          alert("Connection is closed...");
       };
    } else {
       // The browser doesn't support WebSocket
       alert("WebSocket NOT supported by your Browser!");
    }
 }
```

```ruby
require 'rubygems'
require 'websocket-client-simple'

ws = WebSocket::Client::Simple.connect 'wss://websocketapi.chainrider.io/ws/private/vwap/?interval=1h&pairs=BTCUSD&token=<TOKEN>'

ws.on :message do |msg|
  puts msg.data
end

ws.on :open do
  puts "Opened"
end

ws.on :close do |e|
  p e
  exit 1
end

ws.on :error do |e|
  p e
end

loop do
  ws.send STDIN.gets.strip
end
```

```python
import websocket

def on_message(ws, message):
    print(message)

def on_error(ws, error):
    print(error)

def on_close(ws):
    print("### closed ###")

def on_open(ws):
    print("### opened ###")

if __name__ == "__main__":
    websocket.enableTrace(True)
    ws = websocket.WebSocketApp("wss://websocketapi.chainrider.io/ws/private/vwap/?interval=1h&pairs=BTCUSD&token=<TOKEN>",
      on_message = on_message,
      on_error = on_error,
      on_close = on_close
    )
    ws.on_open = on_open
    ws.run_forever()
```

```java
package ws.client.example;

import org.eclipse.jetty.websocket.api.Session;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketClose;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketConnect;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketMessage;
import org.eclipse.jetty.websocket.api.annotations.WebSocket;
import org.eclipse.jetty.websocket.client.ClientUpgradeRequest;
import org.eclipse.jetty.websocket.client.WebSocketClient;

import java.net.URI;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class Main {
    public static void main(String[] args) {
        String destUri = "wss://websocketapi.chainrider.io/ws/private/vwap/?interval=1h&pairs=BTCUSD&token=<TOKEN>";

        WebSocketClient client = new WebSocketClient();
        WSClient socket = new Main.WSClient();
        try {
            client.start();

            URI echoUri = new URI(destUri);
            ClientUpgradeRequest request = new ClientUpgradeRequest();
            client.connect(socket, echoUri, request);
            System.out.printf("Connecting to : %s%n", echoUri);
            // wait for closed socket connection.
            while (true) {
                Thread.sleep(100);
            }

        } catch (Throwable t) {
            t.printStackTrace();
        } finally {
            try {
                client.stop();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @WebSocket(maxTextMessageSize = 64 * 1024)
    public static class WSClient {
        private final CountDownLatch closeLatch;

        @SuppressWarnings("unused")
        private Session session;

        public WSClient() {
            this.closeLatch = new CountDownLatch(1);
        }

        public boolean awaitClose(int duration, TimeUnit unit) throws InterruptedException {
            return this.closeLatch.await(duration, unit);
        }

        @OnWebSocketClose
        public void onClose(int statusCode, String reason) {
            System.out.printf("Connection closed: %d - %s%n", statusCode, reason);
            this.session = null;
            this.closeLatch.countDown(); // trigger latch
        }

        @OnWebSocketConnect
        public void onConnect(Session session) {
            System.out.printf("Got connect: %s%n", session);
            this.session = session;
            try {

            } catch (Throwable t) {
                t.printStackTrace();
            }
        }

        public void closeSession() {
            if (session != null) {
                this.session.close();
            }
        }

        @OnWebSocketMessage
        public void onMessage(String msg) {
            System.out.printf("Got msg: %s%n", msg);
        }
    }
}
```

> Example1 response

```json
{
  "message": [
      {"pair": "BTCUSD", "lower_unix": 1541069810, "upper_unix": 1541073410, "vwap": 6357.96, "difference": 0.01}
  ]
}
```


> Example 2

```shell
websocat wss://websocketapi.chainrider.io/ws/private/vwap/?interval=10m&pairs=BTCUSD/DASHUSD/ETHUSD&token=<TOKEN>
```

```php
<?php

require 'vendor/autoload.php';
use WSSC\WebSocketClient;
use \WSSC\Components\ClientConfig;

$client = new WebSocketClient('wss://websocketapi.chainrider.io/ws/private/vwap/?interval=10m&pairs=BTCUSD/ETHUSD/DASHUSD&token=<TOKEN>', new ClientConfig());


while(true){
    try{
        echo $client->receive();
        sleep(5);
    }catch (Exception $e) {
        print("exception");
        continue;
    }
}
?>
```

```javascript
function WebSocketTest() {

    if ("WebSocket" in window) {
        alert("WebSocket is supported by your Browser!");
       // Let us open a web socket
       var ws = new WebSocket("wss://websocketapi.chainrider.io/ws/private/vwap/?interval=10m&pairs=BTCUSD/DASHUSD/ETHUSD&token=<TOKEN>");

       ws.onopen = function(evt) {
          // Connection open
       };

       ws.onmessage = function (evt) {
          var received_msg = evt.data;
          // Data received, do stuff.
          console.log(received_msg);
       };

       ws.onclose = function() {  
          // websocket is closed.
          alert("Connection is closed...");
       };
    } else {
       // The browser doesn't support WebSocket
       alert("WebSocket NOT supported by your Browser!");
    }
 }
```

```ruby
require 'rubygems'
require 'websocket-client-simple'

ws = WebSocket::Client::Simple.connect 'wss://websocketapi.chainrider.io/ws/private/vwap/?interval=10m&pairs=BTCUSD/DASHUSD/ETHUSD&token=<TOKEN>'

ws.on :message do |msg|
  puts msg.data
end

ws.on :open do
  puts "Opened"
end

ws.on :close do |e|
  p e
  exit 1
end

ws.on :error do |e|
  p e
end

loop do
  ws.send STDIN.gets.strip
end
```

```python
import websocket

def on_message(ws, message):
    print(message)

def on_error(ws, error):
    print(error)

def on_close(ws):
    print("### closed ###")

def on_open(ws):
    print("### opened ###")

if __name__ == "__main__":
    websocket.enableTrace(True)
    ws = websocket.WebSocketApp("wss://websocketapi.chainrider.io/ws/private/vwap/?interval=10m&pairs=BTCUSD/DASHUSD/ETHUSD&token=<TOKEN>",
      on_message = on_message,
      on_error = on_error,
      on_close = on_close
    )
    ws.on_open = on_open
    ws.run_forever()
```

```java
package ws.client.example;

import org.eclipse.jetty.websocket.api.Session;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketClose;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketConnect;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketMessage;
import org.eclipse.jetty.websocket.api.annotations.WebSocket;
import org.eclipse.jetty.websocket.client.ClientUpgradeRequest;
import org.eclipse.jetty.websocket.client.WebSocketClient;

import java.net.URI;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class Main {
    public static void main(String[] args) {
        String destUri = "wss://websocketapi.chainrider.io/ws/private/vwap/?interval=10m&pairs=BTCUSD/ETHUSD/DASHUSD&token=<TOKEN>";

        WebSocketClient client = new WebSocketClient();
        WSClient socket = new Main.WSClient();
        try {
            client.start();

            URI echoUri = new URI(destUri);
            ClientUpgradeRequest request = new ClientUpgradeRequest();
            client.connect(socket, echoUri, request);
            System.out.printf("Connecting to : %s%n", echoUri);
            // wait for closed socket connection.
            while (true) {
                Thread.sleep(100);
            }

        } catch (Throwable t) {
            t.printStackTrace();
        } finally {
            try {
                client.stop();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @WebSocket(maxTextMessageSize = 64 * 1024)
    public static class WSClient {
        private final CountDownLatch closeLatch;

        @SuppressWarnings("unused")
        private Session session;

        public WSClient() {
            this.closeLatch = new CountDownLatch(1);
        }

        public boolean awaitClose(int duration, TimeUnit unit) throws InterruptedException {
            return this.closeLatch.await(duration, unit);
        }

        @OnWebSocketClose
        public void onClose(int statusCode, String reason) {
            System.out.printf("Connection closed: %d - %s%n", statusCode, reason);
            this.session = null;
            this.closeLatch.countDown(); // trigger latch
        }

        @OnWebSocketConnect
        public void onConnect(Session session) {
            System.out.printf("Got connect: %s%n", session);
            this.session = session;
            try {

            } catch (Throwable t) {
                t.printStackTrace();
            }
        }

        public void closeSession() {
            if (session != null) {
                this.session.close();
            }
        }

        @OnWebSocketMessage
        public void onMessage(String msg) {
            System.out.printf("Got msg: %s%n", msg);
        }
    }
}
```

> Example2 response

```json
{
  "message": [
    {"pair": "BTCUSD", "lower_unix": 1541072905, "upper_unix": 1541073505, "vwap": 6348.32, "difference": -0.12},
    {"pair": "ETHUSD", "lower_unix": 1541072905, "upper_unix": 1541073505, "vwap": 198.38, "difference": 0.04},
    {"pair": "DASHUSD", "lower_unix": 1541072905, "upper_unix": 1541073505, "vwap": 153.55, "difference": 0.01}
  ]
}
```
