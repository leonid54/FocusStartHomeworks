import UIKit

protocol INetworkService {
    func loadData(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}

final class NetworkService: NSObject, INetworkService {
    private let session: URLSession
    private let backSession: URLSession
    private let config = URLSessionConfiguration.background(withIdentifier: "background")
    
    init(configuration: URLSessionConfiguration? = nil, backConfig: URLSessionConfiguration? = nil) {
        config.sessionSendsLaunchEvents = true
        config.isDiscretionary = true
        config.allowsCellularAccess = true
        config.shouldUseExtendedBackgroundIdleMode = true
        config.waitsForConnectivity = true
        if let backConfig = backConfig {
            self.backSession = URLSession(configuration: config)
        }
        else {
            self.backSession = URLSession(configuration: URLSessionConfiguration.default)
        }
        
        if let configuration = configuration {
            self.session = URLSession(configuration: configuration)
        }
        else {
            self.session = URLSession(configuration: URLSessionConfiguration.default)
        }
    }

    func loadData(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else { assert(false, "Кривой УРЛ") }
        let request = URLRequest(url: url)
        let task = self.session.downloadTask(with: request) { url, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let url = url {
                if let result = try? Data(contentsOf: url) {
                    completion(.success(result))
                }
            }
        }
        print("\(task.progress)")
        print("\(task.progress.isFinished)")

        let backgroundId = UIApplication.shared.beginBackgroundTask {
            task.cancel() { data in
                let task: URLSessionDownloadTask
                if let data = data {
                    task = self.backSession.downloadTask(withResumeData: data)
                } else {
                    task = self.backSession.downloadTask(with: request) { url, response, error in
                        if let error = error {
                            completion(.failure(error))
                        }
                        
                        if let url = url {
                            if let result = try? Data(contentsOf: url) {
                                completion(.success(result))
                            }
                        }
                    }
                }
                task.resume()
            }
        }
        print("\(task.progress)")
        task.resume()

    }
}

extension NetworkService: URLSessionDelegate, URLSessionDownloadDelegate {
    
    func urlSession(_: URLSession, downloadTask: URLSessionDownloadTask, didWriteData _: Int64, totalBytesWritten data: Int64, totalBytesExpectedToWrite _: Int64) {
        print("\(data)")
    }

    func urlSession(_: URLSession, downloadTask _: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        // The file at location is temporary and will be gone afterwards
    }

    func urlSession(_: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
    }
}
