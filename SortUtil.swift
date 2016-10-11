class SortUtil{
    
    static func bobleSort(inout intArray : [Int], length: Int){
        if 1 >= length{
            return
        }
        
        for i in 0...(length - 1) {
            if intArray[i] > intArray[i + 1] {
                let tmp = intArray[i + 1]
                intArray[i + 1] = intArray[i]
                intArray[i] = tmp
            }
        }
        
        self.bobleSort(&intArray, length: length - 1)
    }
    
    static func quickSortAsc(inout intArray : [Int], start : Int, end : Int){
        if start >= end {
            return
        }
        
        //ピボット設定
        let mid = Int((start + end) / 2)
        let pivot = intArray[mid]
        //両端の位置を設定
        var left = start
        var right = end
        while (left <= right){
            while (pivot > intArray[left]){
                left += 1
            }
            while (pivot < intArray[right]){
                right -= 1
            }
            //要素交換
            if (left <= right){
                let tmp = intArray[left]
                intArray[left] = intArray[right]
                intArray[right] = tmp
                //次の要素の試行
                left += 1
                right -= 1
            }
        }
        //分割部毎にソート
        self.quickSortAsc(&intArray, start: start, end: right)
        self.quickSortAsc(&intArray, start: left, end: end)
    }
}

//var testArray : [Int] = [3,12,8,5,2,13,4,9,15,1,10,0,11,6,7,14,1,30,0,6]
//SortUtil.bobleSort(&testArray, length: (testArray.count - 1))
//SortUtil.quickSortAsc(&testArray, start: 0, end: (testArray.count - 1))
//print(testArray)

