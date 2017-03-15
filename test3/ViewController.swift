//
//  ViewController.swift
//  test3
//
//  Created by Yize Wu on 2017/3/14.
//  Copyright © 2017年 Yize Wu. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    
    var scale = 1.0
    let blueView = UIView()
    let redView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.backgroundColor = UIColor.red
        self.view.addSubview(redView)
        blueView.backgroundColor = UIColor.blue
        self.view.addSubview(blueView)
        
        redView.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top:100,left:100,bottom:100,right:100))
        }
        
        
        
        
        blueView.snp_makeConstraints { (make) in
            
            make.width.equalTo(scale*20).priority(600)
            make.height.equalTo(scale*20).priority(600)
            make.center.equalTo(self.view)
            make.width.lessThanOrEqualTo(self.redView.snp.width)
            make.height.lessThanOrEqualTo(self.redView.snp.height)
        }
    
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapDid))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(tap)
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tapDid(){
        print("1 ")
        self.scale = self.scale + 0.5
        self.view.setNeedsUpdateConstraints()
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func updateViewConstraints() {
        self.blueView.snp_updateConstraints { (make) in
            make.width.equalTo(20*scale).priority(600)
            make.height.equalTo(20*scale).priority(600)
            
        }
        super.updateViewConstraints()
    }

}

