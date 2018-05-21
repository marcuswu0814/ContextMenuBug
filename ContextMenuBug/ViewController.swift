//
//  ViewController.swift
//  ContextMenuBug
//
//  Created by Marcus Wu on 2018/5/22.
//  Copyright © 2018年 Marcus Wu. All rights reserved.
//

import UIKit
import ContextMenu
import IGListKit

class ViewController: UIViewController {

    fileprivate lazy var collectionView: UICollectionView = {
        let layout = ListCollectionViewLayout(stickyHeaders: true,
                                              topContentInset: 0,
                                              stretchToEdge: false)
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    fileprivate lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self)
        adapter.dataSource = self
        adapter.collectionView = collectionView
        
        return adapter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(rightBarButtonClick), for: .touchUpInside)
        button.setTitle("Filter", for: .normal)
        let item = UIBarButtonItem(customView: button)
        
        navigationItem.rightBarButtonItem = item
        
        view.addSubview(collectionView)
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.frame = view.frame
    }

    @objc func rightBarButtonClick() {
        let viewController = UIViewController()
        viewController.preferredContentSize = CGSize(width: 200, height: 200)
        
        ContextMenu().show(sourceViewController: self,
                           viewController: viewController,
                           sourceView: navigationItem.rightBarButtonItem?.customView,
                           delegate: nil)
    }

}

extension ViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15] as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return SectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}
