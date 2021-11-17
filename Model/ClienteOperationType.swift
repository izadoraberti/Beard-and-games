

import Foundation

enum ClienteOperationType: CaseIterable {
    case alugarJogo
    case adquirirServico
    case doarJogo
    case procurarJogo
    case verCatalogo
    case consultarTransacoes
    
    var description: String {
        switch self {
        
        case .alugarJogo:
            return "Alugar jogo"
        case .adquirirServico:
            return "Adquirir serviço"
        case .doarJogo:
            return "Doar jogo"
        case .procurarJogo:
            return "Procurar jogo"
        case .verCatalogo:
            return "Ver catálogo de jogos"
        case .consultarTransacoes:
            return "Consultar histórico de transações"
        }
    }
}
