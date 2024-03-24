//
//  ViewController.swift
//  ProtocolsSwiftProj
//
//  Created by Nidhi on 18/03/24.
//

import UIKit

////required
//protocol ViewControllerDataDelegate : AnyObject {
//    func getInfo(str:String)
//    func getError(str:String)
//}
//
////optional
//extension ViewControllerDataDelegate {
//    func getError(str:String) {
//        
//    }
//}

protocol ViewControllerDataDelegate : AnyObject {
    func getInfo(str:String)
}

protocol ViewControllerErrorDelegate:AnyObject{
    func getError(str:String)
}
//composition protolcol
protocol ViewControllerDelegate:ViewControllerDataDelegate,ViewControllerErrorDelegate{
    
}


class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
            else { return }
        vc.delegate = self
        self.present(vc, animated: true)
        }
    
    }



extension ViewController:ViewControllerDelegate {
    func getError(str: String) {
        lbl.text = str
    }
    
    func getInfo(str: String) {
        lbl.text = str
    }
    
    
}

