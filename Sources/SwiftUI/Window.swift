//
//  File.swift
//  
//
//  Created by Alsey Coleman Miller on 12/12/19.
//

import Foundation
import CSDL2
import SDL
import OpenSwiftUI

/// Window for hosting SwiftUI views.
public final class Window <Content: View> {
    
    // MARK: - Properties
    
    public private(set) var rootView: Content
    
    internal let window: SDLWindow
    
    internal let renderer: SDLRenderer
    
    public var identifier: UInt {
        return window.identifier
    }
    
    public var size: Size {
        let size = window.size
        return Size(width: size.width, height: size.height)
    }
    
    /// Size of a window’s underlying drawable in pixels.
    public var nativeSize: Size {
        let size = window.drawableSize
        return Size(width: size.width, height: size.height)
    }
    
    /// UI scale in points.
    public var scale: Float { return Float(nativeSize.width) / Float(size.width) }
    
    internal private(set) var context: ViewRepresentableContext
    
    // MARK: - Initialization
    
    public init(rootView: Content,
                title: String = "",
                frame: (x: SDLWindow.Position,
                        y: SDLWindow.Position,
                        width: Int,
                        height: Int)) throws {
        
        self.window = try SDLWindow(
            title: title,
            frame: frame,
            options: [.allowRetina, .opengl, .resizable, .shown]
        )
        
        self.renderer = try SDLRenderer(window: window, options: [.accelerated])
        
        self.rootView = rootView
        
        // initialize underlying root view
        guard let view = (rootView as? ViewRepresentable)?.load()
            else { fatalError("Invalid view \(Content.self)") }
    }
    
    // MARK: - Methods
    
    internal func render() throws {
        
        try renderer.setDrawColor(red: 0x00, green: 0x00, blue: 0x00, alpha: 0xFF)
        try renderer.clear()
        //try render(view: view, origin: .zero)
        //renderer.present()
    }
}
