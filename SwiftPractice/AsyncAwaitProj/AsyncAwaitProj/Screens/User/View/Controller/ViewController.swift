//
//  ViewController.swift
//  AsyncAwaitProj
//
//  Created by Nidhi on 24/03/24.
//

import UIKit

class ViewController: UIViewController {

    var viewmodel = ViewModel()
    var productViewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewModel()
        
    }
    
    func initViewModel(){
        viewmodel.userDelegate = self
        productViewModel.delegate = self
        viewmodel.fetchUsers()
        productViewModel.fetchProduct()
    }


}

extension ViewController : UserServices{
    func reloadData() {
        print("users",viewmodel.users)
    }
    
    
}

extension ViewController: ProductDelegate {
    func productReloadData() {
        print("product",productViewModel.product)
    }
}
