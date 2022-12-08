//
//  ViewController.swift
//  USPopulation
//
//  Created by Trycatch AIr 12 on 17/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoimg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logoimg.isHidden = true
        do
        {
            sleep(2)
        }
        let vc = storyboard?.instantiateViewController(withIdentifier: "YearVC") as! YearVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

