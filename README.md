# JustNetworking

It is a tiny architecture library for simplify the networking layer.  The main goal of the library is provide a simple abstraction for networking layer, keeping easy to use and test.

This library does not provide any custom implementation for URLDataTask or use another library for make api calls, you should use your own implementation or use a library such as Alamofire.

How to use it?
======

There are three main protocols for this library.

1. Router 
2. APIRequest 
3. APIRequester

Router
------

This protocol is used for get the full URL and the HTTPMethod for the request.  By default use the URL set on the global configuration.

you must set the global URL first:

```swift
GlobalConfiguration.setCurrentURL(URL(string:"https://www.myApi.com")!)
```

Implementing Router Protocol: 

```swift
enum UserRouter: Router {
    case user(id: String)

    var route: Route {
        switch self {
            case .user(let id):
                return Route(path: "user\(id)", method: .get)
            }
      }
}
```
if you don't want use the global url you could change implementing  `baseURL` property

```swift
enum UserRouter: Router {
    case user(id: String)

        var route: Route {
            switch self {
            case .user(let id):
            return Route(path: "user/\(id)", method: .get)
            }
  }

var baseURL: URL {
    return URL(string:"https://www.anotherapi.com")
    }
}
```
It is recommendable not use just one enum for all the possible paths that could exist, is better use just one per domain, so if you have `user` and  `packages` route you might create two enums one for user routes and other for packages routes. 

APIRequest
------

This protocol with associated type is used for abstract  the configuration of a Request. Has three key parameters

1. responseQueue

The queue where you want the callback response.

2. requestParser

Property that holds a function that will parse from data to the associated type. 

3. requestFactory

property the type `RequestFactory` this is a struct that is initialized with a `Router` implementation and a function that take an URLRequest and return another one. The point of this function is create compositions that allow to add whatever configuration you want for the URLRequest. the `requestBuilder` parameter has a default parameter `identity` a function that return the same URLRequest passed as parameter.

There is a default implementation for this protocol provided by the library :

```swift
    public struct BaseRequest<Response>: APIRequest {

    public let responseQueue: DispatchQueue

    public let requestParser: RequestParser<Response>

    public let requestFactory: RequestFactory

    public init(responseQueue: DispatchQueue = .global(qos: .default),
            requestFactory: RequestFactory,
            requestParser: @escaping RequestParser<Response>) {
            self.responseQueue = responseQueue
            self.requestParser = requestParser
            self.requestFactory = requestFactory
            }
}
```
That has its custom extension when the response type is Decodable

``` swift
extension BaseRequest where Response: Decodable {

    init(responseQueue: DispatchQueue = .global(qos: .default),
        requestFactory: RequestFactory,
        decoder: JSONDecoder = JSONDecoder()) {
        self.init(responseQueue: responseQueue, requestFactory: requestFactory) {
            return try decoder.decode(Response.self, from: $0)
            }
      }
}
```

Most of the time you will use this implementation for build your Request, but if you need to cover some edge case you could implement the protocol and apply your custom configuration.


### Making composition for build an URLRequest

The library provide a free function `compose` that takes a varadic parameter of type of `RequestBuilder`, that is just a typealias for the signature `(URLRequest) -> URLRequest`, this function take a N number of function that accomplish the signature and reduce until gets a  `URLRequest`. This function return a `RequestBuilder`.


example:

```swift
    let requestBuilder = compose(addURLParams(["years": "2015"]), addHeaders(["Authorization":"Bearer...."]))
    RequestFactory(router: UserRouter.user(id: "12"), requestBuilder: requestBuilder)
```

APIRequester
------

This protocol is for abstract the network client, just has a function that accepts an `APIRequest`  and a closure as response for the callback (this closure has a type alias `Response<T>` and take a `APIResult` type as a parameter)

Example using Alamofire:

```swift      
public func execute<T: Request>(_ request: T, response: @escaping Response<T.APIResponse>)  {

    let urlRequest = request.urlRequest
    Alamofire.request(urlRequest)
            .responseData(queue: request.responseQueue) {
                switch $0.result {
                 case .success(let data):
                do {
                    response(.success(try request.parser(data)))
                } catch {
                    response(.failure(error))
                }
                  case .failure(let error):
                     response(.failure(error))
                  }
             }
        }
}
```

Installation
======

## CocoaPods

Just add the following line into the podfile
```
pod `JustNetworking`, `1.0`
```

License
======

JustNetworking is released under the MIT license. See LICENSE for details.















