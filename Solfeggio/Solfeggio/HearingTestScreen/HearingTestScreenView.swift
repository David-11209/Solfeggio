//
//  HearingTestScreenView.swift
//  Solfeggio
//
//  Created by Давид Васильев on 04.04.2024.
//
import SnapKit
import UIKit

class HearingTestScreenView: UIView {

    private lazy var titleLabel: UILabel = UILabel()
    private lazy var notesProgressLabel: UILabel = UILabel()
    private lazy var notesProgressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private var notesView: UIView {
        let builder = CustomViewBuilder()
        return builder
            .addImage(.note)
            .setGradientColors([.red, .yellow])
            .addTitle("Ноты")
            .build()
    }

    private lazy var intervalsProgressLabel: UILabel = UILabel()
    private lazy var intervalsProgressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private var intervalsView: UIView {
        let builder = CustomViewBuilder()
        return builder
            .addImage(.interval)
            .setGradientColors([.yellow, .cyan])
            .addTitle("Интервалы")
            .build()
    }

    private lazy var moodsProgressLabel: UILabel = UILabel()
    private lazy var moodsProgressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private var moodsView: UIView {
        let builder = CustomViewBuilder()
        return builder
            .addImage(.treble)
            .setGradientColors([.myMagenta, .myBlue])
            .addTitle("Лады")
            .build()
    }

    private lazy var chordsProgressLabel: UILabel = UILabel()
    private lazy var chordsProgressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private var chordsView: UIView {
        let builder = CustomViewBuilder()
        return builder
            .addImage(.chord)
            .setGradientColors([.mySPink, .white])
            .addTitle("Аккорды")
            .build()
    }

    private lazy var progressStack: UIStackView = UIStackView()

    private lazy var mainCellStackView: UIStackView = UIStackView()
    private lazy var subCellStackView1: UIStackView = UIStackView()
    private lazy var subCellStackView2: UIStackView = UIStackView()

    var viewTappedClosure: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpTitleLabel()
        setUpStackView()

        setUpProgressLabel(progressLabel: notesProgressLabel, text: "Ноты")
        setUpProgressView(progressView: notesProgressView, color: .myRed, trackColor: .myRedOp)
        setUpView(customView: notesView)

        setUpProgressLabel(progressLabel: intervalsProgressLabel, text: "Интервалы")
        setUpProgressView(progressView: intervalsProgressView, color: .myGreen, trackColor: .myGreenOp)
        setUpView(customView: intervalsView)

        setUpProgressLabel(progressLabel: moodsProgressLabel, text: "Лады")
        setUpProgressView(progressView: moodsProgressView, color: .myMagenta, trackColor: .myMagentaOp)
        setUpView(customView: moodsView)

        setUpProgressLabel(progressLabel: chordsProgressLabel, text: "Аккорды")
        setUpProgressView(progressView: chordsProgressView, color: .mySPink, trackColor: .myPinkOp)
        setUpView(customView: chordsView)

        setUpSubStackView(subCellStackView1, firstView: notesView, secondView: intervalsView)
        setUpSubStackView(subCellStackView2, firstView: moodsView, secondView: chordsView)

        setUpMainStackView()
    }

    private func setUpTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "Тренируйте свой слух"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28.0)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.centerX.equalToSuperview()
        }
    }

    private func setUpStackView() {
        addSubview(progressStack)
        progressStack.axis = .vertical
        progressStack.snp.makeConstraints { make in
            make.top.equalTo(120)
            make.leading.equalTo(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
    }

    private func setUpProgressView(progressView: UIProgressView, color: UIColor, trackColor: UIColor) {
        progressStack.addArrangedSubview(progressView)
        progressView.layer.cornerRadius = 10
        progressView.layer.masksToBounds = true
        progressView.progressTintColor = color
        progressView.trackTintColor = trackColor
        progressView.setProgress(0.3, animated: true)
        progressView.snp.makeConstraints { make in
            make.height.equalTo(16)
        }
    }

    private func setUpProgressLabel(progressLabel: UILabel, text: String) {
        progressStack.addArrangedSubview(progressLabel)
        progressLabel.text = text
        progressLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        progressLabel.snp.makeConstraints { make in
            make.height.equalTo(34)
        }
    }

    private func setUpMainStackView() {
        addSubview(mainCellStackView)
        mainCellStackView.addArrangedSubview(subCellStackView1)
        mainCellStackView.addArrangedSubview(subCellStackView2)
        mainCellStackView.axis = .vertical
        mainCellStackView.alignment = .fill
        mainCellStackView.distribution = .fillEqually
        mainCellStackView.spacing = 36
        mainCellStackView.snp.makeConstraints {make in
            make.top.equalTo(360)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(100)
        }
    }

    private func setUpSubStackView(_ stackView: UIStackView, firstView: UIView, secondView: UIView) {
        addSubview(stackView)
        stackView.addArrangedSubview(firstView)
        stackView.addArrangedSubview(secondView)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
    }

    private func setUpView(customView: UIView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        customView.addGestureRecognizer(tapGesture)
    }

    @objc func viewTapped() {
        viewTappedClosure?()
    }
}
