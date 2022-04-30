//
//  AppointmentCard.swift
//  medical-app
//
//  Created by Rza Ismayilov on 29.04.22.
//

import UIKit
import SnapKit

class AppointmentCardView : UIView {
    
    private lazy var paddingView : UIView = {
        let view = UIView()
        
        view.layer.cornerRadius = 28
        
        self.addSubview(view)
        return view
    }()

    private var dayLabel : UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.font = UIFont.Bold(size: 22)
        label.textColor = UIColor(hexaRGB: "#FFFFFF")
        
        return label
    }()
    
    private var weekDayLabel : UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.font = UIFont.Bold(size: 16)
        label.textColor = UIColor(hexaRGB: "#FFFFFF")

        return label
    }()
    
    private lazy var dayView : UIView = {
        let view = UIView()
        
        view.addSubview(dayLabel)
        view.addSubview(weekDayLabel)
        view.backgroundColor = UIColor(hexaRGBA: "#FFFFFF24")
        view.layer.cornerRadius = 24
        
        paddingView.addSubview(view)
        return view
    }()
    
    private lazy var hourLabel : UILabel = {
        let label = UILabel()
        
        label.font = UIFont.Regular(size: 14)
        label.textColor = UIColor(hexaRGB: "#FFFFFF")
        
        paddingView.addSubview(label)
        return label
    }()
    
    private lazy var doctorLabel : UILabel = {
        let label = UILabel()
        
        label.font = UIFont.Bold(size: 19)
        label.textColor = UIColor(hexaRGB: "#FFFFFF")
        
        paddingView.addSubview(label)
        return label
    }()
    
    private lazy var caseLabel : UILabel = {
        let label = UILabel()
        
        label.font = UIFont.Bold(size: 15)
        label.textColor = UIColor(hexaRGBA: "#FFFFFFA6")
        
        paddingView.addSubview(label)
        return label
    }()
    
    private lazy var ellipsisImageView : UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(systemName: "ellipsis")?.withTintColor(UIColor(hexaRGBA: "#FFFFFF9E")!, renderingMode: .alwaysOriginal)
        
        paddingView.addSubview(view)
        return view
    }()
    
    public func setupView(appointmentCardData : AppointmentCardData) -> AppointmentCardView {
                
        paddingView.backgroundColor = appointmentCardData.bgColor
        dayLabel.text = "\(appointmentCardData.day)"
        weekDayLabel.text = appointmentCardData.weekDay
        hourLabel.text = appointmentCardData.hour
        doctorLabel.text = appointmentCardData.docName
        caseLabel.text = appointmentCardData.caseName
        
        paddingView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        dayView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.equalTo(72)
        }
        
        dayLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        weekDayLabel.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        hourLabel.snp.makeConstraints { make in
            make.top.equalTo(dayView.snp.top).offset(16)
            make.left.equalTo(dayView.snp.right).offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        doctorLabel.snp.makeConstraints { make in
            make.top.equalTo(hourLabel.snp.bottom).offset(16)
            make.left.equalTo(dayView.snp.right).offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(caseLabel.snp.top).offset(-16)
        }
        
        caseLabel.snp.makeConstraints { make in
            make.left.equalTo(dayView.snp.right).offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        ellipsisImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        return self
    }

}

struct AppointmentCardData {
    var day : Int
    var weekDay : String
    var hour : String
    var docName : String
    var caseName : String
    var bgColor : UIColor
}
