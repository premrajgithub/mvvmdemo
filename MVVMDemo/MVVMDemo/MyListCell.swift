//
//  MyListCell.swift
//  MVVMDemo
//
//  Created by Jayanthi Baskar on 28/09/20.
//  Copyright © 2020 cybaze. All rights reserved.
//

import UIKit
import SDWebImage
class MyListCell: UITableViewCell {
    
    var detailImage = UIImageView()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var marginGuide:UILayoutGuide!
    var stackedInfoView: UIStackView!
    var imageAspectRatioConstraint: NSLayoutConstraint?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        marginGuide = contentView.layoutMarginsGuide
        stackedInfoView = UIStackView(arrangedSubviews: [detailImage, titleLabel,descriptionLabel])
        addSubview(stackedInfoView)
        stackedInfoView.pinEdge(contentView)
//        addSubview(titleLabel)
//        addSubview(descriptionLabel)
//        addSubview(detailImage)
        detailImage.setContentCompressionResistancePriority(.required, for: .vertical)
//        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
//        descriptionLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        detailImage.contentMode  = .scaleAspectFill
        contentView.bringSubview(toFront: titleLabel)
        contentView.bringSubview(toFront: descriptionLabel)
        
        stackedInfoView.axis = .vertical
        stackedInfoView.distribution = .equalCentering
        stackedInfoView.alignment = .center
        stackedInfoView.spacing = 10.0

        stackedInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        stackedInfoView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackedInfoView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        configureDetailImage()
        configureTitleLabel()
        configureDescriptionLabel()
        setDetailImageConstraints()
        setTitleLabelConstraints()
        setDescriptionLabelConstraints()
        setNeedsDisplay()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setCell(_ forData:Rows) {
        if forData.title != nil {
            self.titleLabel.text = forData.title?.trimmingCharacters(in: .whitespaces)
        }
        else {
            self.titleLabel.text = ""
        }
        if forData.description != nil {
            self.descriptionLabel.text = forData.description?.trimmingCharacters(in: .whitespaces)
        }
        else {
            self.descriptionLabel.text = ""
        }
        if let imageUrl = forData.imageHref  {
            if let url = URL(string: imageUrl) {
                self.detailImage.sd_setImage(with: url) { (imgage, error, cachetype, url) in
                    print("image dowload completed")
                    self.detailImage.isHidden = false
                }
            }
            else{
                self.detailImage.isHidden = true
            }
        }
        else {
            self.detailImage.isHidden = true
        }
    }
    
    func configureDetailImage() {
        detailImage.layer.cornerRadius = 2
        detailImage.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = false
    }
    func configureDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontSizeToFitWidth = false
    }
    func setDetailImageConstraints() {
        
        detailImage.translatesAutoresizingMaskIntoConstraints = false

    }
    func setTitleLabelConstraints() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: detailImage.bottomAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor).isActive = true
        titleLabel.font = UIFont(name: "Avenir-Book", size: 16)
    }
    func setDescriptionLabelConstraints() {
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        descriptionLabel.font = UIFont(name: "Avenir-Book", size: 12)
        descriptionLabel.textColor = UIColor.lightGray

    }
}
