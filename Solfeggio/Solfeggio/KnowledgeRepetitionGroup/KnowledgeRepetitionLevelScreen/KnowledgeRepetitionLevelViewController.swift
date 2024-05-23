//
//  KnowledgeRepetitionLevelViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.03.2024.
//

import UIKit

class KnowledgeRepetitionLevelViewController: UIViewController {

    private var animate: Bool = true
    var viewModel: KnowledgeRepetitionLevelVMProtocol
    var contentView: KnowledgeRepetitionLevelView?
    var exitClosure: ((Int) -> Void)?

    init(viewModel: KnowledgeRepetitionLevelVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView?.exitClosure = {
            self.exitClosure?(self.viewModel.getNumberCompletedTasks())
        }

        self.viewModel.exitClosureWithResult = { result in
            self.exitClosure?(result)
        }

        contentView?.didSelectAnswer = { answer in
            self.viewModel.checkCorrectAnswerTask(answerName: answer)
        }

        self.viewModel.moveToNext = { progress in
            self.setUpTaskView(progress: progress)
        }
    }

    func setUpTaskView(progress: Float) {
        let tuple = viewModel.getCurrentTaskWithImage()
        let answers = viewModel.getCurrentAnswers()

        self.contentView = KnowledgeRepetitionLevelView(
            frame: CGRect(),
            text: tuple.0.task,
            image: tuple.1,
            buttonsNames: [
                answers[0].name,
                answers[1].name,
                answers[2].name,
                answers[3].name
            ],
            progressProcent: progress,
            progressAnimate: animate
        )

        contentView?.didSelectAnswer = { answer in
            self.viewModel.checkCorrectAnswerTask(answerName: answer)
        }

        self.viewModel.answerReaction = { result in
            print(result)
            if result {
                self.contentView?.showView(result: true)
                DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(1000)) {
                    DispatchQueue.main.async {
                        self.viewModel.nextTask()
                    }
                }

            } else {
                self.contentView?.showView(result: false)
                DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(1000)) {
                    DispatchQueue.main.async {
                        self.viewModel.nextTask()
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
        animate = false
        view = contentView
        view.backgroundColor = .pBlue
    }

    override func loadView() {
        setUpTaskView(progress: 0.0)
    }
}
