

import Foundation
import UIKit

class ClienteController: UsuarioController {
    
    func criarCadastro() -> Bool {
        return false
    }
    
    func alugarJogo() {
        viewController?.performSegue(withIdentifier: "goToJogosCatalogo", sender: CatalogoType.alugar)
    }
    
    func adquirirServico() {
        let alert = UIAlertController(title: "Qual serviço você gostaria de adquirir?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Cabelo - \(ServiceType.cabelo.preco) pontos", style: .default, handler: { action in
            if let cliente = self.usuario as? Cliente {
                if cliente.getPontos() - ServiceType.cabelo.preco >= 0{
                    cliente.setPontos(newPontos: cliente.getPontos() - ServiceType.cabelo.preco)
                    self.usuario = cliente
                    if let window = self.viewController as? MainViewController {
                        window.nomeLabel.text = "Bem vindo(a) \(cliente.getNome()). Você tem \(cliente.getPontos()) pontos."
                    }
                    let alert = UIAlertController(title: "Cabelo", message: "Parabéns! Você adquiriu um corte de cabelo por \(ServiceType.cabelo.preco) pontos. Seu voucher está sendo impresso.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.viewController?.present(alert, animated: true)
                }
                else {
                    let alert = UIAlertController(title: "Erro", message: "Você não possui pontos suficiente", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.viewController?.present(alert, animated: true)
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Barba - \(ServiceType.barba.preco) pontos", style: .default, handler: { action in
            if let cliente = self.usuario as? Cliente {
                if cliente.getPontos() - ServiceType.barba.preco >= 0{
                    cliente.setPontos(newPontos: cliente.getPontos() - ServiceType.barba.preco)
                    self.usuario = cliente
                    if let window = self.viewController as? MainViewController {
                        window.nomeLabel.text = "Bem vindo(a) \(cliente.getNome()). Você tem \(cliente.getPontos()) pontos."
                    }
                    let alert = UIAlertController(title: "Barba", message: "Parabéns! Você adquiriu um trato na barba por \(ServiceType.barba.preco) pontos. Seu voucher está sendo impresso.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.viewController?.present(alert, animated: true)
                }
                else {
                    let alert = UIAlertController(title: "Erro", message: "Você não possui pontos suficiente", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.viewController?.present(alert, animated: true)
                }
            }
        }))
        viewController?.present(alert, animated: true)
            
    }
    
    func doarJogo() {
        let alert = UIAlertController(title: "Jogo", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Nome"
        })
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {action in
            if let window = self.viewController as? MainViewController{
                if let nome = alert.textFields?.first?.text {
                    let pontos = self.doarJogo(jogoNome: nome)!
                    if let cliente = self.usuario as? Cliente {
                        window.nomeLabel.text = "Bem vindo(a) \(cliente.getNome()). Você tem \(cliente.getPontos()) pontos."
                    }
                    let alert2 = UIAlertController(title: "Obrigado por doar esse jogo!", message: "Você ganhou \(pontos) pontos pela doação", preferredStyle: .alert)
                    alert2.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    window.present(alert2, animated: true)
                }
            }
        }))
        viewController?.present(alert, animated: true)
    }
    
    private func doarJogo(jogoNome: String) -> Int? {
        let jogo = Jogo(nome: jogoNome, id: UUID(), classificacao: ClassificacaoJogo.allCases.randomElement()!, status: .emEstoque, relatorioTransacoes: [])
        dataBase.jogos[jogo.getId()] = jogo
        if let cliente = usuario as? Cliente {
            cliente.setPontos(newPontos: cliente.getPontos() + jogo.getClassificacao().pontuacao)
            usuario = cliente
        }
        return jogo.getClassificacao().pontuacao
    }
    
    func procurarJogo() {
        let alert = UIAlertController(title: "Qual jogo você gostaria de procurar?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Nome"
        })
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            let text = alert.textFields?.first?.text!.uppercased()
            let jogos = self.dataBase.getAllJogos().filter({
                let upperCasedNome = $0.getNome().uppercased()
                return upperCasedNome.contains(text!)
            })
            if !jogos.isEmpty {
                self.viewController?.performSegue(withIdentifier: "goToJogosCatalogo", sender: jogos)
            }
            else {
                let alert = UIAlertController(title: "Não foi encontrado nenhum jogo com esse nome", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.viewController?.present(alert, animated: true)
            }
        }))
        self.viewController?.present(alert, animated: true)
    }
    
    func verClassificacaoJogo(jogoId: UUID) -> ClassificacaoJogo {
        return .popular
    }
    
    func consultarTransacoes() -> [Transacao] {
        return []
    }
    
}
