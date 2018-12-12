//
//  AppComponent.swift
//  MyApp
//
//  Created by Erik.Kerber on 12/11/18.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    
    init() {
        super.init(dependency: EmptyComponent())
    }
}
