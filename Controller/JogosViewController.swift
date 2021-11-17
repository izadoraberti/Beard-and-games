

import UIKit

class JogosViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var pontos: Int!
    var jogos: [Jogo]!
    var lancamentos: [Jogo]!
    var populares: [Jogo]!
    var antigos: [Jogo]!
    var alugar = false
    var devolver = false
    var categoriasComJogos: [ClassificacaoJogo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        carregarListas()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func carregarListas() {
        lancamentos = jogos.filter({
            $0.getClassificacao() == .lancamento
        })
        if !lancamentos.isEmpty {
            categoriasComJogos.append(.lancamento)
        }
        populares = jogos.filter({
            $0.getClassificacao() == .popular
        })
        if !populares.isEmpty {
            categoriasComJogos.append(.popular)
        }
        antigos = jogos.filter({
            $0.getClassificacao() == .antigo
        })
        if !antigos.isEmpty {
            categoriasComJogos.append(.antigo)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension JogosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let categoria = categoriasComJogos[section]
        switch categoria {

        case .popular:
            return populares.count
        case .lancamento:
            return lancamentos.count
        case .antigo:
            return antigos.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categoriasComJogos[section].description
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoriasComJogos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "jogoCell") as? JogoTableViewCell {
            let categoria = categoriasComJogos[indexPath.section]
            switch categoria {
                
            case .popular:
                cell.nomeLabel.text = populares[indexPath.row].getNome()
                cell.classificacaoLabel.text = populares[indexPath.row].getStatus().description
            case .lancamento:
                cell.nomeLabel.text = lancamentos[indexPath.row].getNome()
                cell.classificacaoLabel.text = lancamentos[indexPath.row].getStatus().description
            case .antigo:
                cell.nomeLabel.text = antigos[indexPath.row].getNome()
                cell.classificacaoLabel.text = antigos[indexPath.row].getStatus().description
                
            }
            
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
}

extension JogosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categoria = categoriasComJogos[indexPath.section]
        var jogo: Jogo? = nil
        switch categoria {
            
        case .popular:
            jogo = populares[indexPath.row]
        case .lancamento:
            jogo = lancamentos[indexPath.row]
        case .antigo:
            jogo = antigos[indexPath.row]
        }
        if alugar {
            let alert = UIAlertController(title: "Locação", message: "Você tem certeza que gostaria de locar \(jogo!.getNome()) por \(categoria.emprestimo) pontos?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Sim", style: .default, handler: { action in
                if self.pontos >= categoria.emprestimo {
                    if let back = self.navigationController?.viewControllers[1] as? MainViewController {
                        if let cliente = back.userController.usuario as? Cliente {
                            self.pontos =  self.pontos - categoria.emprestimo
                            cliente.setPontos(newPontos: self.pontos)
                            back.userController.usuario = cliente
                            back.userController.dataBase.jogos[jogo!.getId()]!.setStatus(newStatus: .locado)
                            switch categoria {
                                
                            case .popular:
                                self.populares.remove(at: indexPath.row)
                            case .lancamento:
                                self.lancamentos.remove(at: indexPath.row)
                            case .antigo:
                                self.antigos.remove(at: indexPath.row)
                            }
                            self.tableView.reloadData()
                            
                        }
                    }
                    let alert = UIAlertController(title: "Jogo locado", message: "Parabéns! Você acaba de locar \(jogo!.getNome()), seu voucher está sendo impresso.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
                else {
                    let alert = UIAlertController(title: "Erro", message: "Você não possui pontos suficiente para locar esse jogo.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
            }))
            alert.addAction(UIAlertAction(title: "Não", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        if devolver {
            let alert = UIAlertController(title: "Marcar jogo como devolvido?", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Não", style: .cancel, handler: nil ))
            alert.addAction(UIAlertAction(title: "Sim", style: .default, handler: { action in
                if let back = self.navigationController?.viewControllers[1] as? MainViewController {
                    back.userController.dataBase.jogos[jogo!.getId()]!.setStatus(newStatus: .emEstoque)
                    switch categoria {
                        
                    case .popular:
                        self.populares.remove(at: indexPath.row)
                    case .lancamento:
                        self.lancamentos.remove(at: indexPath.row)
                    case .antigo:
                        self.antigos.remove(at: indexPath.row)
                    }
                    self.tableView.reloadData()
                }
            }))
            self.present(alert, animated: true)
        }
    }
}
