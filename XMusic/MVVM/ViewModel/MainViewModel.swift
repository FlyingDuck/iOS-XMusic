//
//  MainViewModel.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/15.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var page: MainPageEnum
    
    init(page: MainPageEnum = .HomePage) {
        self.page = page
    }
    
    enum MainPageEnum: CaseIterable {
        case HomePage
        case ArticPage
        case ProfilePage
        
        var iconName: String {
            switch self {
            case .HomePage:
                return "Home"
            case .ArticPage:
                return "Heart"
            case .ProfilePage:
                return "Profile"
            }
        }

        var selectedIconName: String {
            switch self {
            case .HomePage:
                return "Home_fill"
            case .ArticPage:
                return "Heart_fill"
            case .ProfilePage:
                return "Profile_fill"
            }
        }
    }
}

extension MainViewModel {
    func gotoPage(page: MainPageEnum) {
        self.page = page
    }
    
//    func gotoHomePage() {
//        self.page = .HomePage
//    }
//
//    func gotoArticPage() {
//        self.page = .ArticPage
//    }
//
//    func gotoProfilePage() {
//        self.page = .ProfilePage
//    }
    
    func allPageCases() -> [MainPageEnum] {
        return MainPageEnum.allCases
    }
    
    func getIconName(page: MainPageEnum) -> String {
        if self.page == page {
            return page.selectedIconName
        }
        return page.iconName
    }
    
    func isSelectedPage(page: MainPageEnum) -> Bool {
        return self.page == page
    }
}
