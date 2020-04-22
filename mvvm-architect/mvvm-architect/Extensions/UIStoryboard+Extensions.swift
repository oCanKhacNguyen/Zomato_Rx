//
//  UIStoryboard+Extensions.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/20/20.
//  Copyright © 2020 sun. All rights reserved.
//

extension UIStoryboard {
    // MARK: Declare storyboard's name

    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }

    static var map: UIStoryboard {
        return UIStoryboard(name: "Map", bundle: nil)
    }

    // MARK: Declare view controllers

    var mainViewController: MainViewController {
        let vc = MainViewController.instantiate()
        return vc
    }

    var mapViewController: MapViewController {
        let vc = MapViewController.instantiate()
        return vc
    }

    var detailViewController: DetailViewController {
        let vc = DetailViewController.instantiate()
        return vc
    }
}
