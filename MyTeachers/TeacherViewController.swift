//
//  TeacherViewController.swift
//  MyTeachers
//
//  Created by Daniel Aguiar on 31/08/18.
//  Copyright © 2018 Daniel Aguiar. All rights reserved.
//

import UIKit
import CoreData

class TeacherViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfTheme: UITextField!
    @IBOutlet weak var btAddEdit: UIButton!
    
    var teacher: Teacher!
    override func viewDidLoad() {
        super.viewDidLoad()

        if teacher != nil {
            tfName.text = teacher.name
            tfTheme.text = teacher.theme
            btAddEdit.setTitle("Editar", for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addEditTeacher(_ sender: Any) {
        
        if teacher == nil {
            teacher = Teacher(context: context)
        }
        
        teacher.name = tfName.text
        teacher.theme = tfTheme.text
        
        try? context.save()
        
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
