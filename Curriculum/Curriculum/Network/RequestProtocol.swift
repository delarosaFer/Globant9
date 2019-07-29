import Foundation

/// Requests methods.
protocol RequestProtocol {
    /**
     Process the request and its response.
     
     - Parameters:
        - url: url to request.
        - completionHandler: completionHandler with an request result.
     */
    func request(_ url: URL, completionHandler: @escaping (RequestResult<Data>) -> Void)
    
    /**
     Executes the request for a given endpoint.
     
     - Parameters:
        - endpoint: endpoint as String.
        - completionHandler: completionHandler with an request result.
     */
    func requestEndPoint(_ endpoint: String, completionHandler: @escaping (RequestResult<Data>) -> Void)
    
    /**
     Executes the request for a url image.
     
     - Parameters:
        - urlImage: url image as String.
        - completionHandler: completionHandler with an request result.
     */
    func requestImage(_ urlImage: String, completionHandler: @escaping (RequestResult<Data>) -> Void)
    
    /**
     Decodes the data received as response and returns an generic type.
     
     - Parameters:
        - data: Data received as response.
        - Returns: A generic tye or nil if the data is not a valid JSON.
     */
    func decodeJSONFromData<T: Decodable>(_ data: Data) -> T?
}

/// Object Adapter for the URLSession.
protocol urlSessionProtocol {
    /// Creates a data task to retrieve the contents of the given URL.
    func dataTask(with url: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) -> URLSessionDataTask
}

extension URLSession: urlSessionProtocol {}
