import UIKit

class LessonLevelViewController: UIViewController {

    let text = "Выберите правильную длительность ноты"
    override func viewDidLoad() {
        super.viewDidLoad()
        view = LessonLevelView(
            frame: CGRect(),
            text: text,
            image: .note,
            buttonsNames: ["Четверть", "Шеснадцатая", "Половинная", "Восьмая"]
        )
        view.backgroundColor = .white
        self.navigationItem.title = "Ноты и длительности"
    }
}
