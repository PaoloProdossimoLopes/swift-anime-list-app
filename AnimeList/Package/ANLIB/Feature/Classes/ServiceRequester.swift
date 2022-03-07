//
//  ServiceRequester.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 06/03/22.
//

import Foundation

public class ServiceRequester {
    
    public func perform<Expect: Codable>(
        request: Request,
        completion: @escaping ((Result<Expect, ServiceErrors>) -> Void)
    ) {
        
        URLSession.shared.dataTask(
            with: request.urlRequester
        ) { [weak self] data, response, error in
            guard let self = self else { return }
            
            guard let data = self.handleErrors(
                data: data, response: response,
                error: error, completion: completion
            ) else { return }
            
            self.decodeObject(data: data, completion: completion)
        }.resume()
    }
    
    private func handleErrors<Expect: Codable>(
        data: Data?, response: URLResponse?, error: Error?,
        completion:((Result<Expect, ServiceErrors>) -> Void)
    ) -> Data? {
        
        if let response = response as? HTTPURLResponse, let error = error {
            if let sError = ServiceErrors(rawValue: response.statusCode) {
                print(error.localizedDescription)
                completion(.failure(sError))
            }
        }
        return data
    }
    
    private func decodeObject<Expect: Codable>(
        data: Data, completion: ((Result<Expect, ServiceErrors>) -> Void)
    ) {
        do {
            let jsonDecoder = JSONDecoder()
            let objectDecoded = try jsonDecoder.decode(Expect.self, from: data)
            completion(.success(objectDecoded))
        } catch {
            completion(.failure(.decodeError))
        }
    }
}
