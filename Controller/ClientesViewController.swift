

import UIKit

class ClientesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var clientes: [Cliente]!
    var deletar = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
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

extension ClientesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clientes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "clienteCell") as? ClienteTableViewCell {
            cell.nomeLabel.text = clientes[indexPath.row].getNome()
            cell.emailLabel.text = clientes[indexPath.row].getEmail()
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension ClientesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if deletar {
            let alert = UIAlertController(title: "Você tem certeza que quer deletar esse cliente?", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Não", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Sim", style: .default, handler: { action in
                if let back = self.navigationController?.viewControllers[1] as? MainViewController {
                    back.userController.dataBase.usuarios[self.clientes[indexPath.row].getEmail()] = nil
                }
                self.clientes.remove(at: indexPath.row)
                self.tableView.reloadData()
            }))
            present(alert, animated: true)
        }
    }
}
