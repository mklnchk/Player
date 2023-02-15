//
//  ViewController.swift
//  PlayerApp
//
//  Created by Catherine Volohova on 23.01.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var model = Model()
    var videos = [Video]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        model.getVideos()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Confirm that a video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        let detailViewController = segue.destination as! DetailViewController
        detailViewController.video = selectedVideo
    }
}
// MARK: - Model Delegate Methods
extension ViewController: ModelDelegate {
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        // Refresh the tableview
        tableView.reloadData()
    }
}

// MARK: - TableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.videoCellId, for: indexPath) as! VideoTableViewCell
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        // Return the cell
        return cell
    }
}
// MARK: - TableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
