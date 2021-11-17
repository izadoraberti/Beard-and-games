

import Foundation

class Cliente: Usuario {
    private var endereco: Endereco
    private var pontos: Int
    private var transacoes: [Transacao]
    
    init(email: String, senha: String, nome: String, telefones: [String], endereco: Endereco, pontos: Int, transacoes: [Transacao]) {
        self.endereco = endereco
        self.pontos = pontos
        self.transacoes = transacoes
        super.init(email: email, senha: senha, nome: nome, usuarioType: .cliente, telefones: telefones)
    }
    
    public func getEndereco() -> Endereco {
        return endereco
    }
    
    public func setEndereco(newEndereco: Endereco) {
        self.endereco = newEndereco
    }
    
    public func getPontos() -> Int {
        return pontos
    }
    
    public func setPontos(newPontos: Int) {
        self.pontos = newPontos
    }
    
}
