

import Foundation
import UIKit

class GerenteController: FuncionarioController {
    
    func cancelarDoacao(id: UUID) -> Bool {
        return false
    }
    
    func cadastrarFuncionario() {
        let alert = UIAlertController(title: "Novo funcionário", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Nome"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Email"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Telefone"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Senha"
        })
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            var erro = false
            let funcionario = Usuario(email: "", senha: "", nome: "", usuarioType: .funcionario, telefones: [])
            alert.textFields?.forEach{
                if $0.text != ""{
                    switch $0.placeholder! {
                    case "Nome":
                        funcionario.setNome(newNome: $0.text!)
                    case "Email":
                        funcionario.setEmail(newEmail: $0.text!)
                    case "Telefone":
                        funcionario.addTelefone(newTelefone: $0.text!)
                    case "Senha":
                        funcionario.setSenha(newSenha: $0.text!)
                    default:
                        fatalError("Placeholder inválido")
                    }
                }
                else {
                    erro = true
                }
            }
            if !erro {
                self.dataBase.usuarios[funcionario.getEmail()] = funcionario
                let alert = UIAlertController(title: "Funcionário cadastrado com sucesso", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.viewController?.present(alert, animated: true)
            }
            
            else {
                let alert = UIAlertController(title: "Erro", message: "Todos os campos devem ser preenchidos.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.viewController?.present(alert, animated: true)
            }
            
        }))
        self.viewController?.present(alert, animated: true)
        
    }
    
    func cadastrarGerente(gerente: Usuario) -> Bool {
        return false
    }
    
    func bloquearFuncionario(funcionarioEmail: String) -> Bool {
        return false
    }
    
    func desbloquearFuncionario(funcionarioEmail: String) -> Bool {
        return false
    }
    
    func procurarFuncionarios() -> [Usuario] {
        return []
    }
    
    func deletarFuncionario(funcionarioEmail: String) -> Bool {
        return false
    }
}
