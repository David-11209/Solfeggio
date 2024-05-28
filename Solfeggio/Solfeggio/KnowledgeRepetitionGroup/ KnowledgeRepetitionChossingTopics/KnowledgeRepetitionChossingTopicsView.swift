//
//  KnowledgeRepetitionChossingTopicsUIView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 26.04.2024.
//

import SnapKit
import UIKit

class KnowledgeRepetitionChossingTopicsView: UIView {

    private lazy var exitButton: UIButton = UIButton()
    var exitClosure: (() -> Void)?

    lazy var topicsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .pBlue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpExitButton()
        setUpTopicsCollectionView()
    }

    private func setUpTopicsCollectionView() {
        addSubview(topicsCollectionView)
        topicsCollectionView.backgroundColor = .clear
        topicsCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(116)
            make.bottom.equalToSuperview()
        }
    }

    private func setUpExitButton() {
        addSubview(exitButton)
        let action: UIAction = UIAction { [weak self] _ in
            self?.exitClosure?()
        }
        exitButton.addAction(action, for: .touchUpInside)
        exitButton.setImage(.exit, for: .normal)
        exitButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(22)
            make.height.equalTo(36)
            make.width.equalTo(36)
        }
    }
}
