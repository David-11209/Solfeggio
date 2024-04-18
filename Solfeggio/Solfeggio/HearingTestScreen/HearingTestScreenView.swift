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
    private lazy var notesView: UIView = UIView()

    private lazy var intervalsProgressLabel: UILabel = UILabel()
    private lazy var intervalsProgressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private var intervalsView: UIView = UIView()

    private lazy var moodsProgressLabel: UILabel = UILabel()
    private lazy var moodsProgressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private var moodsView: UIView = UIView()

    private lazy var chordsProgressLabel: UILabel = UILabel()
    private lazy var chordsProgressView: UIProgressView = UIProgressView(progressViewStyle: .default)
    private var chordsView: UIView = UIView()

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

        setUpProgressLabel(progressLabel: intervalsProgressLabel, text: "Интервалы")
        setUpProgressView(progressView: intervalsProgressView, color: .myGreen, trackColor: .myGreenOp)

        setUpProgressLabel(progressLabel: moodsProgressLabel, text: "Лады")
        setUpProgressView(progressView: moodsProgressView, color: .myMagenta, trackColor: .myMagentaOp)

        setUpProgressLabel(progressLabel: chordsProgressLabel, text: "Аккорды")
        setUpProgressView(progressView: chordsProgressView, color: .mySPink, trackColor: .myPinkOp)

        setUpNotesView()
        setUpIntervalsView()
        setUpMoodsView()
        setUpChordsView()
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

    private func setUpNotesView() {
        let builder = CustomViewBuilder()
        notesView = builder
            .addImage(.note)
            .setGradientColors([.red, .yellow])
            .addTitle("Ноты")
            .build()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        notesView.addGestureRecognizer(tapGesture)
        addSubview(notesView)
        notesView.snp.makeConstraints { make in
            make.top.equalTo(progressStack.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(180)
            make.width.equalTo(176)
        }
    }

    private func setUpIntervalsView() {
        let builder = CustomViewBuilder()
        intervalsView = builder
            .addImage(.interval)
            .setGradientColors([.yellow, .cyan])
            .addTitle("Интервалы")
            .build()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        intervalsView.addGestureRecognizer(tapGesture)
        addSubview(intervalsView)
        intervalsView.snp.makeConstraints { make in
            make.top.equalTo(progressStack.snp.bottom).offset(40)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(180)
            make.width.equalTo(176)
        }
    }

    private func setUpMoodsView() {
        let builder = CustomViewBuilder()
        moodsView = builder
            .addImage(.treble)
            .setGradientColors([.myMagenta, .myBlue])
            .addTitle("Лады")
            .build()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        moodsView.addGestureRecognizer(tapGesture)
        addSubview(moodsView)
        moodsView.snp.makeConstraints { make in
            make.top.equalTo(notesView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(180)
            make.width.equalTo(176)
        }
    }

    private func setUpChordsView() {
        let builder = CustomViewBuilder()
        chordsView = builder
            .addImage(.chord)
            .setGradientColors([.mySPink, .white])
            .addTitle("Аккорды")
            .build()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        chordsView.addGestureRecognizer(tapGesture)
        addSubview(chordsView)
        chordsView.snp.makeConstraints { make in
            make.top.equalTo(notesView.snp.bottom).offset(40)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(180)
            make.width.equalTo(176)
        }
    }

    @objc func viewTapped() {
        viewTappedClosure?()
    }
}
