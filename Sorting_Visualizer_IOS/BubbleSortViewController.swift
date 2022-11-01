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
            //Swap Values if Unsorted
            const temp = array[i];
            array[i] = array[i+1];
            array[i+1] = temp;
            sorted = false;
        };
        i ++;
    };
};
""", """
int n = array.length;
for (int i = 0; i < n - 1; i++)
    for (int j = 0; j < n - i - 1; j++)
        if (array[j] > array[j + 1]) {
            //Swap Values if Unsorted
            int temp = array[j];
            array[j] = array[j + 1];
            array[j + 1] = temp;
        }
""", """
int i, j;
int n = sizeof(array) / sizeof(array[0]);
    for (i = 0; i < n - 1; i++)
        for (j = 0; j < n - i - 1; j++)
            if (array[j] > array[j + 1])
                //Swap Values if Unsorted
                int temp = array[j];
                array[j] = array[j+1];
                array[j+1] = temp;
"""]
    @IBOutlet weak var implementationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        implementationLabel.text = implementationText[0]
    }
    
    @IBAction func languageChangerPressed(_ sender: UISegmentedControl) {
        let language = sender.titleForSegment(at: sender.selectedSegmentIndex)
        if language == "Python" {
            implementationLabel.text = implementationText[0]
        } else if language == "Javascript" {
            implementationLabel.text = implementationText[1]
        } else if language == "Java" {
            implementationLabel.text = implementationText[2]
        } else if language == "C++" {
            implementationLabel.text = implementationText[3]
        }
    }
}
