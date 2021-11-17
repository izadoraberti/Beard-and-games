

import Foundation

class DataBase {
    var usuarios: [String:Usuario] = [:]
    var jogos: [UUID:Jogo] = [:]
    
    func initFakeBD() {
        usuarios["cliente1@bg.com"] = Cliente(email: "cliente1@bg.com", senha: "cliente1", nome: "João", telefones: ["+5551999999999"], endereco: Endereco(cidade: "Porto Alegre", bairro: "Menino Deus", rua: "A", numero: "12", complemento: ""), pontos: 13, transacoes: [])
        usuarios["funcionario1@bg.com"] = Usuario(email: "funcionario1@bg.com", senha: "funcionario1", nome: "Carlos", usuarioType: .funcionario, telefones: [])
        usuarios["gerente@bg.com"] = Usuario(email: "gerente@bg.com", senha: "gerente", nome: "Nathália", usuarioType: .gerente, telefones: [])
        
        var uuid = UUID()
        
        jogos[uuid] = Jogo(nome: "Ocarina of Time", id: uuid, classificacao: .antigo, status: .locado, relatorioTransacoes: [])
        
        uuid = UUID()
        jogos[uuid] = Jogo(nome: "The Witcher 3", id: uuid, classificacao: .popular, status: .emEstoque, relatorioTransacoes: [])
        
        uuid = UUID()
        jogos[uuid] = Jogo(nome: "God of War PS4", id: uuid, classificacao: .lancamento, status: .emEstoque, relatorioTransacoes: [])
        
        uuid = UUID()
        jogos[uuid] = Jogo(nome: "Castlevania", id: uuid, classificacao: .antigo, status: .perdido, relatorioTransacoes: [])
    }
    
    func getCliente(email: String) -> Cliente? {
        if let user = usuarios[email] {
            if user.getUsuarioType() == .cliente {
                return user as? Cliente
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    func getUsuário(email: String) -> Usuario? {
        if let user = usuarios[email] {
            return user
        }
        else {
            return nil
        }
    }
    
    func getAllJogosEmEstoque() -> [Jogo] {
        return jogos.filter({
            $0.value.getStatus() == StatusJogo.emEstoque
        }).map({
            $0.value
        })
    }
    
    func getAllJogosLocados() -> [Jogo] {
        return jogos.filter({
            $0.value.getStatus() == StatusJogo.locado
        }).map({
            $0.value
        })
    }
    
    func getAllJogos() -> [Jogo] {
        return jogos.map({
            $0.value
        })
    }
    
    func getAllClientes() -> [Cliente] {
        return usuarios.filter({
            $0.value.getUsuarioType() == .cliente
        }).map({
            $0.value as! Cliente
        })
    }
}
