//
//  NativeNumberGeneratorViewManager.swift

import React
import UIKit

@objc (NativeNumberGeneratorViewManager)

class NativeNumberGeneratorViewManager: RCTViewManager {
    
    override static func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    override func view() -> UIView! {
//        guard let numberView = R.nib.nativeNumberGeneratorView.firstView(owner: self) else { return NativeNumberGeneratorView() }
//        return numberView
        
        return NativeNumberGeneratorView()
    }
}
