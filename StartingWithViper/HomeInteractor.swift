//
//  HomeInteractor.swift
//  StartingWithViper
//
//  Created by Alexandre Lemos da Silva on 18/03/24.
//

import Foundation

protocol HomeInteractorInterface: AnyObject {
    var datas: [BaseModel]? { get }
}

final class HomeInteractor: HomeInteractorInterface {
    
    var datas: [BaseModel]? {
        LocalService.shared.saveDummyData() // dummy datas saving here
        return LocalService.shared.readData()
    }
}
