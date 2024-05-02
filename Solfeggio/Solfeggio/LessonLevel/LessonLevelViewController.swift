import UIKit

class LessonLevelViewController: UIViewController {

    let text = "Выберите правильную длительность ноты"
    private var contentView: LessonLevelView
    private let viewModel: LessonLevelViewModel

    var exitClosure: (() -> Void)?

    init(viewModel: LessonLevelViewModel) {
        self.viewModel = viewModel
        self.contentView = LessonLevelView(
            frame: CGRect(),
            text: text,
            image: .note,
            buttonsNames: ["Четверть", "Шеснадцатая", "Половинная", "Восьмая"]
        )
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
        view.backgroundColor = .pBlue
        self.navigationItem.title = "Ноты и длительности"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.exitClosure = {
            self.exitClosure?()
        }
    }
}
