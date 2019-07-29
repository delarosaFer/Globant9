import Foundation

final class RequestManager: RequestProtocol {
    // MARK: - Variables
    private let session: urlSessionProtocol
    private var baseURL: URL?
    
    // MARK: - Initializer
    /**
     Initializes the session and baseURL variables.
     
     - Parameters:
        - session: URLSession object.
     */
    init(session: urlSessionProtocol = URLSession.shared) {
        self.session = session
        guard let baseURL = AppConfiguration.informationForKey(URLS.keyBaseURL.rawValue) else {
            return
        }
        
        guard let url = URL(string: baseURL) else {
            return
        }
        
        self.baseURL = url
    }
    
    // MARK: - Methods
    internal func requestEndPoint(_ endpoint: String, completionHandler: @escaping (RequestResult<Data>) -> Void) {
        guard let url = baseURL?.appendingPathComponent(endpoint) else {
            completionHandler(.failure(APIError.invalidUrl))
            return
        }
        
        request(url) { (result) in
            completionHandler(result)
        }
    }
    
    internal func requestImage(_ urlImage: String, completionHandler: @escaping (RequestResult<Data>) -> Void) {
        guard let url = URL(string: urlImage) else {
            completionHandler(.failure(APIError.invalidUrl))
            return
        }
        
        request(url) { (result) in
            completionHandler(result)
        }
    }
    
    internal func request(_ url: URL, completionHandler: @escaping (RequestResult<Data>) -> Void) {
        let urlRequest = URLRequest(url: url)
        session.dataTask(with: urlRequest){ data, response, error in
            guard error == nil else{
                completionHandler(.failure(APIError.networkError))
                return
            }
            
            guard let dataResponse = data else{
                completionHandler(.failure(APIError.invalidData))
                return
            }
            
            completionHandler(.success(dataResponse))
            }.resume()
    }
    
    func decodeJSONFromData<T: Decodable>(_ data: Data) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            return try jsonDecoder.decode(T.self, from: data)
        } catch {
            return nil
        }
    }
}

