

import Foundation

enum FuncionarioOperationType: CaseIterable {
    case removerJogo
    case adicionarJogo
    case atualizarCatalogo
    case marcarDevolucao
    case verCatalogo
    case verificarJogosLocados
    case verificarClientesInadimplentes
    case deletarCliente
    
    var description: String {
        switch self {
            
        case .removerJogo:
            return "Remover jogo"
        case .adicionarJogo:
            return "Adicionar jogo"
        case .atualizarCatalogo:
            return "Atualizar catálogo"
        case .marcarDevolucao:
            return "Marcar devolução"
        case .verificarJogosLocados:
            return "Verificar jogos locados"
        case .verificarClientesInadimplentes:
            return "Verificar clientes inadimplentes"
        case .deletarCliente:
            return "Deletar cliente"
        case .verCatalogo:
            return "Visualizar catálogo"
        }
    }
}
