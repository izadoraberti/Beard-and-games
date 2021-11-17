

import Foundation

enum StatusJogo {
    case locado
    case emEstoque
    case perdido
    
    var description: String {
        switch self {

        case .locado:
            return "Locado"
        case .emEstoque:
            return "Em estoque"
        case .perdido:
            return "Perdido"
        }
    }
}
