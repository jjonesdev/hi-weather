//
//  CardBackgroundDecoratorView.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/22/21.
//

import UIKit

final class CardBackgroundDecoratorView: UICollectionReusableView, ReuseIdentifiable {
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleAsCard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
