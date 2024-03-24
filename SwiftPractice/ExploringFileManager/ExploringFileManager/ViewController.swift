//
//  ViewController.swift
//  ExploringFileManager
//
//  Created by Nidhi on 18/02/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = FileManager.default
        
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        print("path",url.path)
        let newFolderUrl = url.appendingPathComponent("ios-academy")
        
        do {
            
            try  manager.createDirectory(
                at: newFolderUrl,
                withIntermediateDirectories: true,
                attributes: [:])
            
        }catch {
            print(error)
        }
        
       
    }


}

