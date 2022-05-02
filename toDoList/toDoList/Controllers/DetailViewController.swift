//
//  DetailViewController.swift
//  toDoList
//
//  Created by Сергей Юдин on 02.05.2022.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var task: Tasks?
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupText()
    }
    
    private func setupViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(textLabel)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.right.left.equalToSuperview().inset(20)
        }
    }
    
    private func setupText() {
        headerLabel.text = task?.name
        textLabel.text = task?.text
    }
    
}
