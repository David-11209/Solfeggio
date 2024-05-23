//
//  HearingTestLevelScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.03.2024.
//

import UIKit

class HearingTestLevelScreenViewController: UIViewController {

    let text = "Выберите ноту которую вы услышали"
    private var animate: Bool = true
    private var contentView: HearingTestLevelScreenView?
    private var viewModel: HearingTestLevelScreenViewModelProtocol

    var exitClosure: ((Int) -> Void)?

    init(viewModel: HearingTestLevelScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView?.startStopButtonTapped = {
            self.viewModel.playSound()
        }
        contentView?.exitClosure = {
            self.exitClosure?(self.viewModel.getNumberCompletedTasks())
        }

        self.viewModel.exitClosureWithResult = { result in
            self.exitClosure?(result)
        }

        contentView?.didSelectAnswer = { answer in
            self.viewModel.checkCorrectAnswerSoundTask(answerName: answer)
        }

        self.viewModel.moveToNext = { progress in
            self.setUpTaskView(progress: progress)
        }
    }

    func setUpTaskView(progress: Float) {
        let answers = viewModel.getCurrentAnswers()
        self.contentView = HearingTestLevelScreenView(frame: CGRect(), text: text, buttonsNames: [
            answers[0].name,
            answers[1].name,
            answers[2].name,
            answers[3].name
        ], progressProcent: progress, progressAnimate: animate)

        contentView?.startStopButtonTapped = {
            self.viewModel.playSound()
        }

        contentView?.didSelectAnswer = { answer in
            self.viewModel.checkCorrectAnswerSoundTask(answerName: answer)
        }

        self.viewModel.answerReaction = { result in
            if result {
                self.contentView?.showView(result: true)
                DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(1000)) {
                    DispatchQueue.main.async {
                        self.viewModel.nextSoundTask()
                    }
                }

            } else {
                self.contentView?.showView(result: false)
                DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(1000)) {
                    DispatchQueue.main.async {
                        self.viewModel.nextSoundTask()
                    }
                }
            }
        }
        contentView?.exitClosure = {
            self.exitClosure?(self.viewModel.getNumberCompletedTasks())
        }
        self.viewModel.exitClosureWithResult = { result in
            self.exitClosure?(result)
        }

        self.viewModel.moveToNext = { progress in
            self.setUpTaskView(progress: progress)
        }
        animate = false
        view = contentView
        view.backgroundColor = .pBlue
    }

    override func loadView() {
        setUpTaskView(progress: 0.0)
    }
}
