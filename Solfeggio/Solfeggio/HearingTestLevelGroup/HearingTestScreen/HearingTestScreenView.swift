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
    private lazy var imageView: UIImageView = UIImageView()
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

    var viewTappedClosure: ((String) -> Void)?

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
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(80)
            make.centerX.equalToSuperview()
        }
    }

    private func setUpImageView() {
        addSubview(imageView)
        imageView.image = .hearing
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.top.equalTo(120)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(200)
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
            .addBackgroundColor(.white)
            .addTitle("Ноты")
            .build()

        let tapGesture = UITapGestureRecognizerCustom(target: self, action: #selector(viewTapped))
        tapGesture.title = "Ноты"
        notesView.addGestureRecognizer(tapGesture)
        addSubview(notesView)
        notesView.snp.makeConstraints { make in
            make.top.equalTo(380)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(160)
            make.width.equalTo(160)
        }
    }

    private func setUpIntervalsView() {
        let builder = CustomViewBuilder()
        intervalsView = builder
            .addImage(.interval)
            .addBackgroundColor(.white)
            .addTitle("Интервалы")
            .build()

        let tapGesture = UITapGestureRecognizerCustom(target: self, action: #selector(viewTapped))
        tapGesture.title = "Интервалы"
        intervalsView.addGestureRecognizer(tapGesture)
        addSubview(intervalsView)
        intervalsView.snp.makeConstraints { make in
            make.top.equalTo(notesView.snp.top)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(160)
            make.width.equalTo(160)
        }
    }

    private func setUpMoodsView() {
        let builder = CustomViewBuilder()
        moodsView = builder
            .addImage(.treble)
            .addBackgroundColor(.white)
            .addTitle("Лады")
            .build()

        let tapGesture = UITapGestureRecognizerCustom(target: self, action: #selector(viewTapped))
        tapGesture.title = "Лады"
        moodsView.addGestureRecognizer(tapGesture)
        addSubview(moodsView)
        moodsView.snp.makeConstraints { make in
            make.top.equalTo(notesView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(160)
            make.width.equalTo(160)
        }
    }

    private func setUpChordsView() {
        let builder = CustomViewBuilder()
        chordsView = builder
            .addImage(.chord)
            .addBackgroundColor(.white)
            .addTitle("Аккорды")
            .build()

        let tapGesture = UITapGestureRecognizerCustom(target: self, action: #selector(viewTapped))
        tapGesture.title = "Аккорды"
        chordsView.addGestureRecognizer(tapGesture)
        addSubview(chordsView)
        chordsView.snp.makeConstraints { make in
            make.top.equalTo(notesView.snp.bottom).offset(40)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(160)
            make.width.equalTo(160)
        }
    }

    @objc func viewTapped(_ sender: UITapGestureRecognizerCustom) {
        let viewName = sender.title
        viewTappedClosure?(viewName)
    }
}
