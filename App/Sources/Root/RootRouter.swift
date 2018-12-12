//
//  RootRouter.swift
//  MyApp
//
//  Created by Erik.Kerber on 12/11/18.
//

import RIBs

protocol RootInteractable: Interactable, QuatroListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    private let quatroBuilder: QuatroBuildable

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
                  viewController: RootViewControllable,
                  quatroBuilder: QuatroBuilder) {
        self.quatroBuilder = quatroBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        uno()
    }
    
    func uno() {
        let uno = quatroBuilder.build(withListener: interactor)
        attachChild(uno)
        (viewControllable.uiviewController as! UINavigationController).setViewControllers([uno.viewControllable.uiviewController], animated: false)
        viewControllable.uiviewController.addChild(uno.viewControllable.uiviewController)
        uno.viewControllable.uiviewController.view.frame = viewControllable.uiviewController.view.bounds
    }
}
