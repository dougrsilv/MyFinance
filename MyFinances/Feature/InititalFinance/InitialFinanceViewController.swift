//
//  InitialFinanceViewController.swift
//  MyFinances
//
//  Created by Douglas  Rodrigues  on 20/02/23.
//

import UIKit

class InitialFinanceViewController: UIViewController {
    
    // MARK: - Properties
    
    let initialFinanceView = InitialFinanceView()
    
    override func loadView() {
        view = initialFinanceView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialFinanceView.delegate = self
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor.white

        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        
        view.backgroundColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1)
        title = "Minhas Finanças" 
    }
}

// MARK: - InitialFinanceViewDelegate

extension InitialFinanceViewController: InitialFinanceViewDelegate {
    func recipeButton() {
        let recipe = NewRecipeViewController()
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: recipe)
        navigationController?.present(navBarOnModal, animated: true)
    }
    
    func expenseButton() {
        let recipe = NewExpenseViewController()
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: recipe)
        navigationController?.present(navBarOnModal, animated: true)
    }
}
