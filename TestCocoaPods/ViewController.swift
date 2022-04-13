//
//  ViewController.swift
//  TestCocoaPods
//
//  Created by Алексеев on 11.04.2022.
//

import UIKit
import SwiftyJSON
import Alamofire
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    

    

    

    
    @IBOutlet weak var TableView: UITableView!
    

    
    
    
    struct Info{
        var firstName = ""
        var secondName = ""
        var description = ""
        var urlImage = ""
    }
    
    var infoArray: [Info] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       TableView.delegate = self
       TableView.dataSource = self
        getInfo()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
       cell.FirstNameLabel.text = infoArray[indexPath.row].firstName
       cell.SecondNameLabel.text = infoArray[indexPath.row].secondName
        cell.descriptionLabel.text = infoArray[indexPath.row].description
        
        var url = URL(string: infoArray[indexPath.row].urlImage)
        if let data = try? Data(contentsOf: url!){
            cell.iconImageView.image = UIImage(data: data)
        }
        return cell
    }

    func getInfo(){
        let url = "http://mad2019.hakta.pro/api/wanted"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for i in 0..<json["data"].count{
                    self.infoArray.append(Info(firstName: json["data"][i]["first_name"].stringValue, secondName: json["data"][i]["last_name"].stringValue, description: json["data"][i]["description"].stringValue, urlImage: json["data"][i]["photo"].stringValue))
                }
                self.TableView.reloadData()
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }

}

