//
//  Transitor-Animators
//  Created by Sebastian Boldt on 17.11.16.

import UIKit

class DismissMeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissMe(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
