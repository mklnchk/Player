//
//  VideoTableViewCell.swift
//  PlayerApp
//
//  Created by Catherine Volohova on 23.01.2023.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var video: Video?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setCell(_ vid: Video) {
        self.video = vid
        guard self.video != nil else {
            return
        }
        // Set the title
        self.titleLabel.text = video?.title
        // Set the date
        let dform = DateFormatter()
        dform.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = dform.string(from: video!.published)
        // Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            // Set the thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        let session = URLSession.shared
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                CacheManager.setVideoCache(url!.absoluteString,
                                           data)
                if url!.absoluteString != self.video?.thumbnail { return }
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        dataTask.resume()
    }

}
