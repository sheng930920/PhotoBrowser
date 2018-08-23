//
//  PhotoBrowserLocalImageMode.swift
//  JXPhotoBrowser
//
//  Created by JiongXing on 2018/8/22.
//

import Foundation

public struct PhotoBrowserLocalImageMode {
    
    var numberOfItemsClosure: () -> Int
    
    var imageAtIndexClosure: (Int) -> UIImage?
    
    /// 初始化
    /// - parameter numberOfItems: 共有多少项
    /// - parameter imageAtIndex: 每一项的图片对象
    public init(numberOfItems: @escaping () -> Int, imageAtIndex: @escaping (Int) -> UIImage?) {
        self.numberOfItemsClosure = numberOfItems
        self.imageAtIndexClosure = imageAtIndex
    }
}

extension PhotoBrowserLocalImageMode: PhotoBrowserMode {
    public func numberOfItems() -> Int {
        return numberOfItemsClosure()
    }
    
    public func configure(cell: PhotoBrowserCell, at index: Int) {
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.image = imageAtIndexClosure(index)
    }
}
