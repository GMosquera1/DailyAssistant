//
//  WeatherCollectionViewCell.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 3/5/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    
    public lazy var weatherCity: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.font = UIFont.init(name: "thonburi", size: 16)
        label.textColor = .white
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3493953339)
        label.textAlignment = .center
        label.text = "Name of the City "
        return label
    }()
    
    public lazy var weatherDay: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.font = UIFont.init(name: "thonburi", size: 16)
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.text = "Day of Week"
        return label
    }()
    public lazy var weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true
        imageView.image = UIImage.init(named: "icons8-example-500")
        return imageView
    }()
    
    public lazy var weatherHigh: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.font = UIFont.init(name: "thonburi", size: 14)
        label.textColor = .white
        label.backgroundColor = .clear
        label.text = "high weather"
        return label
    }()
    
    public lazy var weatherLow: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.font = UIFont.init(name: "thonburi", size: 14)
        label.textColor = .white
        label.backgroundColor = .clear
        label.text = "low weather"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .clear
        addSubview(weatherCity)
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
        
        weatherCity.translatesAutoresizingMaskIntoConstraints = false
        
        weatherDay.translatesAutoresizingMaskIntoConstraints = false
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
                
        weatherHigh.translatesAutoresizingMaskIntoConstraints = false
        
        weatherLow.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([ weatherCity.topAnchor.constraint(equalTo: self.topAnchor, constant: 0), weatherCity.leadingAnchor.constraint(equalTo: self.leadingAnchor), weatherCity.trailingAnchor.constraint(equalTo: self.trailingAnchor), weatherCity.centerXAnchor.constraint(equalTo: self.centerXAnchor) ,weatherDay.topAnchor.constraint(equalTo: weatherCity.bottomAnchor, constant: 15), weatherDay.leadingAnchor.constraint(equalTo: self.leadingAnchor), weatherDay.trailingAnchor.constraint(equalTo: self.trailingAnchor),weatherDay.centerXAnchor.constraint(equalTo: self.centerXAnchor), weatherImage.topAnchor.constraint(equalTo: weatherDay.bottomAnchor, constant: 11), weatherImage.leadingAnchor.constraint(equalTo: self.leadingAnchor), weatherImage.widthAnchor.constraint(equalToConstant: 55), weatherImage.heightAnchor.constraint(equalToConstant: 55),
                                      weatherHigh.centerYAnchor.constraint(equalTo: weatherImage.centerYAnchor, constant: -20), weatherHigh.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor, constant: 6), weatherHigh.trailingAnchor.constraint(equalTo: self.trailingAnchor), weatherLow.centerXAnchor.constraint(equalTo: weatherHigh.centerXAnchor),
                                      weatherLow.widthAnchor.constraint(equalTo: weatherHigh.widthAnchor), weatherLow.heightAnchor.constraint(equalTo: weatherHigh.heightAnchor), weatherLow.topAnchor.constraint(equalTo: weatherHigh.bottomAnchor, constant: 11)
            ])
    }
    
}
