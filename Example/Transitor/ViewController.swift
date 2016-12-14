//
//  ViewController.swift
//  Transitor-Animators
//
//  Created by Sebastian Boldt on 11/16/2016.
//  Copyright (c) 2016 Sebastian Boldt. All rights reserved.
//
import UIKit
import Transitor

class ViewController: UIViewController {

    fileprivate lazy var model : [DataObject] = {
        return ExampleDataProvider().data
    }()
    
    @IBOutlet var presentMeButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    /// We need to keep a strong reference to the Animator because the transitiong delegate is weak
    fileprivate var transitorAnimator: TransitorAnimator?
    
    fileprivate func createVC() -> UIViewController? {
        return self.storyboard?.instantiateViewController(withIdentifier: "PresentMe")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let presentation = self.model[indexPath.row].presentation
        if (indexPath.row == self.model.count - 1) { // last
            let customAlert = (self.storyboard?.instantiateViewController(withIdentifier: "customNotification"))!
            self.transitorAnimator = TransitorAnimator(presentation:presentation)
            self.transitorAnimator?.prepare(viewController: customAlert)
            self.present(customAlert, animated: true, completion: nil)

        } else if let viewController = self.createVC() {
            self.transitorAnimator = TransitorAnimator(presentation:presentation)
            self.transitorAnimator?.prepare(viewController: viewController)
            self.present(viewController, animated: true, completion: nil)

        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let data = model[indexPath.row]
        cell.textLabel?.text = data.titleDescription
        cell.detailTextLabel?.text = data.detailDescription
        
        return cell
    }

    @objc(tableView:heightForRowAtIndexPath:)
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

