//
//  BenevitsController.swift
//  NexiaTest
//
//  Created by icarus on 07/02/23.
//

import UIKit
import SkeletonView

class BenevitsController: UIViewController {
    private let table : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(CollectonTableViewCell.self,
                       forCellReuseIdentifier: CollectonTableViewCell.identifier)
        return table
    }()
    private var models = [CellModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        setUpModels()
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
    }

    @IBAction func buttonClicked(_ sender: Any) {
        print("open side menu")
    }
    

    private func setUpModels(){
        models.append(.collectionView(models: [CollectionTableCellModel(
                                                tile: "eva01", image: "eva01"),
                                               CollectionTableCellModel(
                                                tile: "eva02", image: "eva02"),
                                               CollectionTableCellModel(
                                                tile: "eva03", image: "eva03"),
                                               CollectionTableCellModel(
                                                tile: "eva04", image: "eva04"),
                                               CollectionTableCellModel(
                                                tile: "eva05", image: "eva05"),
                                               CollectionTableCellModel(
                                                tile: "eva06", image: "eva06"),
        ], rows: 3))
        models.append(.list(models: [
                                ListCellModel(title: "Benevits"),
                                ListCellModel(title: "Logout"),
                                
        ]))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
}

extension BenevitsController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch models[section]{
        case .list(let models ): return models.count
        case .collectionView(_ , _): return 1
        }
   }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      switch models[indexPath.section]{
        case .list(let models ):
            let model = models[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = model.title
            return cell
            
        case .collectionView(let models, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: CollectonTableViewCell.identifier,
                                    for: indexPath) as! CollectonTableViewCell
            cell.configure(with: models)
            cell.delegate = self
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let indexPosition = (indexPath.section, indexPath.row)
        switch indexPosition{
        case (1,0):
            print("unclock benevits")
        case (1,1):
            
        UserDefaults.standard.removeObject(forKey: "userName")
        UserDefaults.standard.removeObject(forKey: "password")

        //performSegue(withIdentifier: "toFirstVC", sender: nil)
            
            
            let alert = UIAlertController(title: "Exito", message: "Has cerrado sesiòn exitosamente", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            }
            alert.addAction(okButton)
            navigationController?.pushViewController(ViewController(), animated: true)
            self.present(alert, animated: true, completion: nil)

            
        case (_, _):
            print("nothing hapen")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section]{
        case .list(_): return 50
        case .collectionView(_, let rows): return 180 * CGFloat(rows)
        }

    }
}


extension BenevitsController: CollectionTableCellDelegate{
    func didSelectItem(with model: CollectionTableCellModel) {
        print("Selected: \(model.tile)")
    }
}
