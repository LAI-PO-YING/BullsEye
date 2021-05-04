//
//  AuthorViewController.swift
//  BullsEye
//
//  Created by Lai Po Ying on 2021/5/3.
//

import UIKit

class AuthorViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.layer.cornerRadius = 90
        photoImageView.layer.borderWidth = 1

    }
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
