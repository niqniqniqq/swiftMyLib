class CostumLabel: UILabel {
    
    var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    init(frame: CGRect, top : CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        padding.top = top
        padding.left = left
        padding.right = right
        padding.bottom = bottom
        super.init(frame: frame)
    }
    
    init(frame: CGRect, padding : UIEdgeInsets) {
        self.padding = padding
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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

