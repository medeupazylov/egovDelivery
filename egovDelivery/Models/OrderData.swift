import UIKit

struct OrderData: Codable {
    let data: DataModel
    let status: String
}

struct DataModel: Codable {
    let requestId: String
    let resultCode: String
    let serviceType: ServiceType
    let organization: Organization
    let appStatus: AppStatus
    let statusDate: String
}

struct ServiceType: Codable {
    let code: String
    let nameRu: String
    let nameKz: String
}

struct Organization: Codable {
    let code: String
    let nameRu: String
    let nameKz: String
}

struct AppStatus: Codable {
    let appState: String
    let statusInfo: String
    let statusInfoKz: String
}
