//
//  TaskCell.swift
//  toDoList
//
//  Created by Сергей Юдин on 02.05.2022.
//

import UIKit
import SnapKit

class TaskCell: UITableViewCell {
    
    let cellIdentifier = "Cell"
    
    var taskName: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    var taskShortText: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.text = "-"
        return label
    }()
    
    private var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.spacing = 1
        stackView.axis = .vertical
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(taskName)
        stackView.addArrangedSubview(taskShortText)
        
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
