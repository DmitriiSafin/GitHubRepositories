//
//  RepositoriesListViewController.swift
//  GitHubRepositories
//
//  Created by Дмитрий on 30.05.2023.
//

import UIKit

final class RepositoriesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RepositoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "RepositoriesTableViewCell")
    }


    @IBAction func inputButton(_ sender: UIBarButtonItem) {
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
