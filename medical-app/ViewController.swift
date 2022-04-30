//
//  ViewController.swift
//  medical-app
//
//  Created by Rza Ismayilov on 29.04.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var segments : [UIView] = [
        ReportView().setupView(),
        AppointmentsView().setupView(),
        ScheduleView().setupView()
    ]
    
    private lazy var segmentCtrl : UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Report", "Appointments", "Schedule"])
       
        sc.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        sc.selectedSegmentIndex = 0
        segmentChanged(sc)
        
        self.view.addSubview(sc)
        return sc
    }()
    
    private lazy var viewWrapper : UIView = {
        let vw = UIView()
        self.view.addSubview(vw)
        return vw
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentCtrl.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(16)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)

        }
        
        viewWrapper.snp.makeConstraints { make in
            make.top.equalTo(segmentCtrl.snp.bottom).offset(16)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
    }
    
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        
        let segment = segments[sender.selectedSegmentIndex]
        
        viewWrapper.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        
        viewWrapper.addSubview(segment)
        
        segment.snp.makeConstraints { make in
            make.top.equalTo(viewWrapper.snp.top)
            make.left.equalTo(viewWrapper.snp.left)
            make.right.equalTo(viewWrapper.snp.right)
            make.bottom.equalTo(viewWrapper.snp.bottom)
        }
        
    }


}

