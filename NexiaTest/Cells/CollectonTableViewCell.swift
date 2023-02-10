//
//  CollectonTableViewCell.swift
//  NexiaTest
//
//  Created by icarus on 07/02/23.
//


import UIKit

protocol CollectionTableCellDelegate: AnyObject {
    func didSelectItem(with model: CollectionTableCellModel)
}

class CollectonTableViewCell: UITableViewCell {
    
    public weak var delegate:CollectionTableCellDelegate?
    
    static let identifier = "CollectonTableViewCell"
    
    private var models = [CollectionTableCellModel]()
    
    private let colletionView : UICollectionView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 170, height: 170)
        layout.sectionInset = UIEdgeInsets(top: 3,
                                           left: 3,
                                           bottom: 3,
                                           right: 3)
        self.colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        colletionView.showsHorizontalScrollIndicator = false
        colletionView.showsVerticalScrollIndicator = false
        colletionView.register(TableCollectionViewCell.self, forCellWithReuseIdentifier: TableCollectionViewCell.indentifier)
        
        colletionView.delegate = self
        colletionView.dataSource = self
        contentView.addSubview(colletionView)
        //viewDidAppear(true)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        colletionView.frame = contentView.bounds
    }
    
  
    
    public func configure(with models: [CollectionTableCellModel]){
        self.models =  models
        colletionView.backgroundColor = .white
        colletionView.reloadData()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension CollectonTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.indentifier, for: indexPath) as! TableCollectionViewCell
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.didSelectItem(with: model)
    }
}
