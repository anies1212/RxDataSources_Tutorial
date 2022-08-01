//
//  SettingsSectionModel.swift
//  RxDataSources_Tutorial
//
//  Created by 新垣 清奈 on 2022/08/01.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

typealias SettingsSectionModel = SectionModel<SettingsSection, SettingsItem>

enum SettingsSection {
    case account
    case common
    case others

    var headerHeight: CGFloat {
        return 40.0
    }

    var footerHeight: CGFloat {
        return 1.0
    }

    var title: String? {
        switch self {
        case .account:
            return "アカウント情報"
        case .common:
            return "共通情報"
        case .others:
            return "その他"
        }
    }
}

enum SettingsItem {
    // account section
    case account
    case security
    case notification
    case contents

    // common section
    case sounds
    case dataUsing
    case accessibility

    // common description
    case description(text: String)

    // others
    case credit
    case versionInformation
    case privatePolicy

    var title: String? {
        switch self {
        case .account:
            return "アカウント"
        case .security:
            return "セキュリティ"
        case .notification:
            return "通知"
        case .contents:
            return "コンテンツ設定"
        case .sounds:
            return "サウンド設定"
        case .dataUsing:
            return "データ利用時設定"
        case .accessibility:
            return "アクセシビリティ"
        case .description(text: _):
            return nil
        case .credit:
            return "クレジット情報"
        case .versionInformation:
            return "バージョン情報"
        case .privatePolicy:
            return "プライベートポリシー"
        }
    }

    var rowHeight: CGFloat {
        switch self {
        case .description(text: _):
            return 72.0
        default:
            return 48.0
        }
    }

    var accessoryType: UITableViewCell.AccessoryType {
        switch self {
        case .account:
            return .disclosureIndicator
        case .security:
            return .disclosureIndicator
        case .notification:
            return .disclosureIndicator
        case .contents:
            return .disclosureIndicator
        case .sounds:
            return .disclosureIndicator
        case .dataUsing:
            return .disclosureIndicator
        case .accessibility:
            return .disclosureIndicator
        case .credit:
            return .disclosureIndicator
        case .versionInformation:
            return .disclosureIndicator
        case .privatePolicy:
            return .disclosureIndicator
        case .description(text: _):
            return .none
        }
    }
}
