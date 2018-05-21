//
//  SectionController.swift
//  ContextMenuBug
//
//  Created by Marcus Wu on 2018/5/22.
//  Copyright © 2018年 Marcus Wu. All rights reserved.
//

import Foundation
import IGListKit
import ContextMenu

class SectionController: ListSectionController {
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 74)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "Cell",
                                                                bundle: nil,
                                                                for: self,
                                                                at: index) as? Cell else {
                                                                    fatalError()
        }
                
        return cell
    }
    
    override func didSelectItem(at index: Int) {
        guard let cell = collectionContext?.cellForItem(at: index, sectionController: self) else {
            fatalError()
        }
        
        let viewController = UIViewController()
        viewController.preferredContentSize = CGSize(width: 200, height: 200)
        
        ContextMenu().show(sourceViewController: self.viewController!,
                           viewController: viewController,
                           sourceView: cell,
                           delegate: nil)
    }
    
}
