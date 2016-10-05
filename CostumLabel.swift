class CostumLabel: UILabel {
    
    var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    //padding設定 
    func setPadding(top : CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat){
        padding.top = top
        padding.left = left
        padding.right = right
        padding.bottom = bottom
    }
    
    func setPaddingByUIEdgeInsets(padding : UIEdgeInsets){
        self.padding = padding
    }
    
    override func drawTextInRect(rect: CGRect) {
        let newRect = UIEdgeInsetsInsetRect(rect, padding)
        super.drawTextInRect(newRect)
    }
    
    override func intrinsicContentSize() -> CGSize {
        var intrinsicContentSize = super.intrinsicContentSize()
        intrinsicContentSize.height += padding.top + padding.bottom
        intrinsicContentSize.width += padding.left + padding.right
        return intrinsicContentSize
    }
}
