//
//  RepositoriesListViewController.swift
//  GitHubRepositories
//
//  Created by Дмитрий on 30.05.2023.
//

import UIKit

final class RepositoriesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        button.setImage(UIImage(named: "input"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RepositoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "RepositoriesTableViewCell")
        setupUI()
    }

    @objc private func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }

}

extension RepositoriesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoriesTableViewCell", for: indexPath) as? RepositoriesTableViewCell
        
        cell?.nameLabel.text = "wfgsrweewe"
        cell?.detailsLabel.text = "dsgdtdg rhrdhdr hrehr rhre hreth rereh r hdafad"
        cell?.languageLabel.text = "Kotlin"
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = RepositoryDetailInfoViewController()
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}

extension RepositoriesListViewController {
    
    private func setupUI() {
        title = "Repositories"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
