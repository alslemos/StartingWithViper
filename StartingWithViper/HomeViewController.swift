//
//  HomeViewController.swift
//  StartingWithViper
//
//  Created by Alexandre Lemos da Silva on 18/03/24.
//

import Foundation
import UIKit

protocol HomeViewInterface: AnyObject {
    func setupView()
    func setTitle(with title: String)
    func hakuna()
    
}

class HomeViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    private var listCongif = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
    var presenter: HomePresenterInterface = HomePresenter(view: nil, router: nil, interactor: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.notifyViewDidLoad(0)
    }
    
}

extension HomeViewController: HomeViewInterface, UICollectionViewDelegate {
    
    func setupView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
    }
    
    func setTitle(with title: String) {
        self.title = title
    }
    
}

extension HomeViewController {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { index, environment in
            var configurarion = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            configurarion.backgroundColor = .secondarySystemBackground
            configurarion.headerMode = .none
            return .list(using: configurarion, layoutEnvironment: environment)
        }
        
        return layout
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.getItemCount
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter.getSectionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "baseCell", for: indexPath) as? BaseCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureLabels(with: presenter.getDataByIndex(indexPath.row))
        return cell
        
    }
    
    
    
}
