//
//  ScheduleView.swift
//  medical-app
//
//  Created by Rza Ismayilov on 29.04.22.
//

import UIKit
import SnapKit

class ScheduleView: UIView {

    private lazy var titleLable : UILabel = {
        let label = UILabel()
        
        label.text = "Schedule"
        label.font = UIFont.Bold(size: 27)
        label.textColor = UIColor(hexaRGB: "#0E1012")
        
        self.addSubview(label)
        return label
    }()
    
    private var selectedDate: Date? = nil {
        didSet {
            self.updateDateText()
        }
    }
    
    private lazy var dateInfoLabel : UILabel = {
        let label = UILabel()
        
        label.text = "Not selected"
        label.font = UIFont.Regular(size: 20)
        label.textColor = UIColor(hexaRGB: "#888888")
        
        self.addSubview(label)
        return label
    }()
    
    private lazy var datePicker : UIDatePicker = {
        let dp = UIDatePicker()
        
        dp.datePickerMode = .dateAndTime
        dp.preferredDatePickerStyle = .compact
        dp.addTarget(self, action: #selector(onDateChanged(_:)), for: .valueChanged)
        
        self.addSubview(dp)
        return dp
    }()
    
    
    public func setupView() -> ScheduleView {
        
        titleLable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.lessThanOrEqualTo(datePicker.snp.left).offset(-16)
        }
        
        dateInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        datePicker.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        return self
    }
    
    @objc func onDateChanged(_ sender: UIDatePicker) {
        self.selectedDate = sender.date
    }
    
    private func updateDateText() {
        guard let date = self.selectedDate else {
            dateInfoLabel.text = "Not selected"
            return
        }
            
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            
        self.dateInfoLabel.text = dateFormatter.string(from: date)
    }
}
