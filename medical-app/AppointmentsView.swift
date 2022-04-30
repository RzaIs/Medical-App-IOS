//
//  Appointments.swift
//  medical-app
//
//  Created by Rza Ismayilov on 29.04.22.
//

import UIKit
import SnapKit

class AppointmentsView: UIView {
    
    private lazy var cards : [AppointmentCardView] = [
        AppointmentCardView().setupView(appointmentCardData: AppointmentCardData(day: 12, weekDay: "Tue", hour: "09:30 AM", docName: "Dr. Mim Akhter", caseName: "Depression", bgColor: UIColor(hexaRGB: "#1C6BA4")!)),
        AppointmentCardView().setupView(appointmentCardData: AppointmentCardData(day: 16, weekDay: "Mon", hour: "11:30 AM", docName: "Dr. Stephen Strange", caseName: "Magic cure", bgColor: UIColor(hexaRGB: "#E09F1F")!))
    ]

    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        
        label.text = "Appointments"
        label.font = UIFont.Bold(size: 27)
        label.textColor = UIColor(hexaRGB: "#0E1012")
        
        self.addSubview(label)
        return label
    }()
    
    private lazy var subtitleLabel : UILabel = {
        let label = UILabel()
        
        label.text = "Upcoming Appointments"
        label.font = UIFont.Bold(size: 17)
        label.textColor = UIColor(hexaRGB: "#0E1012")
        
        self.addSubview(label)
        return label
    }()
    
    private var stackView : UIStackView = {
        let view = UIStackView()
        
        view.axis = .horizontal
        
        return view
    }()
    
    private lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
                
        view.addSubview(stackView)
        view.isPagingEnabled = true
        view.delegate = self
        view.showsHorizontalScrollIndicator = false
        
        self.addSubview(view)
        return view
    }()
    
    private lazy var pageCtrl : UIPageControl = {
        let pc = UIPageControl()
        
        pc.numberOfPages = cards.count
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = UIColor(hexaRGB: "#007AFF")
        pc.pageIndicatorTintColor = UIColor(hexaRGB: "#AEAEB2")
        pc.addTarget(self, action: #selector(onPageCtrlChanged(_:)), for: .valueChanged)
        
        self.addSubview(pc)
        return pc
    }()
    
    public func setupView() -> AppointmentsView {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.contentLayoutGuide.snp.top)
            make.left.equalTo(scrollView.contentLayoutGuide.snp.left)
            make.right.equalTo(scrollView.contentLayoutGuide.snp.right)
            make.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom)
            make.centerY.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(336)
        }
        
        pageCtrl.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        cards.forEach { t in
            stackView.addArrangedSubview(t)
            t.snp.makeConstraints { make in
                make.width.equalTo(336)
            }
        }
        
        return self
    }
    
    @objc func onPageCtrlChanged(_ sender: UIPageControl) {
        scrollView.setContentOffset(CGPoint.init(x: CGFloat(sender.currentPage) * scrollView.frame.width, y: 0), animated: true)
    }

}

extension AppointmentsView : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index  = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageCtrl.currentPage = index
    }
}
