//
//  HomeViewController.swift
//  ProtocolsSwiftProj
//
//  Created by Nidhi on 19/03/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var tfInfo: UITextField!
    weak var delegate:ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    


    @IBAction func btnBackTapped(_ sender: UIButton) {
        delegate?.getInfo(str: tfInfo.text!)
        dismiss(animated: true)
    }
    
    
    
    
}
