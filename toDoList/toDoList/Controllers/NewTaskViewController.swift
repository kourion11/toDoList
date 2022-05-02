//
//  DetailViewController.swift
//  toDoList
//
//  Created by Сергей Юдин on 02.05.2022.
//

import UIKit
import SnapKit

class NewTaskViewController: UIViewController {
    
    var task: Tasks?
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Заголовок"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var headerTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Заголовок"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Текст"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    // Реализовать перенос строки
    
    private lazy var textTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Текст"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(saveTask), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        setupFields()
    }
    
    private func setupViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(headerTextField)
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(textTextField)
        stackView.addArrangedSubview(saveButton)
    }
    
    private func setupFields() {
        if let task = task {
            headerTextField.text = task.name
            textTextField.text = task.text
        }
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.left.right.equalToSuperview().inset(20)
        }
    }
    
    @objc func saveTask(_ sender: UIButton) {
        task?.name = headerTextField.text
        task?.text = textTextField.text
        
        try? task?.managedObjectContext?.save()
        navigationController?.popViewController(animated: true)
    }
}
