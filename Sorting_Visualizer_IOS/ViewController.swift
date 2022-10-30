//
//  ViewController.swift
//  Sorting_Visualizer_IOS
//
//  Created by Michael Benliyan on 10/19/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var bar13: UIProgressView!
    @IBOutlet weak var bar12: UIProgressView!
    @IBOutlet weak var bar11: UIProgressView!
    @IBOutlet weak var bar10: UIProgressView!
    @IBOutlet weak var bar9: UIProgressView!
    @IBOutlet weak var bar8: UIProgressView!
    @IBOutlet weak var bar7: UIProgressView!
    @IBOutlet weak var bar6: UIProgressView!
    @IBOutlet weak var bar5: UIProgressView!
    @IBOutlet weak var bar4: UIProgressView!
    @IBOutlet weak var bar3: UIProgressView!
    @IBOutlet weak var bar2: UIProgressView!
    @IBOutlet weak var bar1: UIProgressView!
    var bars: [UIProgressView] = []
    var barValues : [Float] = []
    var maxVal = 10
//************************************************************
    // View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bars = [bar1, bar2, bar3, bar4, bar5, bar6, bar7, bar8, bar9, bar10, bar11, bar12, bar13]
        for bar in bars {
            bar.transform = bar.transform.scaledBy(x: 1, y: 5)
        }
        fillBarValues()
        updateBars()
        print(barValues)
    }

//************************************************************
    // Handle Buttons
    
    @IBAction func bubbleSortPressed(_ sender: UIButton) {
        titleText.text = "Bubble Sort"
        bubbleSort()
    }
    
    @IBAction func selectionSortPressed(_ sender: UIButton) {
        titleText.text = "Selection Sort"
        selectionSort()
    }
    
    @IBAction func heapSortPressed(_ sender: UIButton) {
        titleText.text = "Heap Sort"
        heapSort()
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        titleText.text = "Sorting Visualizer"
        fillBarValues()
        updateBars()
        resetBarColor()
        
    }
    
//************************************************************
    // Helper Functions
    
    func fillBarValues() {
        barValues = []
        var i = 0
        while i < 13 {
            barValues.append(Float(Int.random(in: 1..<maxVal+1)))
            i+=1
        }
    }
    func resetBarColor() {
        var i = 0
        while i < bars.count {
            let bar = bars[i]
            bar.progressTintColor = #colorLiteral(red: 0.2176662683, green: 0.6719350815, blue: 0.8235954642, alpha: 1)
            i += 1
        }
    }
    func updateBars() {
        var i = 0
        while i < bars.count {
            let bar = bars[i]
            let barValue = barValues[i]
            bar.progress = barValue/Float(maxVal)
            i += 1
        }
    }
    
//************************************************************
    // Sorting Algos
    
    func bubbleSort(i: Int = 0 ,sorted: Bool = true, completed: Int = 12) {
        print(completed)
        var isSorted = sorted
        if i < barValues.count-1 {
            bars[i+1].progressTintColor = #colorLiteral(red: 0.02275720797, green: 0.6887814999, blue: 0.4195303023, alpha: 1)
            let left = barValues[i]
            let right = barValues[i+1]
            if left > right {
                isSorted = false
                let temp = left
                barValues[i] = right
                barValues[i+1] = temp
                self.updateBars()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.18) {
            if (i+1) > completed {
                self.bars[i+1].progressTintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            } else {
                self.bars[i+1].progressTintColor = #colorLiteral(red: 0.2176662683, green: 0.6719350815, blue: 0.8235954642, alpha: 1)
            }
            
            if i < self.barValues.count-2 {
                self.bubbleSort(i: i+1, sorted: isSorted, completed: completed)
            } else {
                if isSorted {
                    for bar in self.bars {
                        bar.progressTintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
                    }
                    return
                } else {
                    self.bars[completed].progressTintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
                    self.bubbleSort(completed:completed-1)
                }
            }
        }
    }
    
    func selectionSort(i: Int = 0, minIndex: Int = 0, startPos: Int = 0) {
        var minIndex = minIndex
        var startPos = startPos
        if i < barValues.count {
            bars[i].progressTintColor = #colorLiteral(red: 0.02275720797, green: 0.6887814999, blue: 0.4195303023, alpha: 1)
        }
        bars[minIndex].progressTintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        bars[startPos].progressTintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.5399161838)
        if startPos < barValues.count-1 {
            if i == barValues.count {
                // SWAP
                let temp = barValues[startPos]
                barValues[startPos] = barValues[minIndex]
                barValues[minIndex] = temp
                bars[minIndex].progressTintColor = #colorLiteral(red: 0.2176662683, green: 0.6719350815, blue: 0.8235954642, alpha: 1)
                bars[startPos].progressTintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
                startPos += 1
                bars[startPos].progressTintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.5399161838)
                minIndex = startPos
                updateBars()
                
            } else if barValues[i] < barValues[minIndex] {
                // CHANGE MIN LOCATION
                if bars[minIndex].progressTintColor != #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.5399161838) {
                    bars[minIndex].progressTintColor = #colorLiteral(red: 0.2176662683, green: 0.6719350815, blue: 0.8235954642, alpha: 1)
                }
                minIndex = i
                bars[minIndex].progressTintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            if startPos == self.barValues.count-1 {
                self.bars[startPos].progressTintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
                return
            } else if i < self.barValues.count {
                // Keep going till end of list
                self.bars[i].progressTintColor = #colorLiteral(red: 0.2176662683, green: 0.6719350815, blue: 0.8235954642, alpha: 1)
                self.selectionSort(i: i+1, minIndex: minIndex, startPos: startPos)
            } else {
                // Restart list with Start Pos + 1
                self.bars[startPos-1].progressTintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
                self.selectionSort(i:startPos+1, minIndex: startPos, startPos: startPos)
            }
        }
        print(barValues)
    }
    
    //Solution 1, Iteration, Time O(nlogn), Space O(1)
    func heapSort(isHeap: Bool = false, f: Int? = nil, j: Int? = nil, k: Int? = nil, top: Float? = nil, sent: Bool = false) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            var finishedRound: Bool = false
            let n = self.barValues.count;
            var j = j
            var f = f
            var top = top
            var k = k
            if j == nil {
                j = n/2-1
            }
            
            let isHeap = isHeap
            if !isHeap && j! >= 0 {
                print(j!)
                if k == nil {
                    k = j
                    top = self.barValues[k!]
                }
                //heapify for each j
                //_______________________________________________
                var larger: Int
                if k! < n/2 { // from top down, swap with larger child
                    let left = 2*k! + 1
                    let right = 2*k! + 2
                    if (right < n && self.self.barValues[right] > self.barValues[left]) {
                        larger = right
                    } else {
                        larger = left
                    }
                    if (top! >= self.barValues[larger]) {
                        self.barValues[k!] = top!;
                        finishedRound = true
                    } else {
                        self.barValues[k!] = self.barValues[larger];
                        k = larger;
                        if k! < n/2 {
                            self.heapSort(isHeap: isHeap, j: j, k: k, top: top)
                        }
                    }
                }
                if k! >= n/2 {
                    self.barValues[k!] = top!;
                    finishedRound = true
                }
                //_______________________________________________
                //            heapify(size: n, i: j);
//                if sent == false && j! <= 0 {
//                    isHeap = true
//                    j! -= 1
//                    self.updateBars()
//                    self.heapSort(isHeap: true, f: 0, sent: true)
//                }
                if finishedRound && j! > 0 {
                    j! -= 1
                    self.updateBars()
                    self.heapSort(isHeap: false, j: j, k: nil)
                } else if finishedRound && j! == 0 {
                    self.bars[0].progressTintColor = #colorLiteral(red: 0.02275720797, green: 0.6887814999, blue: 0.4195303023, alpha: 1)
                    self.updateBars()
                    self.heapSort(isHeap: true, f: 0)
                }
            }
            //sort by remove the largest and put at the end
            if isHeap && f != nil && f! < n {
                print("f: \(f!)")
                let size = n-f!-1 //new size after remove last
                self.barValues[size] = self.heapRemove(size: size, i: f!)//put the largest at the end
                self.bars[size].progressTintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
                if size >= 1 {
                    self.bars[size-1].progressTintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                }
                self.updateBars()
                if f! < n {
                    f! += 1
                    self.heapSort(isHeap: isHeap, f: f)
                } else {
                    self.updateBars()
                }
            }
            
//            if isHeap && i != nil && i! >= n {
//                return
//            }
        }
    }
    
    //Remove the root from heap and heapify again, Time O(logn), Space O(1)
    func heapRemove(size: Int,  i: Int) -> Float {
        let max = barValues[0];
        barValues[0] = barValues[size]; //put last at front
        heapify(size: size, i: 0);
        return max;
    }
    //Max heapify, Time O(logn), space O(1)
    func heapify(size: Int, i: Int) {
        let top = barValues[i]
        var larger: Int
        var i = i
        
        while i < size/2 { // from top down, swap with larger child
            let left = 2*i + 1
            let right = 2*i + 2
            if (right < size && barValues[right] > barValues[left]) {
                larger = right
            } else {
                larger = left
            }
            if (top >= barValues[larger]) {
                break
            }
            barValues[i] = barValues[larger];
            i = larger;
        }
        barValues[i] = top;
    }
    
}

