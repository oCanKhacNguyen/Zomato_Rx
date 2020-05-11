//
//  UIRefreshControl+Rx.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy B on 5/7/20.
//  Copyright © 2020 sun. All rights reserved.
//

extension Reactive where Base: UIRefreshControl {
    public var isRefreshing: Binder<Bool> {
        return Binder(base) { refreshControl, refresh in
            if refresh {
                refreshControl.beginRefreshing()
            } else {
                refreshControl.endRefreshing()
            }
        }
    }
}
