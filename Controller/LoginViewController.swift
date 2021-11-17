

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    var dataBase: DataBase!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataBase = DataBase()
        dataBase.initFakeBD()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        nomeTextField.text = ""
        senhaTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let window = segue.destination as? MainViewController {
            if let usuarioController = sender as? UsuarioController {
                usuarioController.viewController = window
                window.userController = usuarioController
                window.userType = usuarioController.usuario.getUsuarioType()
            }
        }
    }

    @IBAction func loginAction(_ sender: UIButton) {
        if UsuarioController.efetuarLogin(dataBase: dataBase, email: nomeTextField.text!, senha: senhaTextField.text!, userType: .cliente) {
            performSegue(withIdentifier: "loginAction", sender: ClienteController(usuario: dataBase.getCliente(email: nomeTextField.text!)!, dataBase: dataBase, viewController: nil))
        }
        else if UsuarioController.efetuarLogin(dataBase: dataBase, email: nomeTextField.text!, senha: senhaTextField.text!, userType: .funcionario) {
            performSegue(withIdentifier: "loginAction", sender: FuncionarioController(usuario: dataBase.getUsuário(email: nomeTextField.text!)!, dataBase: dataBase, viewController: nil))
        }
        else if UsuarioController.efetuarLogin(dataBase: dataBase, email: nomeTextField.text!, senha: senhaTextField.text!, userType: .gerente) {
            performSegue(withIdentifier: "loginAction", sender: GerenteController(usuario: dataBase.getUsuário(email: nomeTextField.text!)!, dataBase: dataBase, viewController: nil))
        }
    }
    
    @IBAction func cadastrarAction(_ sender: UIButton) {
    }
    
    
}

