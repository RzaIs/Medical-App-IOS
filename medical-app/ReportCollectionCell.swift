//
//  ReportCollectionCell.swift
//  medical-app
//
//  Created by Rza Ismayilov on 29.04.22.
//

import UIKit
import SnapKit

class ReportCollectionCell : UICollectionViewCell {
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        
        label.font = UIFont.Regular(size: 16)
        label.textColor = UIColor(hexaRGB: "#0E1012")
        
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var valueLabel : UILabel = {
        let label = UILabel()

        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var mainImageView : UIImageView = {
        let view = UIImageView()
        
        self.contentView.addSubview(view)
        return view
    }()
    
    private lazy var ellipsisImageView : UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(systemName: "ellipsis")?.withTintColor( UIColor(hexaRGB: "#4A545E")!, renderingMode: .alwaysOriginal)
    
        return view
    }()
    
    
    public func setupView(reportCellData : ReportCellData) {

        self.contentView.backgroundColor = reportCellData.bgColor
        
        titleLabel.text = reportCellData.title
        mainImageView.image = UIImage(named: reportCellData.imageName)
        self.contentView.layer.cornerRadius = 24
        
        
        if (reportCellData.isSmall) {
            
            setValueText(value: reportCellData.value, unit: reportCellData.unit, fontSize: 30)
            
            mainImageView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(24)
                make.left.equalToSuperview().offset(16)
                make.width.equalTo(15)
                make.height.equalTo(22)
            }
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(mainImageView.snp.bottom).offset(16)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-16)
            }
            
            valueLabel.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(16)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-16)
                make.bottom.lessThanOrEqualTo(self.contentView.snp.bottom).offset(-16)
            }
            
            self.contentView.addSubview(ellipsisImageView)
            
            ellipsisImageView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(24)
                make.right.equalToSuperview().offset(-16)
            }
            
        } else {
            
            setValueText(value: reportCellData.value, unit: reportCellData.unit, fontSize: 50)
            
            mainImageView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(24)
                make.right.equalToSuperview().offset(-16)
                make.bottom.equalToSuperview().offset(-24)
                make.height.equalTo(112)
                make.width.equalTo(144)
            }
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(mainImageView.snp.top)
                make.left.equalToSuperview().offset(16)
                make.right.equalTo(mainImageView.snp.left).offset(-16)
            }
            
            valueLabel.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(16)
                make.left.equalToSuperview().offset(16)
                make.right.equalTo(mainImageView.snp.left).offset(-16)
                make.bottom.equalToSuperview().offset(-16)
            }
            
        }
    }
    
    private func setValueText(value : String, unit : String, fontSize: Int) {
        valueLabel.textColor = UIColor(hexaRGB: "#0E1012")
        let regularFont = UIFont.Regular(size: CGFloat(fontSize))
        let subFont = UIFont.Regular(size: CGFloat(fontSize) * 0.6)
        let valueText = NSMutableAttributedString(string: "\(value)\(unit)", attributes: [.font : regularFont])
        valueText.setAttributes([.font : subFont, .baselineOffset: 0], range: NSRange(location: value.count , length: unit.count))
        valueLabel.attributedText = valueText
    }
    
}

struct ReportCellData {
    var title : String
    var value : String
    var unit : String
    var imageName : String
    var isSmall : Bool
    var bgColor : UIColor
}
