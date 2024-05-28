//
//  ProfileScreenViewController.swift
//  Solfeggio
//
//  Created by Давид Васильев on 14.04.2024.
//

import UIKit

class ProfileScreenViewController: UIViewController {

    private var contentView: ProfileScreenView
    private let viewModel: ProfileScreenViewModelProtocol

    var settingsClosure: (() -> Void)?
    init(viewModel: ProfileScreenViewModelProtocol) {
        guard let user = viewModel.getUser() else {
            fatalError("User is not authorized")
        }
        var image = UIImage()
        if user.image == 1 {
            image = .avatar
        } else {
            image = .avatar2
        }
        contentView = ProfileScreenView(
            frame: CGRect(),
            avatar: image,
            name: user.name,
            notesProgress: user.notesStat,
            intervalsProgress: user.intervalsStat,
            moodsProgress: user.moodsStat,
            chordsProgress: user.chordsStat
        )
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let levelsProgress = viewModel.getUserLevelsStat()
        contentView.config(levelsProgress: levelsProgress)
        contentView.settingsClosure = {
            self.settingsClosure?()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let user = viewModel.getUser() else {
            fatalError("User is not authorized")
        }
        var image = UIImage()
        if user.image == 1 {
            image = .avatar
        } else {
            image = .avatar2
        }
        let levelsProgress = viewModel.getUserLevelsStat()
        contentView = ProfileScreenView(
            frame: CGRect(),
            avatar: image,
            name: user.name,
            notesProgress: user.notesStat,
            intervalsProgress: user.intervalsStat,
            moodsProgress: user.moodsStat,
            chordsProgress: user.chordsStat
        )
        contentView.settingsClosure = {
            self.settingsClosure?()
        }
        contentView.config(levelsProgress: levelsProgress)
        view = contentView

    }
}
