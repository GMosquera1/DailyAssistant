//
//  AgendaCollectionViewController.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/28/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

private let reuseIdentifier = "AgendaCollectionViewCell"

class AgendaCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
let some = NearbyView()
    override func viewDidLoad() {
        super.viewDidLoad()
     //vi
    //view.addSubview(some)
    collectionView?.backgroundColor = #colorLiteral(red: 1, green: 0.7026927471, blue: 0, alpha: 1)

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.isPagingEnabled = true

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        //cell.backgroundColor = indexPath.item % 2 == 0 ? #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1) : #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        //cell.contentView.accessibilityIdentifier.
//        cell.backgroundColor = indexPath[0] == 0 ? .red : .white
//        cell.backgroundColor = indexPath[1] == 1 ? .blue : .yellow
        //return cell
        if indexPath.item == 0 {
           
            //var cell = some.tableView.dequeueReusableCell(withIdentifier: "NearbyTableViewCell", for: indexPath)

//            switch indexPath.item {
//            case 0:
//                return collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
//            default:
//                return collectionView.dequeueReusableCell(withReuseIdentifiimijer: "", for: indexPath)
//            }
        //}
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .red
            
        return cell
    }
        if indexPath.item == 2 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//            cell.backgroundColor = .blue
//
//            return cell
            view.addSubview(some)
        }
        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            cell.backgroundColor = .orange

            return  cell
            
        }
        if indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            cell.backgroundColor = .green
            
            return cell
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
//    override func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
//let cell = collectionView.cellForItem(at: index[0])
//
//    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
