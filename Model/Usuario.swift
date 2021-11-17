

import Foundation

class Usuario {
    private var telefones: [String]
    private var nome: String
    private var email: String
    private var senha: String
    private var usuarioType: UsuarioType
    
    init(email: String, senha: String, nome: String, usuarioType: UsuarioType, telefones: [String]) {
        self.email = email
        self.senha = senha
        self.nome = nome
        self.usuarioType = usuarioType
        self.telefones = telefones
    }
    
    public func getEmail() -> String {
        return email
    }
    
    public func getSenha() -> String {
        return senha
    }
    
    public func setEmail(newEmail: String) {
        self.email = newEmail
    }
    
    public func setSenha(newSenha: String) {
        self.senha = newSenha
    }
    
    public func getNome() -> String {
        return nome
    }
    
    public func setNome(newNome: String) {
        self.nome = newNome
    }
    
    public func setUsuarioType(newUsuarioType: UsuarioType) {
        self.usuarioType = newUsuarioType
    }
    
    public func getUsuarioType() -> UsuarioType {
        return usuarioType
    }
    
    public func addTelefone(newTelefone: String) {
        self.telefones.append(newTelefone)
    }
    
    public func getTelefones() -> [String] {
        return telefones
    }
}
