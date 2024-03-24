//
//  ViewController.swift
//  NetworkSwift
//
//  Created by Nidhi on 09/03/24.
//

import UIKit

enum GHError:Error{
    case invalidUrl
    case invalidResponse
    case invalidData
}

struct GithubUser:Codable{
    let login:String
    let avatarUrl:String
    let bio:String
}

class ViewController: UIViewController {
    
    var user:GithubUser?

    override func viewDidLoad()  {
        super.viewDidLoad()
       
        serviceCall()
       print("user",user)
    }
    
    func serviceCall(){
        
        
        func apiCall() async throws {
            do {
                user = try await getUser()
                print("user",user)
            }catch GHError.invalidUrl {
               print("invalid URL")
            }catch GHError.invalidResponse {
                print("invalid Response")
            }catch GHError.invalidData {
                print("invalid Data")
            } catch {
                print("unexpected error")
            }
        }
        
        
        
    }
  
    
}

//Service
extension ViewController {
    
    func getUser() async throws -> GithubUser {
        
        let endpoint = "https://api.github.com/users/NidhiOjha036"
        guard let url = URL(string: endpoint) else { throw GHError.invalidUrl }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
            throw GHError.invalidResponse
        }
        
        do {
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GithubUser.self, from: data)
            
        }catch {
            throw GHError.invalidData
        }
        
    }
    
}

