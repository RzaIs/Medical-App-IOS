//
//  ReportView.swift
//  medical-app
//
//  Created by Rza Ismayilov on 29.04.22.
//

import UIKit
import SnapKit

class ReportView: UIView {

    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        
        label.text = "Report"
        label.font = UIFont.Bold(size: 27)
        label.textColor = UIColor(hexaRGB: "#0E1012")
        
        self.addSubview(label)
        return label
    }()
    
    private lazy var reportCollectionView : ReportCollectionView = {
        let flowLayout : UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            return layout
        }()
        
        let view = ReportCollectionView(frame: .zero, collectionViewLayout: flowLayout).setupView()
        
        self.addSubview(view)
        return view
    }()
    
    public func setupView() -> ReportView{
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        
        reportCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        return self
    }
    
}
