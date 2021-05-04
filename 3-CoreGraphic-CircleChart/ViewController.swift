//
//  ViewController.swift
//  3-CoreGraphic-CircleChart
//
//  Created by Long Nguyễn on 04/05/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contentView: ViewDesignable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func handleButton(_ button: ButtonDesginable) {
        if button.isAddButton {
            contentView.counter += 1
        } else {
            if contentView.counter > 0 {
                contentView.counter -= 1
            }
        }
    }
    
}

