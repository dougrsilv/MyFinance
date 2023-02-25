//
//  InitialFinanceView.swift
//  MyFinances
//
//  Created by Douglas  Rodrigues  on 20/02/23.
//

import UIKit

protocol InitialFinanceViewDelegate: AnyObject {
    func recipeButton()
    func expenseButton()
}

class InitialFinanceView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: InitialFinanceViewDelegate?

    lazy var balanceView: BalanceView = {
        let balanceView = BalanceView()
        balanceView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        return balanceView
    }()
    
    lazy var suggestionView: SuggestionView = {
        let suggestionView = SuggestionView()
        return suggestionView
    }()
    
    lazy var buttonsView: ButtonsView = {
        let buttonsView = ButtonsView()
        buttonsView.heightAnchor.constraint(equalToConstant: 73).isActive = true
        return buttonsView
    }()
    
    lazy var budgetView: BudgetView = {
        let view = BudgetView()
        view.heightAnchor.constraint(equalToConstant: 278).isActive = true
        return view
    }()
    
    lazy var cardsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [balanceView, buttonsView, budgetView])
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
      }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
      }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buttonsView.delegate = self
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(cardsStackView)
        contentView.addSubview(suggestionView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        cardsStackView.translatesAutoresizingMaskIntoConstraints = false
        cardsStackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        cardsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        cardsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        suggestionView.translatesAutoresizingMaskIntoConstraints = false
        suggestionView.topAnchor.constraint(equalTo: budgetView.bottomAnchor, constant: 36).isActive = true
        suggestionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        suggestionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        suggestionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -86).isActive = true
        suggestionView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Delegate

extension InitialFinanceView: ButtonsViewDelegate {
    func recipeButton() {
        delegate?.recipeButton()
    }
    
    func expenseButton() {
        delegate?.expenseButton()
    }
}
