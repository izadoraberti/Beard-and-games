

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var userController: UsuarioController!
    var userType: UsuarioType!
    var operacoes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomeLabel.text = "Bem vindo(a), \(userController.usuario.getNome())."
        switch userType! {
        case .cliente:
            if let cliente = userController.usuario as? Cliente {
                nomeLabel.text = nomeLabel.text! + " Você tem \(cliente.getPontos()) pontos."
            }
            operacoes = ClienteOperationType.allCases.map({
                $0.description
            })
        case .funcionario:
            operacoes = FuncionarioOperationType.allCases.map({
                $0.description
            })
        case .gerente:
            operacoes = GerenteOperationType.allCases.map({
                $0.description
            })
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nomeLabel.text = "Bem vindo(a), \(userController.usuario.getNome())."
        if let cliente = userController.usuario as? Cliente {
            nomeLabel.text = nomeLabel.text! + " Você tem \(cliente.getPontos()) pontos."
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let jogosWindow = segue.destination as? JogosViewController {
            if let catalogoType = sender as? CatalogoType {
                switch catalogoType {
                    
                case .alugar:
                    jogosWindow.alugar = true
                    let cliente = userController.usuario as! Cliente
                    jogosWindow.pontos = cliente.getPontos()
                    jogosWindow.jogos = userController.dataBase.getAllJogosEmEstoque()
                case .devolucao:
                    jogosWindow.devolver = true
                    jogosWindow.jogos = userController.dataBase.getAllJogosLocados()
                case .locados:
                    jogosWindow.jogos = userController.dataBase.getAllJogosLocados()
                }
            }
            else if let jogos = sender as? [Jogo]{
                jogosWindow.jogos = jogos
            }
            else {
                jogosWindow.jogos = userController.dataBase.getAllJogos()
            }
        }
        if let clientesWindow = segue.destination as? ClientesViewController {
            if let deletar = sender as? Bool {
                clientesWindow.deletar = deletar
            }
            clientesWindow.clientes = userController.dataBase.getAllClientes()
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

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operacoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "optionCell") as? OperationTableViewCell {
            cell.operationLabel.text = operacoes[indexPath.row]
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if userType == .cliente {
            if let clienteController = userController as? ClienteController {
                let operation = ClienteOperationType.allCases.filter({
                    $0.description == operacoes[indexPath.row]
                }).first
                
                if operation != nil {
                    switch operation! {
                        
                    case .alugarJogo:
                        clienteController.alugarJogo()
                    case .adquirirServico:
                        clienteController.adquirirServico()
                    case .doarJogo:
                        clienteController.doarJogo()
                    case .procurarJogo:
                        clienteController.procurarJogo()
                    case .verCatalogo:
                        clienteController.verCatalogoJogos()
                    case .consultarTransacoes:
                        print("Todo")
                    }
                }
            }
        }
        
        else if userType == .funcionario {
            if let funcionarioController = userController as? FuncionarioController {
                let operation = FuncionarioOperationType.allCases.filter({
                    $0.description == operacoes[indexPath.row]
                }).first
                
                if operation != nil {
                    switch operation! {
                        
                    case .removerJogo:
                        print("Todo")
                    case .adicionarJogo:
                        funcionarioController.adicionarJogo()
                    case .atualizarCatalogo:
                        print("Todo")
                    case .marcarDevolucao:
                        funcionarioController.marcarDevolucao()
                    case .verificarJogosLocados:
                        funcionarioController.verificarJogosLocados()
                    case .verificarClientesInadimplentes:
                        print("Todo")
                    case .deletarCliente:
                        funcionarioController.deletarCliente()
                    case .verCatalogo:
                        funcionarioController.verCatalogoJogos()
                    }
                }
            }
        }
        
        else if userType == .gerente {
            if let gerenteController = userController as? GerenteController {
                let operation = GerenteOperationType.allCases.filter({
                    $0.description == operacoes[indexPath.row]
                }).first
                
                if operation != nil {
                    switch operation! {
                        
                    case .removerJogo:
                        print("Todo")
                    case .adicionarJogo:
                        gerenteController.adicionarJogo()
                    case .atualizarCatalogo:
                        print("Todo")
                    case .marcarDevolucao:
                        gerenteController.marcarDevolucao()
                    case .verificarJogosLocados:
                        gerenteController.verificarJogosLocados()
                    case .verificarClientesInadimplentes:
                        print("Todo")
                    case .deletarCliente:
                        gerenteController.deletarCliente()
                    case .cancelarDoacao:
                        print("Todo")
                    case .cadastrarFuncionario:
                        gerenteController.cadastrarFuncionario()
                    case .cadastrarGerente:
                        print("Todo")
                    case .bloquearFuncionario:
                        print("Todo")
                    case .desbloquearFuncionario:
                        print("Todo")
                    case .procurarFuncionario:
                        print("Todo")
                    case .deletarFuncionario:
                        print("Todo")
                    case .verCatalogo:
                        gerenteController.verCatalogoJogos()
                    }
                }
            }
        }
    }
}
