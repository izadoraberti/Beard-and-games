

import Foundation

enum ServiceType {
    case cabelo
    case barba
    
    var preco: Int {
        switch self {

        case .cabelo:
            return 20
        case .barba:
            return 10
        }
    }
}
