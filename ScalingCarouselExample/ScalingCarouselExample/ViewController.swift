//
//  ViewController.swift
//  ScalingCarouselExample
//
//  Created by 1v1 on 2021/02/03.
//

import UIKit
import ScalingCarousel

class Cell: ScalingCarouselCell {}

class ViewController: UIViewController {

    @IBOutlet weak var carousel: ScalingCarouselView!
    @IBOutlet weak var carouselBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var output: UILabel!
    
    private struct Constants {
        static let carouselHideConstant: CGFloat = -250
        static let carouselShowConstant: CGFloat = 15
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carouselBottomConstraint.constant = Constants.carouselHideConstant
        showHideButtonPressed()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        carousel.deviceRotated()
    }

    func showHideButtonPressed() {
        
        carouselBottomConstraint.constant = (carouselBottomConstraint.constant == Constants.carouselShowConstant ? Constants.carouselHideConstant : Constants.carouselShowConstant)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
}

typealias CarouselDatasource = ViewController
extension CarouselDatasource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        
        if let scalingCell = cell as? ScalingCarouselCell {
            scalingCell.mainView.backgroundColor = .red
            scalingCell.cornerRadius = 80
        }

        DispatchQueue.main.async {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }
        
        return cell
    }
}

typealias CarouselDelegate = ViewController
extension ViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        carousel.didScroll()
        
        guard let currentCenterIndex = carousel.currentCenterCellIndex?.row else { return }
        
        output.text = String(describing: currentCenterIndex)
    }
}

private typealias ScalingCarouselFlowDelegate = ViewController
extension ScalingCarouselFlowDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}
