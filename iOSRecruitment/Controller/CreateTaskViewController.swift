//
//  CreateTaskViewController.swift
//  iOSRecruitment
//
//  Created by Rodolphe Schnetzer on 17/01/2021.
//  Copyright © 2021 cheerz. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var titleTaskTextField: UITextField!
    @IBOutlet weak var taskTextView: UITextView!
    
    private var coreDataManager: CoreDataManager?
    var taskDetails : TaskDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let coredataStack = appdelegate.coreDataStack
        coreDataManager = CoreDataManager(coreDataStack: coredataStack)
        titleTaskTextField.text = taskDetails?.title
        taskTextView.text = taskDetails?.text
    }
    
    // MARK: - IBAction
    
    @IBAction func addTaskButton(_ sender: Any) {
        
        guard let textTitle = titleTaskTextField.text else { return }
        guard let textTask = taskTextView.text else { return }
        
        coreDataManager?.createTask(title: textTitle, text: textTask)
        _ = navigationController?.popViewController(animated: true)
        
    }
}

