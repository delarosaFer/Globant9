import Foundation

protocol RequestProtocol {
    func request(_ url: URL, completionHandler: @escaping (RequestResult<Data>) -> Void)
    func requestEndPoint(_ endpoint: String, completionHandler: @escaping (RequestResult<Data>) -> Void)
    func requestImage(_ urlImage: String, completionHandler: @escaping (RequestResult<Data>) -> Void)
    func decodeJSONFromData<T: Decodable>(_ data: Data) -> T?
}
