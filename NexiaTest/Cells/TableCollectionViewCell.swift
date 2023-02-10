//
//  TableCollectionViewCell.swift
//  NexiaTest
//
//  Created by icarus on 07/02/23.
//

import UIKit
import SkeletonView

class TableCollectionViewCell: UICollectionViewCell {

    static let indentifier = "TableCollectionViewCell"
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init (frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
        setUpSkeleton()
        loadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        myImageView.frame = CGRect(x: 5, y: 5,
                                   width: contentView.frame.size.width-10,
                                   height: contentView.frame.size.height-5-50)
        
        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-50,
                                   width: contentView.frame.size.width-10,
                                   height: 50)
        
    }
    
    
    public func configure (with model: CollectionTableCellModel){
        myLabel.text = model.tile
        myLabel.textColor = .black
        myImageView.image = UIImage(named: model.image)

    }
     
    
    public func setUpSkeleton(){
        myLabel.isSkeletonable = true
        myLabel.linesCornerRadius = 8
        myImageView.isSkeletonable = true
    }
    
    public func loadData(){
        myLabel.showAnimatedGradientSkeleton()
        myImageView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .systemRed), animation: nil, transition: .crossDissolve(0.5))
        DispatchQueue.main.asyncAfter(deadline: .now() + 5)  {
            self.myLabel.hideSkeleton()
            self.myImageView.hideSkeleton()
        }
    }
    
    
}
 
