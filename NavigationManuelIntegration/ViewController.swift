//
//  ViewController.swift
//  NavigationManuelIntegration
//
//  Created by Emre Kuru on 2.12.2022.
//

import UIKit
import PoilabsNavigation

class ViewController: UIViewController {

    @IBOutlet weak var navigationView: UIView!
    var currentCarrier: PLNNavigationMapView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMap()
    }

    
    func loadMap() {
        PLNNavigationSettings.sharedInstance().applicationId = "applicationId"
        PLNNavigationSettings.sharedInstance().applicationSecret = "applicationSecret"
        PLNNavigationSettings.sharedInstance()?.navigationUniqueIdentifier = "uniqueId"
        
        PLNavigationManager.sharedInstance()?.getReadyForStoreMap(completionHandler: { (error) in
            if error == nil {
                let carrierView = PLNNavigationMapView(frame: CGRect(x: 0, y: 0, width: self.navigationView.bounds.size.width, height: self.navigationView.bounds.size.height))
                carrierView.awakeFromNib()
                carrierView.delegate = self
                carrierView.searchBarBaseView.backgroundColor = UIColor.black
                carrierView.searchCancelButton.setTitleColor(.white, for: .normal)
                self.currentCarrier = carrierView
                self.navigationView.addSubview(carrierView)
            } else {
                //show error
            }
        })
    }

}

extension ViewController: PLNNavigationMapViewDelegate {
    
    func childsAreReady() { }
    
    func didLocationStatusChange(_ status: PLLocationStatus) { }
    
}
