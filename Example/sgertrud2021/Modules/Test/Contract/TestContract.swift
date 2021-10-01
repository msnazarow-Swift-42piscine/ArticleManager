//
//  TestContract.swift
//  sgertrud2021
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewTestProtocol: AnyObject {

}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterTestProtocol: AnyObject {
    var dataSource:PresenterToDataSourceTestProtocol { get }
    func viewDidLoad()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorTestProtocol: AnyObject {

}

// MARK: Presenter Output (Presenter -> Router)
protocol PresenterToRouterTestProtocol: AnyObject {
    
}

// MARK: Presenter Output (Presenter -> DataSource)
protocol PresenterToDataSourceTestProtocol: UITableViewDataSource {
    func updateForSections(_ sections: [SectionModel])
}

// MARK: Cell Input (Cell -> Presenter)
protocol CellToPresenterTestProtocol: AnyObject {

}
