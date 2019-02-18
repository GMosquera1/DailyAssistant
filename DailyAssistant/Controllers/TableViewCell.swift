//
//  TableViewCell.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/12/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var events: Events? {
        didSet {
           // favesImageView.image = events?.eventImage
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // TO-DO's similat to Weather App set up an image that matches the event/ city 
    public lazy var favesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "icons8-example-500")
       return imageView
    }()
    
    public lazy var faveAddress: UITextView = {
       let faveAddress = UITextView()
        faveAddress.text = "RESTAURANT'S ADDRESS GOES HERE"
        return faveAddress
    }()
    
    public lazy var containerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
//    func setUpView() {
//        addSubview()
//
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
