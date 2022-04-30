//
//  ReportCollectionView.swift
//  medical-app
//
//  Created by Rza Ismayilov on 29.04.22.
//

import UIKit

class ReportCollectionView : UICollectionView {

    private var REPORT_CELL = "report_cell"
    
    private var reportCells = [
        ReportCellData(title: "Heart Rate", value: "96", unit: "bpm", imageName: "heart", isSmall: false, bgColor: UIColor(hexaRGB: "#DCEDF9")!),
        ReportCellData(title: "Blood Group", value: "A+", unit: "", imageName: "blood", isSmall: true, bgColor: UIColor(hexaRGB: "#F5E1E9")!),
        ReportCellData(title: "Wight", value: "80", unit: "kg", imageName: "weight", isSmall: true, bgColor: UIColor(hexaRGB: "#FAF0DB")!)
    ]
    
    public func setupView() -> ReportCollectionView {
        self.dataSource = self
        self.delegate = self
        
        self.register(ReportCollectionCell.self, forCellWithReuseIdentifier: REPORT_CELL)
        
        return self
    }
    

}

extension ReportCollectionView : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reportCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: REPORT_CELL, for: indexPath) as! ReportCollectionCell
        cell.setupView(reportCellData: reportCells[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (indexPath.row % 3 == 0) {
            return CGSize(width: self.frame.width , height: 160)
        } else {
            return CGSize(width: self.frame.width / 2 - 5, height: 156)
        }
    }
    
}
