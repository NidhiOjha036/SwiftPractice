//
//  UserViewModel.swift
//  AsyncAwaitProj
//
//  Created by Nidhi on 24/03/24.
//

import Foundation

protocol UserServices:AnyObject {
    func reloadData()
}

class ViewModel {
    
    var users:[UserModel] = [] {
        
        didSet {
            self.userDelegate?.reloadData()
        }
        
    }
    
    private let manager = APIManager()
    weak var userDelegate:UserServices?
    
    @MainActor func fetchUsers() {
        Task {
            do {
                let userResponseArray:[UserModel] = try await manager.getRequest(url: "\(BaseApi.baseApi ?? "")users")
                self.users = userResponseArray
            }catch {
                print(error)
            }
        }
    }
    
    
}
