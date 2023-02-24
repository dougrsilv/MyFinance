//
//  SuggestionView.swift
//  MyFinances
//
//  Created by Douglas  Rodrigues  on 24/02/23.
//

import UIKit

class SuggestionView: UIView {
    
    // MARK: - Properties
    
    lazy var imageSuggestionImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "emojione_light-bulb")
        return image
    }()
    
    lazy var titleSuggestionLabel: UILabel = {
        let label = UILabel()
        label.text = "Sugestão"
        label.font = UIFont(name: "Roboto-Bold", size: 16)
        label.textColor = UIColor(red: 0.302, green: 0.362, blue: 0.896, alpha: 1)
        return label
    }()
    
    lazy var textSuggestionLabel: UILabel = {
        let label = UILabel()
        label.text = "Crie seu orçamento para facilitar a \n visualização de suas metas"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto-Bold", size: 16)
        label.textColor = UIColor(red: 0.331, green: 0.338, blue: 0.363, alpha: 1)
        return label
    }()
    
    lazy var cardSuggestionView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.backgroundColor = UIColor(red: 0.302, green: 0.362, blue: 0.896, alpha: 0.1).cgColor
        view.heightAnchor.constraint(equalToConstant: 120).isActive = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(cardSuggestionView)
        cardSuggestionView.addSubview(imageSuggestionImage)
        cardSuggestionView.addSubview(titleSuggestionLabel)
        cardSuggestionView.addSubview(textSuggestionLabel)
        
        cardSuggestionView.translatesAutoresizingMaskIntoConstraints = false
        cardSuggestionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardSuggestionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cardSuggestionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cardSuggestionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        imageSuggestionImage.translatesAutoresizingMaskIntoConstraints = false
        imageSuggestionImage.topAnchor.constraint(equalTo: cardSuggestionView.topAnchor, constant: 24).isActive = true
        imageSuggestionImage.leadingAnchor.constraint(equalTo: cardSuggestionView.leadingAnchor, constant: 131).isActive = true

        titleSuggestionLabel.translatesAutoresizingMaskIntoConstraints = false
        titleSuggestionLabel.topAnchor.constraint(equalTo: cardSuggestionView.topAnchor, constant: 22).isActive = true
        titleSuggestionLabel.leadingAnchor.constraint(equalTo: imageSuggestionImage.trailingAnchor, constant: 5).isActive = true

        textSuggestionLabel.translatesAutoresizingMaskIntoConstraints = false
        textSuggestionLabel.centerXAnchor.constraint(equalTo: cardSuggestionView.centerXAnchor).isActive = true
        textSuggestionLabel.topAnchor.constraint(equalTo: titleSuggestionLabel.bottomAnchor, constant: 4).isActive = true
        textSuggestionLabel.bottomAnchor.constraint(equalTo: cardSuggestionView.bottomAnchor, constant: -22).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
