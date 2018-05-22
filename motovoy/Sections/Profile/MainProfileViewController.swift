//
//  MainProfileViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material

class MainProfileTabsController: TabsController {
    
    open override func prepare() {
        super.prepare()
        tabBar.setLineColor(MColor.orange, for: .selected)
        tabBar.setTabItemsColor(MColor.orange, for: .normal)
        tabBar.tintColor = MColor.orange
        tabBarAlignment = .top
        tabBar.tabBarStyle = .nonScrollable
        tabBar.dividerColor = UIColor.white
//        tabBar.lineHeight = 5.0
        tabBar.lineAlignment = .bottom
        //    tabBar.backgroundColor = Color.blue.darken2
    }
    
}

class MainProfileViewController: BaseNavigationViewController {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var tabBarContainer: UIView!
    @IBOutlet weak var navigationBar: NavigationShadowedView!
    
    var tabController: MainProfileTabsController!
    var editButton: IconButton? = nil
    var isConfigured: Bool = false

}

extension MainProfileViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (!isConfigured) {
            configureTabController()
            isConfigured = true
        }
    }
    
    @objc func editBilling() {
        let storyboard = UIStoryboard.init(name: "Profile", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "BillingCreation") as! AddBillingRecordViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func configureTabController() {
        let sb = UIStoryboard(name: "Profile", bundle: nil)
        tabController = MainProfileTabsController(viewControllers: [
            sb.instantiateViewController(withIdentifier: "ProfileTab"),
            sb.instantiateViewController(withIdentifier: "BillingTab"),
            sb.instantiateViewController(withIdentifier: "PaymentTab")
        ])
        addChildViewController(tabController)
        tabController.delegate = self
        tabController.isSwipeEnabled = false
        container.addSubview(tabController.view)
        tabController.view.frame = container.bounds
        tabBarContainer.addSubview(tabController.tabBar)
        tabController.tabBar.frame = tabBarContainer.bounds
        tabController.container.frame = container.bounds
    }
    
    func showEditButton() {
        if (editButton == nil) {
            let button = IconButton(image: Icon.edit)
            button.tintColor = MColor.blue
            self.navigationBar.layout(button).top(50).right(20).height(50).width(50)
            editButton = button
            button.addTarget(self, action: #selector(editBilling), for: UIControlEvents.touchUpInside)
        }else {
            editButton?.isHidden = false
        }
    }
    
    func hideEditButton() {
        self.editButton?.isHidden = true
    }
    
}

extension MainProfileViewController: TabsControllerDelegate {
    
    func tabsController(tabsController: TabsController, didSelect viewController: UIViewController) {
        let vc = tabsController.selectedIndex
        if vc == 1 {
            showEditButton()
        }else {
            hideEditButton()
        }
    }
    
}

