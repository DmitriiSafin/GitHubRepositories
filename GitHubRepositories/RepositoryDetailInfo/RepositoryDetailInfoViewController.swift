//
//  RepositoryDetailInfoViewController.swift
//  GitHubRepositories
//
//  Created by Дмитрий on 30.05.2023.
//

import UIKit

class RepositoryDetailInfoViewController: UIViewController {

    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var licenseLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!
    
    private lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        button.setImage(UIImage(named: "input"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }

}

extension RepositoryDetailInfoViewController {
    
    private func setupUI() {
        //title = "Repositories"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: backButton)
    }
}
