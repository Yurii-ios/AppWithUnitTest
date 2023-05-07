//
//  SignupViewController.swift
//  PhotoAppWithUnitTestExample
//
//  Created by Yurii Sameliuk on 28/04/2023.
//

import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var nextViewButton: UIButton!
    
    var signupPresenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        #if DEBUG
        //        if CommandLine.arguments.contains("-skipSurvey") {
        //            print("Skipping survey page")
        //        }
        //        #endif
        //  /// much more advanced
        //        #if DEBUG
        //        if ProcessInfo.processInfo.arguments.contains("-skipSurvey") {
        //            print("Skipping survey page")
        //        }
        //        #endif
        /// reading Launch environment
       // ProcessInfo.processInfo.environment[""] ?? SignupConstants.signupURLStrin
        
        
        if signupPresenter == nil {
            let signupModelValidator = SignUpModelFormValidator()
            
            var signupUrl = SignupConstants.signupURLString
            
            #if DEBUG
            signupUrl = ProcessInfo.processInfo.environment["signupUrl"] ?? SignupConstants.signupURLString
            #endif
            
            let webservice = SignupWebService(urlString: signupUrl)
            
            signupPresenter = SignupPresenter(formModelValidator: signupModelValidator, webservice: webservice, delegate: self)
        }
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let signupFormModel = SignupFormModel(firstName: firstNameTextField.text ?? "",
                                              lastName: lastNameTextField.text ?? "",
                                              email: emailTextField.text ?? "",
                                              password: passwordTextField.text ?? "",
                                              repeatPassword: repeatPasswordTextField.text ?? "" )
        
        signupPresenter?.processUserSignup(formModel: signupFormModel)
    }
    
    @IBAction func nextViewButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVC.view.accessibilityIdentifier = "SecondViewController"
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension SignupViewController: SignupViewDelegateProtocol {
    func successfullSignup() {
        let alert = UIAlertController(title: "Success", message: "The signup operation was successful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "successAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func errorHandler(error: SignupError) {
        let alert = UIAlertController(title: "Error", message: "Your request could not be processed at this time", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
}
