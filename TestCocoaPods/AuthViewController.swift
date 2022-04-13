//
//  AuthViewController.swift
//  TestCocoaPods
//
//  Created by Алексеев on 12.04.2022.
//

import UIKit
import SwiftyJSON
import Alamofire
class AuthViewController: UIViewController {
    @IBOutlet weak var LoginTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AuthAction(_ sender: Any) {

        if !(LoginTextField.text!.isEmpty) && !(PasswordTextField.text!.isEmpty) {//оператор и - ||, && или
            let login = self.LoginTextField.text!
            let password = self.PasswordTextField.text!
            let url = "http://mad2019.hakta.pro/api/login/?login=\(login)&password=\(password)"
            AF.request(url, method: .get).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    self.alertControllers(title: "Успех", description: "Вы успешно авторизовались")
                print("JSON: \(json)")
                case .failure(let error):
                    print(error)
                    self.alertControllers(title: "Ошибка", description: "Пользователь с таким логином и паролем не найден")
                }
            }
            
        }else{
            alertControllers(title: "Ошибка", description: "Вы не ввели логин или пароль")
        }
        
    }
    
    @IBAction func goBackAction(_ sender: Any) {
        
        if LoginTextField.text!.isEmpty || PasswordTextField.text!.isEmpty{
            performSegue(withIdentifier: "openMainView", sender: self)
        }else{
            alertControllers(title: "Ошибка", description: "Поля перехода поля ввода должны быть пустыми.")
        }
        
    }
    func alertControllers(title: String, description: String) {
        PasswordTextField.text = ""
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
        alert.addAction(closeAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    


}
