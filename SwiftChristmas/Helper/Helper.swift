//
//  Helper.swift
//  SwiftChristmas
//
//  Created by Angelos Staboulis on 16/11/23.
//

import Foundation
import UIKit
import AVKit
class Helper{
    static let shared = Helper()
    private init(){}
    func circle(color:UIColor)->UIImage{
        let rect = CGRect(origin: .zero, size: CGSize(width: 5, height: 5))
        let image = UIGraphicsImageRenderer(size: rect.size).image { context in
            context.cgContext.setFillColor(color.cgColor)
            context.cgContext.addEllipse(in: rect)
            context.cgContext.fillPath()
        }
        return image
    }
    func playJingleBell(view:UIView){
        let audio = Bundle.main.path(forResource: "jingle", ofType: "mp3")
        let audioPlayer = AVPlayer(url: URL(filePath: audio!))
        let layer = AVPlayerLayer(player: audioPlayer)
        audioPlayer.play()
        view.layer.addSublayer(layer)
    }
    func createLayer(view:UIView)->CAEmitterLayer{
        let emitterLayer = CAEmitterLayer()
        emitterLayer.position = CGPoint(x: view.frame.width / 2, y: 1)
        emitterLayer.emitterShape = .line
        emitterLayer.emitterMode = .points
        emitterLayer.renderMode = .additive
        emitterLayer.emitterCells = [Helper.shared.createCell()]
        return emitterLayer
    }
    func createCell()->CAEmitterCell{
        let cell = CAEmitterCell()
        cell.birthRate = 40
        cell.lifetime = 100
        cell.velocity = 100
        cell.velocityRange = 100
        cell.emissionRange = .pi * 2
        cell.contents = circle(color: .white).cgImage
        return cell
    }
}
