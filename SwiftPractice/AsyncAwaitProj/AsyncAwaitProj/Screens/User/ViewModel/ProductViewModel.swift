//
//  ProductViewModel.swift
//  AsyncAwaitProj
//
//  Created by Nidhi on 24/03/24.
//

import Foundation

protocol ProductDelegate : AnyObject{
    func productReloadData()
}

class ProductViewModel {
    
    
    var product:AddProduct? {
        didSet {
            delegate?.productReloadData()
        }
    }
    
    private let manager = APIManager()
    weak var delegate:ProductDelegate?
    
    
   @MainActor func fetchProduct() {
        let obj = AddProduct(title: "BMW Car")
        
        Task {
            do {
                let product:AddProduct = try await manager.postRequest(url: "https://dummyjson.com/products/add", parameters: obj)
                self.product = product
            }catch {
                print(error)
            }
        }
        
        
    }
    
}
