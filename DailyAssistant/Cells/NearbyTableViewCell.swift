//
//  NearbyTableViewCell.swift
//  DailyAssistant
//
//  Created by Genesis Mosquera on 2/26/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class NearbyTableViewCell: UITableViewCell {

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
        
        self.contentView.addSubview(weatherImage)
        containerView.addSubview(weatherHigh)
        containerView.addSubview(weatherLow); self.contentView.addSubview(containerView)
    }
    
    
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
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        weatherDay.translatesAutoresizingMaskIntoConstraints = false
        
        weatherHigh.translatesAutoresizingMaskIntoConstraints = false
        
        weatherLow.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10), containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10), containerView.heightAnchor.constraint(equalToConstant: 40), weatherDay.topAnchor.constraint(equalTo: self.containerView.topAnchor), weatherDay.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor), weatherDay.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),weatherHigh.topAnchor.constraint(equalTo: weatherDay.bottomAnchor), weatherHigh.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor), weatherHigh.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor) , weatherLow.topAnchor.constraint(equalTo: weatherHigh.bottomAnchor),weatherLow.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor), weatherLow.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor), weatherLow.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor)
        ])
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
}

}
