//
//  SettingsSectionViewModel.swift
//  RxDataSources_Tutorial
//
//  Created by 新垣 清奈 on 2022/08/01.
//

import Foundation
import RxSwift
import RxDataSources
import RxCocoa

class SettingsSectionViewModel {
    let items = BehaviorRelay<[SettingsSectionModel]>(value: [])

    var itemsObservable: Observable<[SettingsSectionModel]> {
        return items.asObservable()
    }

    func setUp(){
        updateItems()
    }

    func updateItems(){
        let sections:[SettingsSectionModel] = [
            accountSection(),
            commonSection(),
            othersSection()
        ]
        items.accept(sections)
    }

    private func accountSection() -> SettingsSectionModel {
        let items: [SettingsItem] = [
            .account,
            .security,
            .notification,
            .contents
        ]
        return SettingsSectionModel(model: .account, items: items)
    }

    private func commonSection() -> SettingsSectionModel {
        let items: [SettingsItem] = [
            .sounds,
            .dataUsing,
            .accessibility,
            .description(text: "基本設定はこの端末でログインしているすべてのアカウントに適用されます。")
        ]
        return SettingsSectionModel(model: .common, items: items)
    }

    private func othersSection() -> SettingsSectionModel {
        let items: [SettingsItem] = [
            .credit,
            .versionInformation,
            .privatePolicy
        ]
        return SettingsSectionModel(model: .others, items: items)
    }
}
