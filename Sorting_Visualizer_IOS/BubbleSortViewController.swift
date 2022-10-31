//
//  BubbleSortViewController.swift
//  Sorting_Visualizer_IOS
//
//  Created by Michael Benliyan on 10/31/22.
//

import UIKit
class BubbleSortViewController: UIViewController {
    let implementationText: [String] = ["""
    sorted = false
    while !sorted:
        i = 0
        sorted = true
        while i < len(array)-1:
            if array[i] > array[i+1]:
                #Swap Values if Unsorted
                array[i], array[i+1] = array[i+1], array[i]
                sorted = false
            i += 1
    """, """
let sorted = false;
while (!sorted) {
    let i = 0;
    sorted = true;
    while (i < array.length-1) {
        if (array[i] > array[i+1]) {
            const temp = array[i];
            array[i] = array[i+1];
            array[i+1] = temp;
            sorted = false;
        };
        i ++;
    };
};
"""]
    @IBOutlet weak var implementationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func languageChangerPressed(_ sender: UISegmentedControl) {
        let language = sender.titleForSegment(at: sender.selectedSegmentIndex)
        if language == "Python" {
            implementationLabel.text = implementationText[0]
        } else if language == "Javascript" {
            implementationLabel.text = implementationText[1]
        }
    }
}
