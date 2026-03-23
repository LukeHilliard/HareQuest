//
//  TestView.swift
//  HareQuest
//
//  Created by Luke Hilliard on 23/03/2026.
//

import UIKit

class TestView: UIView {
	private let label: UILabel =  {
		let label = UILabel()
		label.textAlignment = .center
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .red
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		label.frame = CGRect (
			x: 10,
			y: 10,
			width: frame.size.width - 20,
			height: frame.size.height - 20
		)
	}
	
}
