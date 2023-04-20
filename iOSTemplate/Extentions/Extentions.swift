//
//  Extentions.swift
//  iOSTemplate
//
//  Created by S N Shekhar  Das on 20/4/23.
//

import Foundation
import UIKit

//===========================================================
//MARK: - String  Extension
//===========================================================
extension String {
    var isValidEmail: Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    func height(constraintedWidth width: CGFloat, font: UIFont,text:String) -> CGFloat {
        let label           =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text          = text
        label.font          = font
        label.sizeToFit()
        return label.frame.height
    }
    
    func heightForHtmlString(font:UIFont, width:CGFloat) -> CGFloat{
        let string           = NSMutableAttributedString(string:self )
        let label:UILabel    = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines  = 0
        label.lineBreakMode  = NSLineBreakMode.byWordWrapping
        label.font           = font
        label.attributedText = string as NSAttributedString
        label.sizeToFit()
        return label.frame.height
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
           let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
           return ceil(boundingBox.width)
       }
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "yes","Y", "1":return true
        case "False", "false", "no","N", "0":return false
        default:return nil
        }
    }
    
    
    var underLined: NSAttributedString {
        NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    
    func grouping(every groupSize: String.IndexDistance, with separator: Character) -> String {
       let cleanedUpCopy = replacingOccurrences(of: String(separator), with: "")
       return String(cleanedUpCopy.enumerated().map() {
            $0.offset % groupSize == 0 ? [separator, $0.element] : [$0.element]
       }.joined().dropFirst())
    }
    
    
    
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension String {
    public func toPhoneNumber() -> String {
        return self.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: nil)
    }
}

extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: textString.count))
            self.attributedText = attributedString
        }
    }
}
//===========================================================
//MARK: - UIView Extension
//===========================================================
extension UIView {
    
    var  window:UIWindow? {
        if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
              return window
         }
        return nil
    }
    
    
    
    func reload(tableView: UITableView) {
        UIView.performWithoutAnimation {
        let contentOffset = tableView.contentOffset
        tableView.reloadData()
        tableView.layoutIfNeeded()
        tableView.setContentOffset(contentOffset, animated: false)
        }
    }
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path        = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask        = CAShapeLayer()
        mask.path       = path.cgPath
        self.layer.mask  = mask
    }
    
    
    func roundCornersNew(_ corners: UIRectCorner, radius: CGFloat) {
      
        
        if #available(iOS 11, *) {
                    var cornerMask = CACornerMask()
                    if(corners.contains(.topLeft)){
                        cornerMask.insert(.layerMinXMinYCorner)
                    }
                    if(corners.contains(.topRight)){
                        cornerMask.insert(.layerMaxXMinYCorner)
                    }
                    if(corners.contains(.bottomLeft)){
                        cornerMask.insert(.layerMinXMaxYCorner)
                    }
                    if(corners.contains(.bottomRight)){
                        cornerMask.insert(.layerMaxXMaxYCorner)
                    }
            
            if(corners.contains(.allCorners)){
                cornerMask.insert(.layerMinXMinYCorner)
                cornerMask.insert(.layerMaxXMinYCorner)
                cornerMask.insert(.layerMinXMaxYCorner)
                cornerMask.insert(.layerMaxXMaxYCorner)
            }
            
            
                    self.layer.cornerRadius = radius
                    self.layer.maskedCorners = cornerMask

                } else {
                    let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
                    let mask = CAShapeLayer()
                    mask.path = path.cgPath
                    self.layer.mask = mask
                }
        
    }
    
 
    
    
    
    func fadeIn() {
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .transitionFlipFromTop, animations: {
            self.alpha = 1.0 // Instead of a specific instance of, say, birdTypeLabel, we simply set [thisInstance] (ie, self)'s alpha
        }, completion: nil)
    }
    
    func fadeOut() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .transitionFlipFromBottom, animations: {
            self.alpha = 0.0
        }, completion: nil)
    }
    
    
    func updateLayerProperties(with:UIColor) {
        self.layer.shadowColor   = with.cgColor
        self.layer.shadowOffset  = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius  = 10.0
        self.layer.masksToBounds = false
    }
    
    func cornerRadius(_ radius:CGFloat) -> Void {
        self.layer.cornerRadius  = radius
        self.layer.masksToBounds = true
    }
    
    func border(width:CGFloat, color:UIColor){
        self.layer.borderWidth   = width
        self.layer.borderColor   = color.cgColor
        self.layer.masksToBounds = true
    }
    

    
    
    // shapeLayer.lineDashPattern = [6,3]
    func shadows(_ color:UIColor, cornerRadius:CGFloat) -> Void {
        self.layer.masksToBounds = false
        self.layer.shadowColor   = color.cgColor
        self.layer.shadowOffset  = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius  = 4.0
        self.layer.cornerRadius  = cornerRadius
    }
    
    func shadowWithBular(shadowColor:UIColor, cornerRadius:CGFloat){
        self.layer.cornerRadius  = 5
        self.layer.borderWidth   = 1.0
        self.layer.borderColor   = shadowColor.cgColor
        self.layer.shadowColor   = shadowColor.cgColor
        self.layer.shadowOffset  = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius  = 5.0
    }
    
    func dropShadow(shadowColor:UIColor, shadowRadius:Float){
        self.backgroundColor     = UIColor.white
        self.layer.shadowColor   = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset  = CGSize(width: 0.0, height: 4)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius  = 4.0
    }
    
    
    func showAlertMsg(msg: String){
        let alertView = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            window.rootViewController?.present(alertView, animated: true, completion: nil)
        }
    }
}


enum VerticalLocation: String {
    case bottom
    case top
}

extension UIView {
    func addShadowOnSide(location: VerticalLocation, color: UIColor = .black, opacity: Float = 1.0, radius: CGFloat = 7.0) {
        switch location {
        case .bottom:
             addShadowNew(offset: CGSize(width: 0, height: 10), color: color, opacity: opacity, radius: radius)
        case .top:
            addShadowNew(offset: CGSize(width: 0, height: -2), color: color, opacity: opacity, radius: radius)
        }
    }

    func addShadowNew(offset: CGSize, color: UIColor = .gray, opacity: Float = 0.3, radius: CGFloat = 5.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}

extension Int {
    static func parse(from string: String) -> Int? {
        return Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
    }
}


extension String {
    func subString(from: Int, to: Int) -> String {
       let startIndex = self.index(self.startIndex, offsetBy: from)
       let endIndex = self.index(self.startIndex, offsetBy: to)
       return String(self[startIndex..<endIndex])
    }
}



extension UIButton {
    func setImageFrom(_ url: URL) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.imageView?.contentMode = .scaleAspectFit
                            self?.setImage(image, for: .normal)
                        }
                    }
                }
            }
        }
}

extension UIButton {
    func loadingIndicator(_ show: Bool) {
        let tag = 808404
        if show {
            self.isEnabled = false
            self.alpha = 0.5
            let indicator = UIActivityIndicatorView()
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
            indicator.tag = tag
            self.addSubview(indicator)
            indicator.startAnimating()
        } else {
            self.isEnabled = true
            self.alpha = 1.0
            if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
}


//===========================================================
//MARK: - UIFont Extension
//===========================================================
extension UIFont {
    static func ptSansBold(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "PTSans-Bold", size: size)!
    }
    
    static func ptSansRegular(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "PTSans-Regular", size: size)!
    }
}
class UISwitchCustom: UISwitch {
    @IBInspectable var OffTint: UIColor? {
        didSet {
            self.tintColor          = OffTint
            self.layer.cornerRadius = 16
            self.backgroundColor    = OffTint
        }
    }
}
//import FirebaseAnalytics
//import StripeCore
//===========================================================
//MARK: - UIView Controller Extention
//===========================================================
extension UIViewController {
    
    var hasNotch: Bool {
           
     let bottom = UIApplication.shared.windows.first{ $0.isKeyWindow }?.safeAreaInsets.bottom ?? 0
     return bottom > 0
               
        }
    
    
    
    var sceneDelegate: SceneDelegate? {
           guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let delegate = windowScene.delegate as? SceneDelegate else { return nil }
            return delegate
    }
    
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!;
    }
    func addChildVC(content: UIViewController) {
        addChild(content)
        self.view.addSubview(content.view)
        content.didMove(toParent: self)
    }
    func removeChildVC(content: UIViewController) {
        content.willMove(toParent: nil)
        content.view.removeFromSuperview()
        content.removeFromParent()
    }
    
    func showAlertMsg(msg:String) {
        let alert = UIAlertController(title: "", message: msg, preferredStyle:.alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }

    var  window:UIWindow? {
        if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
              return window
         }
        return nil
    }
    
  /*   func logAnalytics(_ screenName:String){
        Analytics.logEvent(AnalyticsEventScreenView, parameters: [AnalyticsParameterScreenName: screenName,AnalyticsParameterScreenClass:className])
    }
    */
}

//***********************************************//
// MARK: PHAsset Extension
//***********************************************//
import Photos
import PhotosUI
extension PHAsset {
func getImage() -> UIImage {
    let manager = PHImageManager.default()
    let option = PHImageRequestOptions()
    var thumbnail = UIImage()
    option.isSynchronous = true
    manager.requestImage(for: self,
                         targetSize: CGSize(width: self.pixelWidth, height: self.pixelHeight),
                         contentMode: .aspectFit,
                         options: option,
                         resultHandler: {(result, info) -> Void in
                            if let img = result {
                                thumbnail = img
                            }
                         })
    return thumbnail
    }
    
    func smallThumb() -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        option.resizeMode = .fast
        manager.requestImage(for: self,
                             targetSize: CGSize(width: 100.0, height: 100.0),
                             contentMode: .aspectFill,
                             options: option,
                             resultHandler: {(result, info) -> Void in
                                if let img = result {
                                    thumbnail = img
                                }
                                
                             })
        return thumbnail
        }
    
    
    
    func getURL(completionHandler : @escaping ((_ responseURL : URL?) -> Void)){
        if self.mediaType == .image {
            let options: PHContentEditingInputRequestOptions = PHContentEditingInputRequestOptions()
            options.canHandleAdjustmentData = {(adjustmeta: PHAdjustmentData) -> Bool in
                return true
            }
            self.requestContentEditingInput(with: options, completionHandler: {(contentEditingInput: PHContentEditingInput?, info: [AnyHashable : Any]) -> Void in
                completionHandler(contentEditingInput!.fullSizeImageURL as URL?)
            })
        }
        if self.mediaType == .video {
            let options: PHVideoRequestOptions = PHVideoRequestOptions()
            options.version = .original
            PHImageManager.default().requestAVAsset(forVideo: self, options: options, resultHandler: {(asset: AVAsset?, audioMix: AVAudioMix?, info: [AnyHashable : Any]?) -> Void in
                if let urlAsset = asset as? AVURLAsset {
                    let localVideoUrl: URL = urlAsset.url as URL
                    completionHandler(localVideoUrl)
                } else {
                    completionHandler(nil)
                }
            })
        }
    }
    
}





extension ISO8601DateFormatter {
    func convertDate(_ date: Date) -> String{
        self.formatOptions = [.withFullDate]
        let converted      = self.string(from: date)
        return converted
    }
}
extension UIImageView {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
        layer.add(pulse,forKey: nil)
    }
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        layer.add(flash, forKey: nil)}
}

extension UIImageView{
 var imageWithFade:UIImage?{
        get{
            return self.image
        }
        set{
            UIView.transition(with: self,
                              duration: 0.5, options: .transitionCrossDissolve, animations: {
                                self.image = newValue
            }, completion: nil)
        }
    }
}


extension UIImageView {
    public func imageFromURL(urlString: URL) {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        activityIndicator.startAnimating()
        if self.image == nil{
            self.addSubview(activityIndicator)
        }
        
        URLSession.shared.dataTask(with: urlString, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                activityIndicator.removeFromSuperview()
                self.image = image
            })
            
        }).resume()
    }
    
    func setImageColor(color: UIColor) {
      let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
      self.image = templateImage
      self.tintColor = color
    }
    
    
    func makeBlur()
    {
        let blurEffect                  = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView              = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame            = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
        layer.add(pulse,forKey: nil)
    }
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        layer.add(flash, forKey: nil)}
}
    
extension UIViewController {
        func setTitle(_ title: String) {
            let titleLbl             = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            titleLbl.text            = title
            titleLbl.textColor       = UIColor.white
            titleLbl.textAlignment   = .left
            titleLbl.font            = UIFont.systemFont(ofSize: 20.0, weight: .bold)
            navigationItem.titleView = titleLbl
        }
    
    
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
    
    
    
    
    }

class customBtn:UIButton{
   var  actionId = 0
    var indexPath:IndexPath? = nil
}
private var kAssociationKeyMaxLength: Int = 0

extension UITextField {
@IBInspectable var maxLength: Int {
        get {
            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int { return length } else { return Int.max }
        }set {
            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
        }
    }
    
    @objc func checkMaxLength(textField: UITextField) {
        guard let prospectiveText = self.text,
            prospectiveText.count > maxLength
            else { return }
        let selection      = selectedTextRange
        let indexEndOfText = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        let substring      = prospectiveText[..<indexEndOfText]
        text               = String(substring)
        selectedTextRange  = selection
    }
    
    
    public func setText(to newText: String, preservingCursor: Bool) {
        if preservingCursor {
            let cursorPosition = offset(from: beginningOfDocument, to: selectedTextRange!.start) + newText.count - (text?.count ?? 0)
            text = newText
            if let newPosition = self.position(from: beginningOfDocument, offset: cursorPosition) {
                selectedTextRange = textRange(from: newPosition, to: newPosition)
            }
        }
        else {
            text = newText
        }
    }
    
    
    
}


 extension UITextField {
    
    
    func placeholderColor(color: UIColor) {
        let attributeString = [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font: self.font!
        ] as [NSAttributedString.Key : Any]
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: attributeString)
    }
    
}




extension String {
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
}

extension UIView {
    func showView(completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func hideView(completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }) { (completed) in
            self.isHidden = true
            completion(true)
        }
    }
}

extension UIView {
    func commonDesingnView(){
        self.layer.cornerRadius  = 2
        self.layer.shadowColor   = UIColor.black.cgColor
        self.layer.shadowOffset  = CGSize(width : 0.5, height : 0.4)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius  = 5.0
        self.layer.masksToBounds = false
    }
    
    func cardView(){
        self.layer.cornerRadius  = 2
        self.layer.shadowColor   = UIColor.black.cgColor
        self.layer.shadowOffset  = CGSize(width : 0.3, height : 0.2)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius  = 2.0
        self.layer.masksToBounds = false
    }
    
    func cardViewWithCircle(){
        self.layer.cornerRadius  = self.frame.size.height/2
        self.layer.shadowColor   = UIColor.black.cgColor
        self.layer.shadowOffset  = CGSize(width : 0.3, height : 0.2)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius  = 2.0
        self.layer.masksToBounds = false
    }
    
    func cardViewWithCornerRadius(_ radius:CGFloat){
           self.layer.cornerRadius  = radius
           self.layer.shadowColor   = UIColor.gray.cgColor
           self.layer.shadowOffset  = CGSize(width : 0.3, height : 0.2)
           self.layer.shadowOpacity = 0.3
           self.layer.shadowRadius  = 1.0
        //self.layer.shadowRadius  = 2.0
           self.layer.masksToBounds = false
       }
    
    
    func setUpView(bWidth: CGFloat,bColor:UIColor,rCorner:CGFloat){
        self.layer.cornerRadius = rCorner
        self.clipsToBounds      = true
        self.layer.borderColor  = bColor.cgColor
        self.layer.borderWidth  = bWidth
    }
}



extension UIView {
    
    // Example use: myView.addBorder(toSide: .Left, withColor: UIColor.redColor().CGColor, andThickness: 1.0)
    
    enum ViewSide {
        case Left, Right, Top, Bottom
    }
    
    func addBorderBySide(toSide side: ViewSide, withColor color: UIColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color.cgColor
        
        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }
        
        layer.addSublayer(border)
    }
}







extension UIView {
    func addBorder(_ edge: UIRectEdge, color: UIColor, thickness: CGFloat,roundCorner:UIRectCorner,radius:CGFloat) {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.backgroundColor = color
        //subview.cornerRadius(thickness/2)
       // subview.roundCorners(roundCorner, radius:2)
        self.addSubview(subview)
        switch edge {
        case .top, .bottom:
            subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
            subview.heightAnchor.constraint(equalToConstant: thickness).isActive = true
            subview.roundCorners(.topLeft, radius: 8)
            if edge == .top {
                subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            } else {
                subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            }
        case .left, .right:
            subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            subview.widthAnchor.constraint(equalToConstant: thickness).isActive = true
            if edge == .left {
                subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            } else {
                subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
            }
        default:
            break
        }
    }
}




extension UIColor {
    
    static func tabColor()->UIColor {
        return hexToColor(hexStr: "#372372")
     }
    
    
   static func themeColor()->UIColor {
       return hexToColor(hexStr: "#0E0528")
    }
   
    static func placeHolderColor()->UIColor {
        return hexToColor(hexStr: "#C4C4C4")
    }
    
    
    static func blueGradientColor()->[UIColor] {
        return [hexToColor(hexStr: "#6011C6"),hexToColor(hexStr: "#6934FA")]
    }
    
    



    
    static func redGradientColor()->[UIColor] {
        return [hexToColor(hexStr: "#9942B7"),hexToColor(hexStr: "#FC354C")]
    }
    
   
 static   func hexToColor (hexStr:String) -> UIColor {
        var cString:String = hexStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    
}




extension UIImage {

    func scaledImage(withSize size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        return UIGraphicsGetImageFromCurrentImageContext()!
    }

    func scaleImageToFitSize(size: CGSize) -> UIImage {
        let aspect = self.size.width / self.size.height
        if size.width / aspect <= size.height {
            return scaledImage(withSize: CGSize(width: size.width, height: size.width / aspect))
        } else {
            return scaledImage(withSize: CGSize(width: size.height * aspect, height: size.height))
        }
    }
    
    
    func resized(withPercentage percentage: CGFloat, isOpaque: Bool = true) -> UIImage? {
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
    
    
    func compress(to kb: Int, allowedMargin: CGFloat = 0.2) -> Data {
        guard kb > 10 else { return Data() } // Prevents user from compressing below a limit (10kb in this case).
        let bytes = kb * 1024
        var compression: CGFloat = 1.0
        let step: CGFloat = 0.05
        var holderImage = self
        var complete = false
        while(!complete) {
            guard let data = holderImage.jpegData(compressionQuality: 1.0) else { break }
            let ratio = data.count / bytes
            if data.count < Int(CGFloat(bytes) * (1 + allowedMargin)) {
                complete = true
                return data
            } else {
                let multiplier:CGFloat = CGFloat((ratio / 5) + 1)
                compression -= (step * multiplier)
            }
            guard let newImage = holderImage.resized(withPercentage: compression) else { break }
            holderImage = newImage
        }
        
        return Data()
    }

}


extension UIImage {

    convenience init?(barcode: String) {
        let data = barcode.data(using: .ascii)
        guard let filter = CIFilter(name: "CICode128BarcodeGenerator") else {
            return nil
        }
        filter.setValue(data, forKey: "inputMessage")
        guard let ciImage = filter.outputImage else {
            return nil
        }
        self.init(ciImage: ciImage)
    }

}



extension UINavigationController {
    func configureNavigation(_ color:UIColor = UIColor.white){
        
        if #available(iOS 13, *) {
            self.navigationBar.standardAppearance.backgroundColor = UIColor.clear
            navigationBar.standardAppearance.backgroundEffect = nil
            navigationBar.standardAppearance.shadowImage = UIImage()
            navigationBar.standardAppearance.shadowColor = .clear
            navigationBar.standardAppearance.backgroundImage = UIImage()
        }
        
        return
        
//
//            self.isNavigationBarHidden             = false
//        self.navigationBar.isTranslucent = false
//           let navBarAppearance = UINavigationBarAppearance()
//
//
//
//
//            //navBarAppearance.configureWithTransparentBackground()
//            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.clear]
//            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.clear]
//            navBarAppearance.backgroundColor = color
//        navBarAppearance.shadowImage = UIImage()
//        navBarAppearance.shadowColor = .clear
//        // We can use a 1px image with the color we want for the shadow image
//
//
//
//            navigationBar.standardAppearance = navBarAppearance
//        navigationBar.compactAppearance = navBarAppearance
//            navigationBar.scrollEdgeAppearance = navBarAppearance
    }
 
    
    
    
    
    

    
}


extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    open override var childForStatusBarStyle: UIViewController? {
        return nil
    }
}



extension UIViewController {
    var topBarHeight: CGFloat {
        var top = self.navigationController?.navigationBar.frame.height ?? 0.0
        if #available(iOS 13.0, *) {
            top += UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            top += UIApplication.shared.statusBarFrame.height
        }
        return top
    }
    
    
    func showAlert(title:String,message:String){
        let alert  = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion:   nil)
    }
}

public extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}

extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}


extension UIImage {

    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage  = cgImage!
        let width      = size.width
        let height     = size.height
        let bounds     = CGRect(x: 0, y: 0, width: width, height: height)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context    = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }
    func withAlpha(_ alpha: CGFloat) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(at: .zero, blendMode: .normal, alpha: alpha)
        }
    }
}
extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}

extension NSObject {
    func classNameAsString(obj: Any)  {
        print(String(describing: type(of: obj)))
    }
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    
    init?(string: String) {

        guard let number = NumberFormatter().number(from: string) else {
            return nil
        }

        self.init(number.floatValue)
    }

    
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),green: .random(),blue:  .random(),alpha: 1.0)
    }
}



extension String {
    func calculateHeight(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
    
    
    func calculateWidth(height:CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height:height)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.width
    }
    
    
    
}


extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date)) years ago"   }
        if months(from: date)  > 0 { return "\(months(from: date)) months ago"  }
        if days(from: date)    > 0 { return "\(days(from: date)) days ago"    }
        if hours(from: date)   > 0 { return "\(hours(from: date)) hours ago"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date)) minutes Ago" }
        if seconds(from: date) > 0 { return "\(seconds(from: date)) seconds Ago" }
        return ""
    }
}


extension Date {
    var startOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 1, to: sunday)
    }

    var endOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 7, to: sunday)
    }
}


extension UIImage {
    func imageWithColor(color1: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color1.setFill()

        let context = UIGraphicsGetCurrentContext()! as CGContext
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0);
        context.setBlendMode(CGBlendMode.normal)

        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height) as CGRect
        context.clip(to: rect, mask: self.cgImage!)
        context.fill(rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()

        return newImage
    }
}



import AVKit

extension AVAsset {
    func generateThumbnail(completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            let imageGenerator = AVAssetImageGenerator(asset: self)
            let time = CMTime(seconds: 0.0, preferredTimescale: 600)
            let times = [NSValue(time: time)]
            imageGenerator.generateCGImagesAsynchronously(forTimes: times, completionHandler: { _, image, _, _, _ in
                if let image = image {
                    completion(UIImage(cgImage: image))
                } else {
                    completion(nil)
                }
            })
        }
    }
}

extension NSAttributedString {
    func withLineSpacing(_ spacing: CGFloat) -> NSAttributedString {


        let attributedString = NSMutableAttributedString(attributedString: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.lineSpacing = spacing
        attributedString.addAttribute(.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSRange(location: 0, length: string.count))
        return NSAttributedString(attributedString: attributedString)
    }
}


extension UITableView {
  func reloadDataSmoothly() {
    UIView.setAnimationsEnabled(true)
    CATransaction.begin()

    CATransaction.setCompletionBlock { () -> Void in
      UIView.setAnimationsEnabled(true)
    }

    reloadData()
    beginUpdates()
    endUpdates()

    CATransaction.commit()
  }
}

extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}


import WebKit

extension WKWebView {

    /// load HTML String same font like the UIWebview
    ///
    //// - Parameters:
    ///   - content: HTML content which we need to load in the webview.
    ///   - baseURL: Content base url. It is optional.
    func loadHTMLStringWithMagic(content:String,baseURL:URL?){
        let headerString = "<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></header>"
        loadHTMLString(headerString + content, baseURL: baseURL)
    }
}

extension UILabel {
    func setSpannedColor (fullText : String , changeText : String, color:UIColor ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value:color , range: range)
        self.attributedText = attribute
    }
}




extension CLPlacemark {

    func getFullAddress() -> String {
        
        return [locality, administrativeArea, country]
            .compactMap({ $0 })
            .joined(separator: " ")
        
        
        
       /* return [subThoroughfare, thoroughfare, locality, administrativeArea, country]
            .compactMap({ $0 })
            .joined(separator: " ")*/
    }
}

public extension UIImage {
      convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
      }
    }




extension UIView {
    func applyGradient(isVertical: Bool, colorArray: [UIColor]) {
        layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
         
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        if isVertical {
            //top to bottom
            gradientLayer.locations = [0.0, 1.0]
        } else {
            //left to right
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        backgroundColor = .clear
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }

}
