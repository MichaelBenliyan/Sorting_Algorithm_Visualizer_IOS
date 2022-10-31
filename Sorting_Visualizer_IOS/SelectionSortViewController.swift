//
//  SelectionSortViewController.swift
//  Sorting_Visualizer_IOS
//
//  Created by Michael Benliyan on 10/31/22.
//

import UIKit
class SelectionSortViewController: UIViewController {
    let implementationText: [String] = ["""
    for i in range(len(array)):
        #Find the smallest element in remaining unsorted array
        min_idx = i
        sorted = true
        for j in range(i+1, len(array)):
            if array[j] < array[mid_idx]:
                min_idx = j
            #Swap new minimum element with first element
            array[i], array[min_idx] = array[mid_idx], array[i]
    """, """
var i, j, min_idx;
for (i = 0; i < array.length-1; i++) {
    min_idx = i;
    #Find the smallest element in remaining unsorted array
    for (j = i+1; j < array.length; j++){
        if (array[j] < array[min_idx]) {
            min_idx = j;
        };
        #Swap new minimum element with first element
        const temp = arr[j];
        arr[j] = arr[mid_idx];
        arr[mid_idx] = temp;
    };
};
""", """
int n = array.length;
    // One by one move boundary of unsorted subarray
        for (int i = 0; i < n-1; i++)
        {
            // Find the minimum element in unsorted array
            int min_idx = i;
            for (int j = i+1; j < n; j++)
                if (array[j] < array[min_idx])
                    min_idx = j;
 
            // Swap the found minimum element with the first element
            int temp = array[min_idx];
            array[min_idx] = array[i];
            array[i] = temp;
        }
""", """
int i, j, min_idx;
int n = sizeof(array)/sizeof(array[0]);
    // One by one move boundary of unsorted subarray
    for (i = 0; i < n-1; i++)
    {
        // Find the minimum element in unsorted array
        min_idx = i;
        for (j = i+1; j < n; j++)
        if (array[j] < array[min_idx])
            min_idx = j;
 
        // Swap the minimum element with the first element
        if(min_idx!=i)
            int temp = array[i];
            array[i] = array[min_idx];
            array[min_idx] = temp;
    }
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
