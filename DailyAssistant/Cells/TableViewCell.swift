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
           
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.contentView.addSubview(eventImageView)
        containerView.addSubview(eventTitle)
        containerView.addSubview(eventAddress)
        self.contentView.addSubview(containerView)
    }
    
    
    // TO-DO's similat to Weather App set up an image that matches the event/ city 
    public lazy var eventImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true
        imageView.image = UIImage.init(named: "icons8-example-500")
        return imageView
    }()
    public lazy var eventTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        label.text = "titulo del evento"
        return label
    }()
    
    public lazy var eventAddress: UITextView = {
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
    
    func setUpView() {
        addSubview(containerView)
         containerView.translatesAutoresizingMaskIntoConstraints = false
        eventImageView.translatesAutoresizingMaskIntoConstraints = false
        eventTitle.translatesAutoresizingMaskIntoConstraints = false
        eventAddress.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([ containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor), containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10), containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10), containerView.heightAnchor.constraint(equalToConstant: 40), eventTitle.topAnchor.constraint(equalTo: self.containerView.topAnchor), eventTitle.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor), eventTitle.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
                                      eventAddress.topAnchor.constraint(equalTo: self.eventTitle.bottomAnchor), eventAddress.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor), eventAddress.topAnchor.constraint(equalTo: self.eventTitle.bottomAnchor), eventAddress.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor), eventImageView.widthAnchor.constraint(equalToConstant: 26), eventImageView.heightAnchor.constraint(equalToConstant: 26), eventImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20), eventImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
            
                                      ])

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
