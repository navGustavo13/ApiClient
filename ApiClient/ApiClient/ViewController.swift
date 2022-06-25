//
//  ViewController.swift
//  ApiClient
//
//  Created by Gustavo Navarro on 25/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let apiClient = APIClient()

        apiClient.getSlackConversations { result in
            print("Datamodel \(result) ")
        }
    }
}
