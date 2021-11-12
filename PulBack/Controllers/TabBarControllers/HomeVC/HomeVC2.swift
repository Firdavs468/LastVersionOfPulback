//
//  HomeVC2.swift
//  PulBack
//
//  Created by Firdavs Zokirov  on 14/08/21.
//

import UIKit

class HomeVC2: UIViewController {

    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.register(CostsCell.nib(), forCellReuseIdentifier: CostsCell.identifier)
            tableView.register(ProductsCell.nib(), forCellReuseIdentifier: ProductsCell.identifier)
            tableView.register(MarketCell.nib(), forCellReuseIdentifier: MarketCell.identifier)
        }
    }
    @IBOutlet weak var pulBackLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarBackground()

    }
    func navBarBackground(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }

}
extension HomeVC2: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CostsCell.identifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductsCell.identifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
            
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: MarketCell.identifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
            
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{}
        else if indexPath.row == 1{}
        else{
            let vc = ServicesCenterVC(nibName: "ServicesCenterVC", bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
