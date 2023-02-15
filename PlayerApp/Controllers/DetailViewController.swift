//
//  DetailViewController.swift
//  PlayerApp
//
//  Created by Catherine Volohova on 25.01.2023.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, UISheetPresentationControllerDelegate {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textLable: UITextView!
    var video: Video?
    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController // swiftlint:disable:this force_cast
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        sheetPresentationController.delegate = self
        sheetPresentationController.selectedDetentIdentifier = .large
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.detents = [.large()]
        titleLable.text = ""
        dateLable.text = ""
        textLable.text = ""
        // Chack if there is a video
        guard video != nil else { return }
        // Create the embed url
        let embedVideoString = Constants.embedVideoUrl + video!.videoId
        // Load it into webview
        let url = URL(string: embedVideoString)
        let request = URLRequest(url: url!)
        webView.load(request)
        titleLable.text = video!.title
        let dform = DateFormatter()
        dform.dateFormat = "EEEE, MMM d, yyyy"
        dateLable.text = dform.string(from: video!.published)
        textLable.text = video!.description
    }
}
