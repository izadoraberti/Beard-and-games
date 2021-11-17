

import Foundation

enum GerenteOperationType: CaseIterable {
    case removerJogo
    case adicionarJogo
    case atualizarCatalogo
    case marcarDevolucao
    case verCatalogo
    case verificarJogosLocados
    case verificarClientesInadimplentes
    case deletarCliente
    case cancelarDoacao
    case cadastrarFuncionario
    case cadastrarGerente
    case bloquearFuncionario
    case desbloquearFuncionario
    case procurarFuncionario
    case deletarFuncionario
    
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
        case .cancelarDoacao:
            return "Cancelar doação"
        case .cadastrarFuncionario:
            return "Cadastrar funcionário"
        case .cadastrarGerente:
            return "Cadastrar gerente"
        case .bloquearFuncionario:
            return "Bloquear funcionário"
        case .desbloquearFuncionario:
            return "Desbloquear funcionário"
        case .procurarFuncionario:
            return "Procurar funcionário"
        case .deletarFuncionario:
            return "Deletar funcionário"
        case .verCatalogo:
            return "Visualizar catálogo"
        }
    }
}
