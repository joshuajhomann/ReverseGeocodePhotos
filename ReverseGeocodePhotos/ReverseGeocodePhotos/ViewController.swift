//
//  ViewController.swift
//  ReverseGeocodePhotos
//
//  Created by Joshua Homann on 11/9/17.
//  Copyright © 2017 josh. All rights reserved.
//

import UIKit
import Photos
import CoreLocation

class ViewController: UIViewController {
    // MARK: - IBOutlet

    // MARK: - Variables
    let picker = UIImagePickerController()
    // MARK: - Constants
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }

    deinit {
    }
    // MARK: - Instance Methods
    // MARK: - IBAction
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let asset = info [UIImagePickerControllerPHAsset] as? PHAsset,
           let location = asset.location {
            CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                print(placemarks?.first?.name)
            }
        }
    }
}

