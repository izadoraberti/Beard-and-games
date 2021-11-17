

import Foundation

class Jogo {
    private var nome: String
    private var id: UUID
    private var classificacao: ClassificacaoJogo
    private var status: StatusJogo
    private var relatorioTransacoes: [Transacao]
    
    init(nome: String, id: UUID, classificacao: ClassificacaoJogo, status: StatusJogo, relatorioTransacoes: [Transacao]) {
        self.nome = nome
        self.id = id
        self.classificacao = classificacao
        self.status = status
        self.relatorioTransacoes = relatorioTransacoes
    }
    
    public func getNome() -> String {
        return nome
    }
    
    public func getId() -> UUID {
        return id
    }
    
    public func getClassificacao() -> ClassificacaoJogo {
        return classificacao
    }
    
    public func getStatus() -> StatusJogo {
        return status
    }
    
    public func getRelatorioTransacoes() -> [Transacao] {
        return relatorioTransacoes
    }
    
    public func setClassificacao(newClassificacao: ClassificacaoJogo) {
        self.classificacao = newClassificacao
    }
    
    public func setStatus(newStatus: StatusJogo) {
        self.status = newStatus
    }
    
    public func setRelatorioTransacoes(newRelatorioTransacoes: [Transacao]) {
        self.relatorioTransacoes = newRelatorioTransacoes
    }
    
    public func setNome(newNome: String) {
        self.nome = newNome
    }
    
    public func setId(newId: UUID) {
        self.id = newId
    }
}
