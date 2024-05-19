//
//  KnowledgeRepetitionLevelViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 28.03.2024.
//

import UIKit

class KnowledgeRepetitionLevelViewController: UIViewController {

    var viewModel: KnowledgeRepetitionLevelVMProtocol
    var contentView: KnowledgeRepetitionLevelView?
    var exitClosure: ((Bool) -> Void)?
    private var animate: Bool = true

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
            self.exitClosure?(false)
        }

        contentView?.didSelectAnswer = { answer in
            self.viewModel.checkCorrectAnswer(answerName: answer)
        }

        self.viewModel.moveToNext = { progress, hpCount in
            self.setUpTaskView(progress: progress, hpCount: hpCount)
        }

        self.viewModel.exitClosure = { result in
            self.exitClosure?(result)
        }
    }

    func setUpTaskView(progress: Float, hpCount: Int) {
        let tuple = viewModel.getCurrentTaskWithImage()
        let answers = viewModel.getCurrentAnswers()

        self.contentView = KnowledgeRepetitionLevelView(frame: CGRect(), text: tuple.0.task, image: tuple.1, buttonsNames: [
            answers[0].name,
            answers[1].name,
            answers[2].name,
            answers[3].name
        ])

        contentView?.didSelectAnswer = { answer in
            self.viewModel.checkCorrectAnswer(answerName: answer)
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
            self.exitClosure?(false)
        }
        animate = false
        view = contentView
        view.backgroundColor = .pBlue
        self.navigationItem.title = "Ноты и длительности"
    }

    override func loadView() {
        setUpTaskView(progress: 0.0, hpCount: 3)
    }
}
