//
//  LoadingScreenViewModel.swift
//  Solfeggio
//
//  Created by Давид Васильев on 06.05.2024.
//

import UIKit

protocol LoadingScreenViewModelProtocol {
    func setData(tasks: Set<Task>)
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void)
    var allDataDownload: (([String: UIImage]) -> Void)? { get set }
}

class LoadingScreenViewModel: LoadingScreenViewModelProtocol {

    private var tasks: [Task]
    private var imageDict: [String: UIImage]
    var allDataDownload: (([String: UIImage]) -> Void)?

    init() {
        tasks = []
        imageDict = [:]
    }

    func setData(tasks: Set<Task>) {
        self.tasks = Array(tasks)
        getAllTasksImages()
        addUIImagesToDict {
            self.allDataDownload?(self.imageDict)
        }
    }

    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            if let imageUrl = URL(string: urlString) {
                do {
                    let imageData = try Data(contentsOf: imageUrl)
                    let image = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        completion(image)
                    }
                } catch {
                    print("Error downloading image: \(error)")
                    completion(nil)
                }
            } else {
                print("Invalid image URL: \(urlString)")
                completion(nil)
            }
        }
    }

    func getAllTasksImages() {
        for task in tasks {
            imageDict[task.image] = UIImage()
        }
    }

    func addUIImagesToDict(completion: @escaping () -> Void) {
        var downloadedImagesCount = 0
        let totalImagesCount = imageDict.count

        for imageKey in imageDict.keys {
            downloadImage(from: imageKey) { image in
                if let image = image {
                    self.imageDict[imageKey] = image
                    downloadedImagesCount += 1
                }

                if downloadedImagesCount == totalImagesCount {
                    completion()
                }
            }
        }
    }
}
