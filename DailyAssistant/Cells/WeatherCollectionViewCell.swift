//
//  WeatherCollectionViewCell.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 3/5/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    public lazy var weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true
        imageView.image = UIImage.init(named: "icons8-example-500")
        return imageView
    }()
    
    public lazy var weatherDay: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        label.text = "Day of Week"
        return label
    }()
    
    public lazy var weatherHigh: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        label.text = "high weather"
        return label
    }()
    
    public lazy var weatherLow: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        label.text = "low weather"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow 
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpView(){
        weatherDay.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([ weatherDay.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor), weatherDay.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12), weatherDay.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12), weatherDay.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
}
