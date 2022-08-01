//
//  ViewController.swift
//  RxDataSources_Tutorial
//
//  Created by 新垣 清奈 on 2022/08/01.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ViewController: UIViewController {

    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
    }
    private let disposeBag = DisposeBag()
    private lazy var dataSources = RxTableViewSectionedReloadDataSource<SettingsSectionModel>(
    configureCell: configureCell)
    private lazy var configureCell:RxTableViewSectionedReloadDataSource<SettingsSectionModel>.ConfigureCell =
    { [weak self] dataSouce, tableView, indexPath, _ in
        let item = dataSouce[indexPath]
        switch item {
        case .account, .security, .notification, .contents, .sounds, .dataUsing, .accessibility, .credit, .versionInformation, .privatePolicy:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = item.title
            cell.accessoryType = item.accessoryType
            return cell
        case .description(let text):
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = text
            cell.isUserInteractionEnabled = false
            return cell
        }
    }
    private var viewModel: SettingsSectionViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
        dataSources.titleForHeaderInSection = {dataSouces, section in
            return dataSouces.sectionModels[section].model.title
        }
        setUpTableView()
        setUpViewModel()
    }

    private func setUpViewController(){
        navigationItem.title = "設定"
    }

    private func setUpTableView(){
        tableView.contentInset.bottom = 12.0
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        tableView.rx.itemSelected
            .subscribe(onNext: {[weak self] indexPath in
                guard let item = self?.dataSources[indexPath] else { return }
                self?.tableView.deselectRow(at: indexPath, animated: true)
                switch item {
                case .account:
                    break
                case .security:
                    break
                case .notification:
                    break
                case .contents:
                    break
                case .sounds:
                    break
                case .dataUsing:
                    break
                case .accessibility:
                    break
                case .description(text: _):
                    break
                case .credit:
                    break
                case .versionInformation:
                    break
                case .privatePolicy:
                    break
                }
            })
            .disposed(by: disposeBag)
    }

    private func setUpViewModel(){
        viewModel = SettingsSectionViewModel()
        viewModel.items
            .bind(to: tableView.rx.items(dataSource: dataSources))
            .disposed(by: disposeBag)
        viewModel.updateItems()
    }
}
extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = dataSources[indexPath]
        return item.rowHeight
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let section = dataSources[section]
        return section.model.headerHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let section = dataSources[section]
        return section.model.footerHeight
    }
}

