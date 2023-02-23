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
    
    let cell = "cell"
    
    lazy var titleMyBalaceLabel: UILabel = {
        let label = UILabel()
        label.text = "Meu Saldo"
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = UIColor(red: 0.633, green: 0.633, blue: 0.633, alpha: 1)
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "R$ 1.000,00"
        label.font = UIFont(name: "Roboto-Bold", size: 32)
        label.textColor = UIColor(red: 0.325, green: 0.352, blue: 0.433, alpha: 1)
        return label
    }()
    
    lazy var updateLabel: UILabel = {
        let label = UILabel()
        label.text = "Última atualização"
        label.font = UIFont(name: "Roboto-Regular", size: 12)
        label.textColor = UIColor(red: 0.633, green: 0.633, blue: 0.633, alpha: 1)
        return label
    }()
    
    lazy var timeUpdateLabel: UILabel = {
        let label = UILabel()
        label.text = "09:41"
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = UIColor(red: 0.633, green: 0.633, blue: 0.633, alpha: 1)
        return label
    }()
    
    lazy var newRecipeButton: UIButton = {
        var button = UIButton(type: .system)
        button.layer.backgroundColor = UIColor(red: 0.354, green: 0.679, blue: 0.201, alpha: 1).cgColor
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(newRecipe), for: .touchUpInside)
        return button
    }()
    
    lazy var textNewRecipeLabel: UILabel = {
        let label = UILabel()
        label.text = "NOVA RECEITA"
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = .white
        return label
    }()
    
    lazy var imageNewRecipeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "+")
        return image
    }()
    
    lazy var newExpenseButton: UIButton = {
        var button = UIButton(type: .system)
        button.layer.backgroundColor = UIColor(red: 0.762, green: 0.264, blue: 0.264, alpha: 1).cgColor
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(newExpense), for: .touchUpInside)
        return button
    }()
    
    lazy var textNewExpenseLabel: UILabel = {
        let label = UILabel()
        label.text = "NOVA DESPESA"
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = .white
        return label
    }()
    
    lazy var imageNewExpenseImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "-")
        return image
    }()
    
    lazy var titleBudgetLabel: UILabel = {
        let label = UILabel()
        label.text = "Orçamento"
        label.font = UIFont(name: "Roboto-Bold", size: 22)
        label.textColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
        return label
    }()
    
    lazy var plusBudgetButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.layer.backgroundColor = UIColor(red: 0.591, green: 0.591, blue: 0.596, alpha: 1).cgColor
        button.backgroundColor = .white
        return button
    }()
    
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
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.allowsSelection = false
        table.register(InitialFinanceCell.self, forCellReuseIdentifier: cell)
        table.rowHeight = 71
        return table
    }()
    
    lazy var lineValueView: UIView = {
        let view = UIView()
        view.bounds = bounds.insetBy(dx: -0.5, dy: -0.5)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.302, green: 0.362, blue: 0.896, alpha: 1).cgColor
        return view
    }()
    
    lazy var cardMyBalanceView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1).cgColor
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 110).isActive = true
        return view
    }()
    
    lazy var cardBudgetView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1).cgColor
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 278).isActive = true
        return view
    }()
    
    lazy var lineBudgetView: UIView = {
        let view = UIView()
        view.bounds = bounds.insetBy(dx: -1, dy: -1)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1).cgColor
        return view
    }()
    
    lazy var cardSuggestionView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.backgroundColor = UIColor(red: 0.302, green: 0.362, blue: 0.896, alpha: 0.1).cgColor
        view.heightAnchor.constraint(equalToConstant: 120).isActive = true
        return view
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [newRecipeButton, newExpenseButton])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.heightAnchor.constraint(equalToConstant: 73).isActive = true
        return stack
    }()
    
    lazy var cardsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cardMyBalanceView, buttonStackView, cardBudgetView])
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
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        cardMyBalanceView.addSubview(titleMyBalaceLabel)
        cardMyBalanceView.addSubview(valueLabel)
        cardMyBalanceView.addSubview(lineValueView)
        cardMyBalanceView.addSubview(updateLabel)
        cardMyBalanceView.addSubview(timeUpdateLabel)
        newRecipeButton.addSubview(imageNewRecipeImage)
        newRecipeButton.addSubview(textNewRecipeLabel)
        newExpenseButton.addSubview(imageNewExpenseImage)
        newExpenseButton.addSubview(textNewExpenseLabel)
        cardBudgetView.addSubview(titleBudgetLabel)
        cardBudgetView.addSubview(plusBudgetButton)
        cardBudgetView.addSubview(lineBudgetView)
        cardBudgetView.addSubview(tableView)
        contentView.addSubview(cardsStackView)
        contentView.addSubview(cardSuggestionView)
        cardSuggestionView.addSubview(imageSuggestionImage)
        cardSuggestionView.addSubview(titleSuggestionLabel)
        cardSuggestionView.addSubview(textSuggestionLabel)
        
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
        
        titleMyBalaceLabel.translatesAutoresizingMaskIntoConstraints = false
        titleMyBalaceLabel.topAnchor.constraint(equalTo: cardMyBalanceView.topAnchor, constant: 12).isActive = true
        titleMyBalaceLabel.leadingAnchor.constraint(equalTo: cardMyBalanceView.leadingAnchor, constant: 19).isActive = true
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.topAnchor.constraint(equalTo: cardMyBalanceView.topAnchor, constant: 32).isActive = true
        valueLabel.leadingAnchor.constraint(equalTo: cardMyBalanceView.leadingAnchor, constant: 18).isActive = true
        
        lineValueView.translatesAutoresizingMaskIntoConstraints = false
        lineValueView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 4).isActive = true
        lineValueView.leadingAnchor.constraint(equalTo: cardMyBalanceView.leadingAnchor, constant: 18).isActive = true
        lineValueView.trailingAnchor.constraint(equalTo: cardMyBalanceView.trailingAnchor, constant: -18).isActive = true
        lineValueView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        updateLabel.translatesAutoresizingMaskIntoConstraints = false
        updateLabel.leadingAnchor.constraint(equalTo: cardMyBalanceView.leadingAnchor, constant: 18).isActive = true
        updateLabel.bottomAnchor.constraint(equalTo: cardMyBalanceView.bottomAnchor, constant: -12).isActive = true
        
        timeUpdateLabel.translatesAutoresizingMaskIntoConstraints = false
        timeUpdateLabel.trailingAnchor.constraint(equalTo: cardMyBalanceView.trailingAnchor, constant: -18).isActive = true
        timeUpdateLabel.bottomAnchor.constraint(equalTo: cardMyBalanceView.bottomAnchor, constant: -12).isActive = true
        
        imageNewRecipeImage.translatesAutoresizingMaskIntoConstraints = false
        imageNewRecipeImage.topAnchor.constraint(equalTo: newRecipeButton.topAnchor, constant: 15).isActive = true
        imageNewRecipeImage.centerXAnchor.constraint(equalTo: newRecipeButton.centerXAnchor).isActive = true
        
        textNewRecipeLabel.translatesAutoresizingMaskIntoConstraints = false
        textNewRecipeLabel.topAnchor.constraint(equalTo: imageNewRecipeImage.bottomAnchor, constant: 14.49).isActive = true
        textNewRecipeLabel.centerXAnchor.constraint(equalTo: newRecipeButton.centerXAnchor).isActive = true
        
        imageNewExpenseImage.translatesAutoresizingMaskIntoConstraints = false
        imageNewExpenseImage.topAnchor.constraint(equalTo: newExpenseButton.topAnchor, constant: 22).isActive = true
        imageNewExpenseImage.centerXAnchor.constraint(equalTo: newExpenseButton.centerXAnchor).isActive = true
        
        textNewExpenseLabel.translatesAutoresizingMaskIntoConstraints = false
        textNewExpenseLabel.topAnchor.constraint(equalTo: imageNewExpenseImage.bottomAnchor, constant: 14.49).isActive = true
        textNewExpenseLabel.centerXAnchor.constraint(equalTo: newExpenseButton.centerXAnchor).isActive = true
        
        titleBudgetLabel.translatesAutoresizingMaskIntoConstraints = false
        titleBudgetLabel.topAnchor.constraint(equalTo: cardBudgetView.topAnchor, constant: 12).isActive = true
        titleBudgetLabel.leadingAnchor.constraint(equalTo: cardBudgetView.leadingAnchor, constant: 16).isActive = true
        
        plusBudgetButton.translatesAutoresizingMaskIntoConstraints = false
        plusBudgetButton.topAnchor.constraint(equalTo: cardBudgetView.topAnchor, constant: 21).isActive = true
        plusBudgetButton.trailingAnchor.constraint(equalTo: cardBudgetView.trailingAnchor, constant: -22.19).isActive = true
        plusBudgetButton.widthAnchor.constraint(equalToConstant: 12.38).isActive = true
        plusBudgetButton.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        lineBudgetView.translatesAutoresizingMaskIntoConstraints = false
        lineBudgetView.topAnchor.constraint(equalTo: titleBudgetLabel.bottomAnchor, constant: 12).isActive = true
        lineBudgetView.leadingAnchor.constraint(equalTo: cardBudgetView.leadingAnchor, constant: 18).isActive = true
        lineBudgetView.trailingAnchor.constraint(equalTo: cardBudgetView.trailingAnchor, constant: -18).isActive = true
        lineBudgetView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: lineBudgetView.bottomAnchor, constant: 12).isActive = true
        tableView.leadingAnchor.constraint(equalTo: cardBudgetView.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: cardBudgetView.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: cardBudgetView.bottomAnchor, constant: -12).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 197).isActive = true
        
        cardSuggestionView.translatesAutoresizingMaskIntoConstraints = false
        cardSuggestionView.topAnchor.constraint(equalTo: cardBudgetView.bottomAnchor, constant: 36).isActive = true
        cardSuggestionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        cardSuggestionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        cardSuggestionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -86).isActive = true
        cardSuggestionView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
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
    
    // MARK: - Fuctions
    
    @objc func newRecipe() {
        delegate?.recipeButton()
    }
    
    @objc func newExpense() {
        delegate?.expenseButton()
    }
}

// MARK: Delegate

extension InitialFinanceView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as! InitialFinanceCell
        
        if indexPath.row == 0 {
            cell.titleCellBudgetLabel.text = "Novo Carro"
            cell.valueInitialCellBudgetLabel.text = "R$ 2.000,00"
            cell.valueFinalCellBudgetLabel.text = "R$ 80.000,00"
            cell.progressValueView.setProgress(0.5, animated: false)
        }
        
        if indexPath.row == 1 {
            cell.titleCellBudgetLabel.text = "TV"
            cell.valueInitialCellBudgetLabel.text = "R$ 3.000,00"
            cell.valueFinalCellBudgetLabel.text = "R$ 3.500,00"
            cell.progressValueView.setProgress(0.9, animated: false)
        }
        
        if indexPath.row == 2 {
            cell.titleCellBudgetLabel.text = "Férias das Maldivas"
            cell.valueInitialCellBudgetLabel.text = "R$ 1,50"
            cell.valueFinalCellBudgetLabel.text = "R$ 200.000,00"
            cell.progressValueView.setProgress(0.01, animated: false)
        }
        
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 3 {
            cell.lineValueView.isHidden = true
        }
        return cell
    }
}
