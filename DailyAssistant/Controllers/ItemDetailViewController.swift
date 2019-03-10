//
//  ItemDetailViewController.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 3/10/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import UserNotifications

private enum EditMode: String {
    case edit = "Edit"
    case done = "Done"
    public func updateBarButtonTile() -> String {
        switch self {
        case .done:
            return "Edit"
        case .edit:
            return "Done"
        }
    }
}

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var itemTitleTextView: UITextView!
    @IBOutlet weak var itemDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
