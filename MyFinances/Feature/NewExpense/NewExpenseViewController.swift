//
//  NewExpenseViewController.swift
//  MyFinances
//
//  Created by Douglas  Rodrigues  on 23/02/23.
//

import UIKit

class NewExpenseViewController: UIViewController {
    
    // MARK: Properties
    
    let newExpenseView = NewExpenseView()
    
    lazy var saveRecipeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Salvar", for: .normal)
        button.setTitleColor(UIColor(red: 0.302, green: 0.362, blue: 0.896, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var closeRecipeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Vector"), for: .normal)
        button.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: Lifecycle
    
    override func loadView() {
        view = newExpenseView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor.white

        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        
        view.backgroundColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1)
        
        self.title = "Nova Receita"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isTranslucent = false
        configureUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        alertNumber(title: "Alerta", message: "deseja cancelar?")
    }
    
    // MARK: - Fuctions
    
    func configureUI() {
        navigationController?.navigationBar.addSubview(saveRecipeButton)
        navigationController?.navigationBar.addSubview(closeRecipeButton)
        
        let targetView = self.navigationController?.navigationBar
        
        closeRecipeButton.translatesAutoresizingMaskIntoConstraints = false
        let closeLeadingContraint = NSLayoutConstraint(item: closeRecipeButton,
                                                       attribute: .leadingMargin,
                                                       relatedBy: .equal,
                                                       toItem: targetView,
                                                       attribute: .leadingMargin,
                                                       multiplier: 1.0,
                                                       constant: 16)
        
        let closeTopConstraint = NSLayoutConstraint(item: closeRecipeButton,
                                                    attribute: .top,
                                                    relatedBy: .equal,
                                                    toItem: targetView,
                                                    attribute: .top,
                                                    multiplier: 1.0,
                                                    constant: 18)
        
        NSLayoutConstraint.activate([closeLeadingContraint, closeTopConstraint])
        
        saveRecipeButton.translatesAutoresizingMaskIntoConstraints = false
        let saveTrailingContraint = NSLayoutConstraint(item: saveRecipeButton,
                                                       attribute: .trailingMargin,
                                                       relatedBy: .equal,
                                                       toItem: targetView,
                                                       attribute: .trailingMargin,
                                                       multiplier: 1.0,
                                                       constant: -16)
        
        let saveTopConstraint = NSLayoutConstraint(item: saveRecipeButton,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: targetView,
                                                   attribute: .top,
                                                   multiplier: 1.0, constant: 9)
        
        NSLayoutConstraint.activate([saveTrailingContraint, saveTopConstraint])
    }
    
    func alertNumber(title: String, message: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        controller.addAction(.init(title: "não", style: .default))
        controller.addAction(.init(title: "sim", style: .default, handler: { alert in
            self.dismiss(animated: true)
        }))
        present(controller, animated: true)
    }
    
    
    @objc func rightButtonTapped() {
        
    }
    
    @objc func leftButtonTapped() {
        alertNumber(title: "Alerta", message: "deseja cancelar?")
    }
    
}
