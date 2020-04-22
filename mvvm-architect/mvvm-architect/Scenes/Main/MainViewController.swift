//
//  MainViewController.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/14/20.
//  Copyright © 2020 sun. All rights reserved.
//

final class MainViewController: UIViewController {
    @IBOutlet private var restaurantsTableView: UITableView!

    private var restaurants: [Restaurants]?
    private var viewModel: MainViewModel!

    private let selectedIndexSubject = PublishSubject<Int>()
    var selectedIndex: Observable<Int> {
        return selectedIndexSubject.asObservable()
    }

    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        bindViewModel()
    }

    private func config() {
        guard let mainNavigation = navigationController else { return }
        let mainNavigator = MainNavigator(mainNavigation)
        viewModel = MainViewModel(dependencies: MainViewModel.Dependencies(api: RestaurantsRepositoryImpl(),
                                                                           navigator: mainNavigator))

        // TableView's settings
        restaurantsTableView.register(UINib(nibName: String(describing: RestaurantCell.self), bundle: nil),
                                      forCellReuseIdentifier: String(describing: RestaurantCell.self))
        restaurantsTableView.delegate = self
        restaurantsTableView.dataSource = self
        restaurantsTableView.tableFooterView = UIView()
    }

    private func bindViewModel() {
        let input = MainViewModel.Input(ready: rx.viewWillAppear.asDriver(),
                                        selected: selectedIndex.asDriver(onErrorJustReturn: 0))
        let output = viewModel.transform(input: input)

        output.loading
            .drive(UIApplication.shared.rx.isNetworkActivityIndicatorVisible)
            .disposed(by: disposeBag)

        output.results
            .drive(onNext: { [weak self] restaurants in
                guard let self = self else { return }
                self.restaurants = restaurants
                self.restaurantsTableView.reloadData()
            })
            .disposed(by: disposeBag)

        output.error
            .drive(onNext: { [weak self] error in
                guard let self = self,
                    let error = error as? BaseError else { return }
                self.showAlert(message: error.errorMessage ?? "")
            })
            .disposed(by: disposeBag)

        output.selected
            .drive()
            .disposed(by: disposeBag)
    }
}

// MARK: UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        if let restaurants = restaurants {
            return restaurants.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RestaurantCell = tableView.dequeueReusableCell(for: indexPath)
        guard let res = restaurants?[indexPath.row].restaurant else { return UITableViewCell() }
        cell.configCell(res)
        return cell
    }
}

// MARK: UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 64
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexSubject.onNext(indexPath.item)
    }
}

// MARK: StoryboardSceneBased

extension MainViewController: StoryboardSceneBased {
    static var sceneStoryboard = UIStoryboard.main
}
