import UIKit

class LessonLevelViewController: UIViewController {

    let text = "Выберите правильную длительность ноты"
    private var contentView: LessonLevelView?
    private var viewModel: LessonLevelViewModelProtocol
    private var animate: Bool = true
    var exitClosure: (() -> Void)?

    init(viewModel: LessonLevelViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        setUpTaskView(progress: 0.0, hpCount: 3)
    }

    func setUpTaskView(progress: Float, hpCount: Int) {
        let tuple = viewModel.getCurrentTaskWithImage()
        let answers = viewModel.getCurrentAnswers()
        let taskImage = tuple.1
        self.contentView = LessonLevelView(
            frame: CGRect(),
            text: tuple.0.task,
            image: taskImage ?? .exit,
            buttonsNames: [answers[0].name, answers[1].name, answers[2].name, answers[3].name],
            progressAnimate: animate,
            progressProcent: progress,
            hpCount: hpCount
        )

        contentView?.didSelectAnswer = { answer in
            self.viewModel.checkCorrectAnswer(answerName: answer)
        }

        self.viewModel.answerReaction = { result in
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
            self.exitClosure?()
        }
        animate = false
        view = contentView
        view.backgroundColor = .pBlue
        self.navigationItem.title = "Ноты и длительности"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        contentView?.exitClosure = {
            self.exitClosure?()
        }

        contentView?.didSelectAnswer = { answer in
            self.viewModel.checkCorrectAnswer(answerName: answer)
        }

        self.viewModel.moveToNext = { progress, hpCount in
            self.setUpTaskView(progress: progress, hpCount: hpCount)
        }

        self.viewModel.exitClosure = {
            self.exitClosure?()
        }
    }
}
