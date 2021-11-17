

import Foundation

class Endereco {
    private var rua: String
    private var numero: String
    private var bairro: String
    private var cidade: String
    private var complemento: String
    
    init(cidade: String, bairro: String, rua: String, numero: String, complemento: String) {
        self.bairro = bairro
        self.cidade = cidade
        self.complemento = complemento
        self.numero = numero
        self.rua = rua
    }
    
    public func getRua() -> String {
        return rua
    }
    
    public func getNumero() -> String {
        return numero
    }
    
    public func getBairro() -> String {
        return bairro
    }
    
    public func getCidade() -> String {
        return cidade
    }
    
    public func getComplemento() -> String {
        return complemento
    }
    
    public func setRua(newRua: String) {
        self.rua = newRua
    }
    
    public func setNumero(newNumero: String) {
        self.numero = newNumero
    }
    
    public func setBairro(newBairro: String) {
        self.bairro = newBairro
    }
    
    public func setCidade(newCidade: String) {
        self.cidade = newCidade
    }
    
    public func setComplemento(newComplemento: String) {
        self.complemento = newComplemento
    }
    
}
