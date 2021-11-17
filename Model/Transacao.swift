

import Foundation

class Transacao {
    var id: UUID
    var tipoTransacao: TransacaoType
    var peloEmail: String
    var data: Date
    
    init(id: UUID, transacaoType: TransacaoType, peloEmail: String, data: Date) {
        self.id = id
        self.tipoTransacao = transacaoType
        self.peloEmail = peloEmail
        self.data = data
    }
}
