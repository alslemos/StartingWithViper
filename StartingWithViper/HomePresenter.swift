//
//  HomePresenter.swift
//  StartingWithViper
//
//  Created by Alexandre Lemos da Silva on 19/03/24.
//

import Foundation

protocol HomePresenterInterface: AnyObject {
    func notifyViewDidLoad() -> Void
    func getDataByIndex(_ index: Int) -> BaseModel?
    func fetchDatas() -> Void
    var getItemCount: Int { get }
    var getSectionCount: Int { get }
}


final class HomePresenter {
    private weak var view: HomeViewInterface?
    private var router: HomeRouterInterface?
    private var interactor: HomeInteractorInterface?
    private var datas: [BaseModel]?
    
    init(view: HomeViewInterface? = nil, router: HomeRouterInterface? = nil, interactor: HomeInteractorInterface? = nil, datas: [BaseModel]? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.datas = datas
    }
}


extension HomePresenter: HomePresenterInterface {
    func notifyViewDidLoad() {
        view?.setupView()
        view?.setTitle(with: "Home")
        fetchDatas()
    }
    
    func getDataByIndex(_ index: Int) -> BaseModel? {
        datas?[index]
    }
    
    func fetchDatas() {
        datas = interactor?.datas
    }
    
    var getItemCount: Int {
        datas?.count ?? 0
    }
    
    var getSectionCount: Int {
        1
    }
    
    
}
