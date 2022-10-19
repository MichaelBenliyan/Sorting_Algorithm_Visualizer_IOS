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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
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
    
}

