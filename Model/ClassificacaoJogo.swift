

import Foundation

enum ClassificacaoJogo: CaseIterable {
    case popular
    case lancamento
    case antigo
    
    var pontuacao: Int {
        switch self {
            
        case .popular:
            return 3
        case .lancamento:
            return 5
        case .antigo:
            return 1
        }
    }
    
    var emprestimo: Int {
        switch self {
        
        case .popular:
            return 10
        case .lancamento:
            return 15
        case .antigo:
            return 5
        }
    }
    
    var description: String {
        switch self {
            
        case .popular:
            return "Popular"
        case .lancamento:
            return "Lançamento"
        case .antigo:
            return "Antigo"
        }
    }
}
