//
//  RoundedSlider.swift
//  CombineStudy
//
//  Created by kakao on 2021/11/11.
//

import UIKit

final class RoundedSlider: UISlider {
    
    private lazy var thumbView: UIView = {
        let thumbView: UIView = .init(frame: .zero)
        thumbView.backgroundColor = minTrackColor
        thumbView.layer.borderWidth = 0
        thumbView.layer.borderColor = minTrackColor?.cgColor
        return thumbView
    }()
    
    private var minTrackColor: UIColor?
    private var maxTrackColor: UIColor?
    private var heightValue: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.maximumValue = 0.99     제대로 동작 안함. 실제로 value를 설정할 때 0.99를 max로 놓고 설정해야 함.
    }
    
    convenience init(height: CGFloat, minTrackColor: UIColor, maxTrackColor: UIColor) {
        self.init(frame: .zero)
        
        self.heightValue = height
        self.minTrackColor = minTrackColor
        self.maxTrackColor = maxTrackColor
        self.minimumTrackTintColor = minTrackColor
        self.maximumTrackTintColor = maxTrackColor
        
        let thumb = thumbImage(height: height)
        setThumbImage(thumb, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func thumbImage(height: CGFloat) -> UIImage {
        thumbView.frame = CGRect(x: 0, y: height / 2, width: height, height: height)
        thumbView.layer.cornerRadius = height / 2
        
        let renderer = UIGraphicsImageRenderer(bounds: thumbView.bounds)
        return renderer.image { rendererContext in
            thumbView.layer.render(in: rendererContext.cgContext)
        }
    }
    
    func remakeThumb(withColor color: UIColor) {
        // minimumTrackTintColor가 초기 설정값과 달라져야 할 때 호출
        self.minTrackColor = color
        self.minimumTrackTintColor = color
        thumbView.backgroundColor = color
        thumbView.layer.borderColor = color.cgColor
        
        let thumb = thumbImage(height: heightValue)
        setThumbImage(thumb, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if #available(iOS 14.0, *) {
            if let layers = layer.sublayers?.first?.sublayers, layers.count > 1  {
                layers[1].cornerRadius = layers[1].bounds.height / 2
            }
        } else {
            if let layers = layer.sublayers, layers.count > 1 {
                layers[1].cornerRadius = layers[1].bounds.height / 2
            }
        }
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: heightValue))
    }
}
