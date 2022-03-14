//
//  AnimatorPop.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 15.02.2022.
//

import UIKit

class AnimatorPop: NSObject, UIViewControllerAnimatedTransitioning {
        
        func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return 2
        }
        
        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            guard let source = transitionContext.viewController(forKey: .from),
                  let destination = transitionContext.viewController(forKey: .to)
            else {return}
            
            let containerViewFrame = transitionContext.containerView.frame
            let sourceViewTargetFrame = CGRect(x: containerViewFrame.width,
                                               y: 0,
                                               width: containerViewFrame.height,
                                               height: containerViewFrame.width)
            
            
            let destinationViewTargetFrame = source.view.frame
            transitionContext.containerView.addSubview(destination.view)
            destination.view.frame = CGRect(x: -containerViewFrame.height,
                                            y: 0,
                                            width: containerViewFrame.height,
                                            height: containerViewFrame.width)
            
            destination.view.transform = CGAffineTransform(rotationAngle: M_PI/2)
            
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext)) {
                
                source.view.transform = CGAffineTransform(rotationAngle: -M_PI/2)
                source.view.frame = sourceViewTargetFrame
                
                destination.view.transform = .identity
                destination.view.frame = destinationViewTargetFrame
                
            } completion: { finished in
                transitionContext.completeTransition(finished)
                source.view.transform = .identity
            }
        }
    }



