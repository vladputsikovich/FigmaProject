//
//  GradientView.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 6.02.22.
//

import UIKit

class GradientView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        commonSetup()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonSetup()
    }

    private func commonSetup() {
        backgroundColor = .clear
        isOpaque = false
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors = [
            startColor.cgColor,
            endColor.cgColor
        ] as CFArray
        let locations: [CGFloat] = [startLocation, endLocation]
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations) else {
            UIColor.red.setFill()
            context.fill(rect)
            return
        }

        let start = CGPoint.zero
        let end = CGPoint(x: 0, y: rect.height)

        context.drawLinearGradient(gradient, start: start, end: end, options: [
            .drawsBeforeStartLocation,
            .drawsAfterEndLocation
        ])
    }
    
    @IBInspectable var startColor: UIColor = .lightBlue {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var endColor: UIColor = .white {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var startLocation: CGFloat = 1.0 {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var endLocation: CGFloat = 0.5 {
        didSet {
            setNeedsDisplay()
        }
    }

}
