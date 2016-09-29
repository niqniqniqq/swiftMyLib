//Foundationが使えない環境での文字列分割拡張
extension String {
    func componentsSeparatedByStringWithoutFoundation(separateStr: String) -> [String] {
        var stack = [Character]()
        var returnArray = [String]()
        
        self.characters.generate().forEach { (c : Character) in
            stack.append(c)

            if String(stack).hasSuffix(separateStr){
                //stackした文字列接尾が分割文字列と一致
                let count = stack.count - separateStr.characters.count
                var workArray = [Character]()
                for i in 0..<count {
                    workArray.append(stack[i])
                }
                if 0 != workArray.count {
                    returnArray.append(String(workArray))
                }
                //stack解放
                stack.removeAll()
                workArray.removeAll()
            }
        }
        
        if 0 != stack.count{
            returnArray.append(String(stack))
        }
        
        return returnArray
    }
}

//Foundationが使えない環境での文字列切取(先頭からの取得範囲を指定)拡張
extension String {
    func substringToIndexWithoutFoundation(index: Int) -> String {
        var addCnt : Int = 0
        var stack = [Character]()
        
        self.characters.generate().forEach { (c : Character) in
            if addCnt < index {
                stack.append(c)
                addCnt += 1
            }
        }
        
        return String(stack)
    }
}

