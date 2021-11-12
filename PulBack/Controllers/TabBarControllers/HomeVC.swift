//
//  HomeVC.swift
//  PulBack
//
//  Created by Mirshod on 8/3/21.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.register(HomeTVC.nib(), forCellReuseIdentifier: HomeTVC.identifier)
            tableView.register(ProductsTVC.nib(), forCellReuseIdentifier: ProductsTVC.identifier)
            tableView.register(MarketTVC.nib(), forCellReuseIdentifier: MarketTVC.identifier)
            
        }
    }
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
extension HomeVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTVC.identifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTVC.identifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
            
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: MarketTVC.identifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
            
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            print("bir")
        }else if indexPath.row == 1{
            print("eqwe")
        }else {
            let vc = ServicesCenterVC(nibName: "ServicesCenterVC", bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
