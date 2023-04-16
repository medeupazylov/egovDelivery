import UIKit

final class NetworkService {
    
    let token = Constants.token
    let urlString = "http://89.218.80.61/vshep-api/con-sync-service?requestId=002241054097&requestIIN=860904350504&token=eyJG6943LMReKj_kqdAVrAiPbpRloAfE1fqp0eVAJ-IChQcV-kv3gW-gBAzWztBEdFY"

    
    func performRequest( nationalId: String, requestId: String, completion: @escaping (OrderData?, Error?) -> Void) {
        let urlString = "https://hakaton.gov4c.kz/vshep-api/con-sync-service?requestId=\(requestId)&requestIIN=\(nationalId)&token=\(token)"
        
//        url  = "http://hakaton-fl.gov4c.kz/api/persons/IIN"
        
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
    
    
//    func makeRequest( nationalId: String, completion: @escaping (OrderData?, Error?) -> Void) {
//        let urlString = "http://hakaton.gov4c.kz/vshep-api/con-sync-service?requestId=\(requestId)&requestIIN=\(nationalId)&token=\(token)"
//        
//        if let url = URL(string: urlString) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    completion(nil, error)
//                    return
//                }
//                guard let data = data else {
//                    completion(nil, nil)
//                    return
//                }
//                guard let orderData = self.parseJSON(data: data) else {
//                    completion(nil, nil)
//                    return
//                }
//                completion(orderData, nil)
//            }
//            task.resume()
//            
//        }
//    }
}
