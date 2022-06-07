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
        label.text = "Header"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var headerTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Header"
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.contentVerticalAlignment = .center
        textField.becomeFirstResponder()
        return textField
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var textTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Text"
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.contentVerticalAlignment = .center
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
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
        textFieldsDelegate()
    }
    
    private func setupViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(headerTextField)
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(textTextField)
        stackView.addArrangedSubview(saveButton)
    }
    
    private func textFieldsDelegate() {
        headerTextField.delegate = self
        textTextField.delegate = self
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

extension NewTaskViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == headerTextField {
            textTextField.becomeFirstResponder()
        } else {
            textTextField.resignFirstResponder()
            saveTask(saveButton)
        }
        return true
    }
}
