import UIKit

final class NetworkService {
    
    let token = Constants.token
    let urlString = "http://89.218.80.61/vshep-api/con-sync-service?requestId=002241054097&requestIIN=860904350504&token=eyJG6943LMReKj_kqdAVrAiPbpRloAfE1fqp0eVAJ-IChQcV-kv3gW-gBAzWztBEdFY"

    
    func performRequest( nationalId: String, requestId: String, completion: @escaping (OrderData?, Error?) -> Void) {
        let urlString = "http://hakaton.gov4c.kz/vshep-api/con-sync-service?requestId=\(requestId)&requestIIN=\(nationalId)&token=\(token)"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                guard let data = data else {
                    completion(nil, nil)
                    return
                }
                guard let orderData = self.parseJSON(data: data) else {
                    completion(nil, nil)
                    return
                }
                completion(orderData, nil)
            }
            task.resume()
            
        }
    }
    
    func parseJSON(data: Data) -> OrderData? {
        let decoder = JSONDecoder()
        do{
            let decodedOrderData = try decoder.decode(OrderData.self, from: data)
            return decodedOrderData
        } catch {
            return nil
        }
    }
    
    func makeRequest( nationalId: String, completion: @escaping (FLData?, Error?) -> Void) {
        if let url = URL(string: "http://hakaton-fl.gov4c.kz/api/persons/\(nationalId)/") {
            var request = URLRequest(url: url)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                print(error)
                if let error = error {
                    completion(nil, error)
                    return
                }
                guard let data = data else {
                    completion(nil, nil)
                    return
                }
                guard let flData = self.parse(data: data) else {
                    completion(nil, nil)
                    return
                }
            }
            
            task.resume()
        }
    }
    
    func parse(data: Data) -> FLData? {
        let decoder = JSONDecoder()
        do{
            let decodedFLData = try decoder.decode(FLData.self, from: data)
            return decodedFLData
        } catch {
            return nil
        }
    }
    
    func doRequest( nationalId: String, completion: @escaping (BmgData?, Error?) -> Void) {
        if let url = URL(string: "http://hakaton.gov4c.kz/api/bmg/check/\(nationalId)/") {
            var request = URLRequest(url: url)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                guard let data = data else {
                    completion(nil, nil)
                    return
                }
                guard let bmgData = self.doParse(data: data) else {
                    completion(nil, nil)
                    return
                }
                completion(bmgData, nil)
            }
            
            task.resume()
        }
    }
    
    func doParse(data: Data) -> BmgData? {
        let decoder = JSONDecoder()
        do{
            let decodedBmgData = try decoder.decode(BmgData.self, from: data)
            return decodedBmgData
        } catch {
            return nil
        }
    }
}
