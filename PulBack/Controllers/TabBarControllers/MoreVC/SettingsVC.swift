//
//  SettingsVC.swift
//  Pulback
//
//  Created by Firdavs Zokirov  on 04/08/21.
//

import UIKit


class SettingsVC: UIViewController {
    
    
    @IBOutlet weak var table_view: UITableView!{
        didSet{
            table_view.delegate = self
            table_view.dataSource = self
            table_view.register(SettingsCell.nib(), forCellReuseIdentifier: SettingsCell.identifier)
            table_view.rowHeight = 80
            table_view.separatorStyle = .none
        }
    }
    
    var lblsArr = [
    "Savollarga tavsiyalar",
        "PulBack haqida",
        "Dastur reytingi",
        "Fikringizni qoldiring",
        "Xuquqiy malumotlar"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.title = "New Order"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.largeTitleDisplayMode = .automatic
//
//
        let attrs = [
          NSAttributedString.Key.font: UIFont(name: "Futura-Bold", size: 27)!
        ]

        UINavigationBar.appearance().titleTextAttributes = attrs
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.navigationBar.prefersLargeTitles = false
//    }
//
//    override func willMove(toParent parent: UIViewController?) {
//        navigationController?.navigationBar.prefersLargeTitles = true
    //    }
    
    
    @IBAction func logOutBtnPressed(_ sender: Any) {
        let vc = logOutVC(nibName: "logOutVC", bundle: nil)
//        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
   
    
}

extension SettingsVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table_view.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as! SettingsCell
        cell.updateCell(imgIcon: AppIcon.settingsCellImages[indexPath.row], label: lblsArr[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
  
    
}
