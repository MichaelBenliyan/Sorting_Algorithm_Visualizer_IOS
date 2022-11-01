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
     
        # Build Max Heap.
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
     
            # Heapify again
            heapify(array, n, largest)
    """, """
function heapSort(array) {
    let n = array.length;
     
    // Build Max Heap
    for (var i = Math.floor(n / 2) - 1; i >= 0; i--)
        heapify(array, n, i);

    // Get top element and place at end
    for (var i = n - 1; i > 0; i--) {
        var temp = array[0];
        array[0] = array[i];
        array[i] = temp;

        heapify(array, i, 0);
    }
}

function heapify(array, n, i) {
    var largest = i;
    //Left Child = 2*i + 1
    //Right Child = 2*i + 2
    let left = 2 * i + 1;
    let right = 2 * i + 2;

    //Check Left Child against root
    if (left < N && array[left] > array[largest])
        largest = left;

    //Check Right Child against root
    if (right < n && array[right] > array[largest])
        largest = right;

    //Swap if needed
    if (largest != i) {
        let swap = array[i];
        array[i] = array[largest];
        array[largest] = swap;

        // Heapify again
        heapify(array, n, largest);
    }
}
""", """
void heapSort(int array[])
{
    int n = array.length;
    //Build Max Heap
    for (int i = n / 2 - 1; i >= 0; i--)
        heapify(array, n, i);

    //Get top element and place at end
    for (int i = n - 1; i > 0; i--) {
        int temp = array[0];
        array[0] = array[i];
        array[i] = temp;

        heapify(array, i, 0);
    }
}
void heapify(int arr[], int N, int i)
{
    int largest = i;
    //Left Child = 2*i + 1
    //Right Child = 2*i + 2
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    //Check Left Child against root
    if (left < n && array[left] > array[largest])
        largest = left;

    //Check Right Child against root
    if (right < n && array[right] > array[largest])
        largest = right;

    //Swap if needed
    if (largest != i) {
        int swap = array[i];
        array[i] = array[largest];
        array[largest] = swap;

        //Heapify again
        heapify(array, n, largest);
    }
}
""", """
void heapSort(int array[], int n)
{
    // Build Max Heap
    for (int i = n / 2 - 1; i >= 0; i--)
        heapify(array, n, i);
 
    //Get top element and place at end
    for (int i = n - 1; i > 0; i--) {
        int temp = array[0];
        array[0] = array[i];
        array[i] = temp;
 
        heapify(array, i, 0);
    }
}

void heapify(int array[], int n, int i)
{
    int largest = i;
    //Left Child = 2*i + 1
    //Right Child = 2*i + 2
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    //Check Left Child against root
    if (left < n && array[left] > array[largest])
        largest = left;
 
    //Check Right Child against root
    if (right < n && array[right] > array[largest])
        largest = right;
 
    //Swap if needed
    if (largest != i) {
        int swap = array[i];
        array[i] = array[largest];
        array[largest] = swap;
 
        //Heapify again
        heapify(array, n, largest);
    }
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
