//
//  KnowledgeRepetitionScreenView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 15.04.2024.
//

import SnapKit
import UIKit

class KnowledgeRepetitionScreenView: UIView {

    private lazy var titleLabel: UILabel = UILabel()
    private lazy var imageView: UIImageView = UIImageView()
    private lazy var startView: UIView = UIView()
    private lazy var startLabel: UILabel = UILabel()
    private lazy var startImage: UIImageView = UIImageView()
    private lazy var chooseTopicsView: UIView = UIView()
    private lazy var chooseTopicsLabel: UILabel = UILabel()
    private lazy var chooseTopicsImage: UIImageView = UIImageView()
    private lazy var segmentControl: UISegmentedControl = UISegmentedControl()
    var chooseViewTappedClosure: (() -> Void)?
    var startTappedClosure: ((Int) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .pBlue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpTitleLabel()
        setUpImageView()
        setUpStartView()
        setUpStartLabel()
        setUpStartImage()
        setUpChooseTopicsView()
        setUpChooseTopicsLabel()
        setUpChooseTopicsImage()
        setUpSegmentControl()
    }

    private func setUpTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "Повторите свои знания"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(80)
            make.centerX.equalToSuperview()
        }
    }

    private func setUpImageView() {
        addSubview(imageView)
        imageView.image = .celebrating
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.top.equalTo(120)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(200)
        }
    }

    private func setUpStartView() {
        addSubview(startView)
        startView.layer.cornerRadius = 16
        startView.layer.masksToBounds = false
        startView.layer.shadowColor = UIColor.black.cgColor
        startView.layer.shadowOpacity = 0.5
        startView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        startView.layer.shadowRadius = 5.0
        startView.layer.borderColor = UIColor.black.cgColor
        startView.backgroundColor = .pDarkBlue
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(startTapped))
        startView.addGestureRecognizer(tapGesture)
        startView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp_bottomMargin).offset(60)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(100)
        }
    }

    @objc func startTapped(sender: UITapGestureRecognizer) {
        startTappedClosure?(segmentControl.selectedSegmentIndex)
    }

    private func setUpStartLabel() {
        startView.addSubview(startLabel)
        startLabel.text = "Начать"
        startLabel.textAlignment = .left
        startLabel.textColor = .white
        startLabel.minimumScaleFactor = 0.5
        startLabel.adjustsFontSizeToFitWidth = true
        startLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        startLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(80)
        }
    }

    private func setUpStartImage() {
        startView.addSubview(startImage)
        startImage.image = .play
        startImage.contentMode = .scaleAspectFit
        startImage.clipsToBounds = true
        startImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalTo(80)
        }
    }

    private func setUpChooseTopicsView() {
        addSubview(chooseTopicsView)
        chooseTopicsView.layer.cornerRadius = 16
        chooseTopicsView.layer.masksToBounds = false
        chooseTopicsView.layer.shadowColor = UIColor.black.cgColor
        chooseTopicsView.layer.shadowOpacity = 0.5
        chooseTopicsView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        chooseTopicsView.layer.shadowRadius = 5.0
        chooseTopicsView.layer.borderColor = UIColor.black.cgColor
        chooseTopicsView.backgroundColor = .pPink
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(chooseViewTapped))
        chooseTopicsView.addGestureRecognizer(tapGesture)
        chooseTopicsView.snp.makeConstraints { make in
            make.top.equalTo(startView.snp_bottomMargin).offset(38)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(100)
        }
    }

    @objc func chooseViewTapped(sender: UITapGestureRecognizer) {
        chooseViewTappedClosure?()
    }

    private func setUpChooseTopicsLabel() {
        chooseTopicsView.addSubview(chooseTopicsLabel)
        chooseTopicsLabel.text = "Выберите темы"
        chooseTopicsLabel.textAlignment = .left
        chooseTopicsLabel.textColor = .white
        chooseTopicsLabel.minimumScaleFactor = 0.5
        chooseTopicsLabel.adjustsFontSizeToFitWidth = true
        chooseTopicsLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        chooseTopicsLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(80)
        }
    }

    private func setUpChooseTopicsImage() {
        chooseTopicsView.addSubview(chooseTopicsImage)
        chooseTopicsImage.image = .topics
        chooseTopicsImage.contentMode = .scaleAspectFit
        chooseTopicsImage.clipsToBounds = true
        chooseTopicsImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalTo(80)
        }
    }

    private func setUpSegmentControl() {
        addSubview(segmentControl)
        segmentControl.layer.cornerRadius = 40
        segmentControl.layer.masksToBounds = true
        segmentControl.layer.shadowColor = UIColor.black.cgColor
        segmentControl.layer.shadowOpacity = 0.5
        segmentControl.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        segmentControl.layer.shadowRadius = 5.0
        segmentControl.layer.borderColor = UIColor.black.cgColor
        segmentControl.selectedSegmentTintColor = .white
        segmentControl.insertSegment(withTitle: "10 заданий", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "20 заданий", at: 1, animated: true)
        segmentControl.insertSegment(withTitle: "30 заданий", at: 2, animated: true)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(chooseTopicsView.snp_bottomMargin).offset(38)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(100)
        }
    }
}
