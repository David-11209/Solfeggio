import UIKit

class LessonLevelViewController: UIViewController {

    let text = "Выберите правильную длительность ноты"
    private var contentView: LessonLevelView?
    private var viewModel: LessonLevelViewModelProtocol

    var exitClosure: (() -> Void)?

    init(viewModel: LessonLevelViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        setUpTaskView()
    }

    func setUpTaskView() {
        let tuple = viewModel.getCurrentTaskWithImage()
        let answers = viewModel.getCurrentAnswers()
        var taskImage = tuple.1
        print(answers[0].name)
        let url = tuple.0.image
        self.contentView = LessonLevelView(
            frame: CGRect(),
            text: tuple.0.task,
            image: taskImage ?? .exit,
            buttonsNames: [answers[0].name, answers[1].name, answers[2].name, answers[3].name]
        )

        contentView?.didSelectAnswer = { answer in
            print("didSelectAnswer")
            self.viewModel.checkCorrectAnswer(answerName: answer)
        }

        contentView?.exitClosure = {
            self.exitClosure?()
        }

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
            print("didSelectAnswer")
            self.viewModel.checkCorrectAnswer(answerName: answer)
        }

        self.viewModel.moveToNext = {
            self.setUpTaskView()
        }
    }
}
