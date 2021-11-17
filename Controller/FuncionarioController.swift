

import Foundation
import UIKit

class FuncionarioController: UsuarioController {
    
    func removerJogo(jogoId: UUID) -> Bool {
        return false
    }
    
    func adicionarJogo(){
        let alert = UIAlertController(title: "Adicionar novo jogo", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Nome"
        })
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            let nome = alert.textFields?.first?.text
            if nome != "" {
                let alert = UIAlertController(title: "Classificação", message: "Selecione a classificação do jogo", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "Lançamento", style: .default, handler: { action in
                    let uuid = UUID()
                    self.dataBase.jogos[uuid] = Jogo(nome: nome!, id: uuid, classificacao: .lancamento, status: .emEstoque, relatorioTransacoes: [])
                }))
                alert.addAction(UIAlertAction(title: "Popular", style: .default, handler: { action in
                    let uuid = UUID()
                    self.dataBase.jogos[uuid] = Jogo(nome: nome!, id: uuid, classificacao: .popular, status: .emEstoque, relatorioTransacoes: [])
                }))
                alert.addAction(UIAlertAction(title: "Antigo", style: .default, handler: { action in
                    let uuid = UUID()
                    self.dataBase.jogos[uuid] = Jogo(nome: nome!, id: uuid, classificacao: .antigo, status: .emEstoque, relatorioTransacoes: [])
                }))
                self.viewController?.present(alert, animated: true)
            }
        }))
        self.viewController?.present(alert, animated: true)
    }
    
    func atualizarCatalogo(jogos: [Jogo]) -> Bool {
        return false
    }
    
    func marcarDevolucao() {
        viewController?.performSegue(withIdentifier: "goToJogosCatalogo", sender: CatalogoType.devolucao)
    }
    
    func verificarJogosLocados() {
        viewController?.performSegue(withIdentifier: "goToJogosCatalogo", sender: CatalogoType.locados)
    }
    
    func verificarClientesInadimplentes() -> [Cliente] {
        return []
    }
    
    func deletarCliente() {
        viewController?.performSegue(withIdentifier: "seeClientes", sender: true)
    }
}
