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
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true
        imageView.image = UIImage.init(named: "icons8-example-500")
        return imageView
    }()
    
    public lazy var weatherDay: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        label.text = "Day of Week"
        return label
    }()
    
    public lazy var weatherHigh: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        label.text = "high weather"
        return label
    }()
    
    public lazy var weatherLow: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        label.text = "low weather"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .yellow
        addSubview(weatherDay)
        addSubview(weatherImage)
        addSubview(weatherHigh)
        addSubview(weatherLow)
        setUpView()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpView(){
        
        
        weatherDay.translatesAutoresizingMaskIntoConstraints = false
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        weatherHigh.translatesAutoresizingMaskIntoConstraints = false
        
        weatherLow.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([ weatherDay.topAnchor.constraint(equalTo: self.topAnchor, constant: 11), weatherDay.leadingAnchor.constraint(equalTo: self.leadingAnchor), weatherDay.trailingAnchor.constraint(equalTo: self.trailingAnchor),weatherDay.centerXAnchor.constraint(equalTo: self.centerXAnchor), weatherImage.topAnchor.constraint(equalTo: weatherDay.bottomAnchor, constant: 11), weatherImage.leadingAnchor.constraint(equalTo: self.leadingAnchor), weatherImage.widthAnchor.constraint(equalToConstant: 100), weatherImage.heightAnchor.constraint(equalToConstant: 100),
                                      weatherHigh.centerYAnchor.constraint(equalTo: weatherImage.centerYAnchor, constant: -20), weatherHigh.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor, constant: 12), weatherHigh.trailingAnchor.constraint(equalTo: self.trailingAnchor), weatherLow.centerXAnchor.constraint(equalTo: weatherHigh.centerXAnchor),
                                      weatherLow.widthAnchor.constraint(equalTo: weatherHigh.widthAnchor), weatherLow.heightAnchor.constraint(equalTo: weatherHigh.heightAnchor), weatherLow.topAnchor.constraint(equalTo: weatherHigh.bottomAnchor, constant: 11)
            ])
    }
    
}
