

import Foundation
import UIKit

class UsuarioController {
    var usuario: Usuario
    var dataBase: DataBase
    var viewController: UIViewController?
    
    init(usuario: Usuario, dataBase: DataBase, viewController: UIViewController?) {
        self.dataBase = dataBase
        self.usuario = usuario
        self.viewController = viewController
    }
    
    static func efetuarLogin(dataBase: DataBase, email: String, senha: String, userType: UsuarioType) -> Bool {
        if let user = dataBase.usuarios[email] {
            if user.getUsuarioType() == userType && user.getSenha() == senha {
                return true
            }
            else{
                return false
            }
        }
        else{
            return false
        }
    }
    func verCatalogoJogos() {
        viewController?.performSegue(withIdentifier: "goToJogosCatalogo", sender: nil)
    }
    
}
