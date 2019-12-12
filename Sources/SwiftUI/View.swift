//
//  File.swift
//  
//
//  Created by Alsey Coleman Miller on 12/12/19.
//

import Foundation
import SDL

internal final class SDLView {
    
    // MARK: - Properties
    
    public private(set) var subviews = [View]()
    
    public private(set) weak var superview: View?
    
    public var alpha: Float = 1.0 {
        didSet {
            assert(alpha >= 0.0 && alpha <= 1.0, "Invalid alpha \(alpha)")
            //setNeedsDisplay()
        }
    }
    
    public var window: Window?
    
    /// The root view in the hierarchy.
    private var rootSuperview: View {
        return superview?.rootSuperview ?? self
    }
    
    internal var rootWindow: Window? {
        return window ?? superview?.rootWindow
    }
    
    // MARK: - Initialization
    
    public init(frame: Rect = .zero) {
        self.frame = frame
    }
    
    // MARK: - Methods
    
    public func addSubview(_ view: View) {
        
        self.subviews.append(view)
        view.superview = self
    }
    
    public func removeFromSuperview() {
        
        guard let superview = self.superview,
            let index = superview.subviews.firstIndex(where: { $0 === self })
            else { return }
        
        superview.subviews.remove(at: index)
    }
}

internal protocol ViewRepresentable {
    
    associatedtype ViewType: SDLView
    typealias Context = ViewRepresentableContext<Self>
    
    func makeView(context: Context) -> ViewType
    func updateView(_ view: ViewType, context: Context)
}

internal extension ViewRepresentable {
    
    func load(context: Context) -> ViewType {
        let view = makeView(context: context)
        updateView(view, context: context)
        return view
    }
}

internal struct ViewRepresentableContext <Representable : ViewRepresentable> {
    
    
}
