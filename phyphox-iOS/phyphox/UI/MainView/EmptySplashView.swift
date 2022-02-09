//
//  EmptySplashView.swift
//  phyphox
//
//  Created by Rahul on 25/10/21.
//  Copyright © 2021 RWTH Aachen. All rights reserved.
//

import UIKit

final class EmptySplashView: UIView {
        
    var onWebLinkCallback: (() -> Void)?
    
    private let mainLogoImageView : UIImageView = AppCustomViews.getImageView()
    
    private let nameLabel : UILabel = AppCustomViews.getLabel(font: UIFont(name: "Roboto-Bold", size: 18)!, textColor: .white)

    private let webLinkButton : UIButton = AppCustomViews.getButton(title: localize("emptySpalshWebLink"), font: UIFont(name: "Roboto-Bold", size: 22)!)
    
    private let stackView: UIStackView = AppCustomViews.getStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        webLinkButton.addTarget(self, action: #selector(EmptySplashView.webLinkButtonPressed), for: .touchUpInside)
        
        nameLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30, enableInsets: false)
        
        webLinkButton.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30, enableInsets: false)
        
        let spacer = AppCustomViews.getSpacerView()
        spacer.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        mainLogoImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 250, enableInsets: false)
        
        
        stackView.addArrangedSubview(mainLogoImageView)
        stackView.addSubview(spacer)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(webLinkButton)
        stackView.addSubview(AppCustomViews.getSpacerView())
        
        addSubview(stackView)
        
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
        nameLabel.text = localize("emptySpalshBeginExploration")
        mainLogoImageView.image = UIImage(named: "Vizeey_splash_logo-1")
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    @objc func webLinkButtonPressed() {
        onWebLinkCallback?()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

struct AppCustomViews {
    
    // create spacer view programmatically
    static func getSpacerView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }
    
    // create button programmatically
    static func getButton(title: String, font: UIFont = UIFont.systemFont(ofSize: 22, weight: .semibold)) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: UIControl.State())
        button.backgroundColor = .clear
        button.titleLabel?.font = font
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(kRWTHBlue, for: .highlighted)
        return button
    }
    
    // create imageview programmatically
    static func getImageView() -> UIImageView {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        //img.layer.cornerRadius = 10
        img.clipsToBounds = true
        return img
    }

    // create label programmatically with changing font, lines, text color and alignment
    static func getLabel(font: UIFont = UIFont.systemFont(ofSize: 20, weight: .semibold), numberOfLines: Int = 0, textColor: UIColor = .black, textAlignment: NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor =  textColor
        label.sizeToFit()
        label.numberOfLines = numberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = textAlignment
        return label
    }

    // create stackview programmatically with changing spacing between subviews and axis direction
    static func getStackView(spacing: CGFloat = 30.0, axis: NSLayoutConstraint.Axis = .vertical) -> UIStackView {
        let stackViewIdType = UIStackView()
        stackViewIdType.axis = axis
        stackViewIdType.spacing = spacing
        stackViewIdType.distribution = .fillProportionally
        stackViewIdType.translatesAutoresizingMaskIntoConstraints = false
        return stackViewIdType
    }
}
