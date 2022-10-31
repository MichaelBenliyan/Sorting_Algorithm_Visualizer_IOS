//
//  HeapSortViewController.swift
//  Sorting_Visualizer_IOS
//
//  Created by Michael Benliyan on 10/31/22.
//

import UIKit
class HeapSortViewController: UIViewController {
    let implementationText: [String] = ["""
    def heapSort(arrary):
        n = len(arr)
     
        # Build Maxheap.
        for i in range(n//2 - 1, -1, -1):
            heapify(array, n, i)
     
        # Get top element and place at end
        for i in range(N-1, 0, -1):
            #Swap
            array[i], array[0] = array[0], array[i]
            heapify(array, i, 0)
    
    def heapify(array, n, i):
        largest = i
        #Left Child = 2*i + 1
        #Right Child = 2*i + 2
        left = 2 * i + 1
        right = 2 * i + 2
     
        # Check Left Child against root
        if left < n and array[largest] < arr[left]:
            largest = left
     
        # Check Right Child against root
        if right < n and array[largest] < array[right]:
            largest = right
     
        # Swap if needed
        if largest != i:
            array[i], array[largest] = array[largest], array[i]
     
            # Heapify again.
            heapify(array, n, largest)
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
