//
//  ViewController.swift
//  sampleLayout
//
//  Created by Third Rock Techkno on 21/02/20.
//  Copyright © 2020 Third Rock Techkno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var clubMemberLbl: UILabel!
    @IBOutlet weak var nvItemLeft: UIView!
    @IBOutlet weak var navButton: UIButton!
    @IBOutlet weak var navItemCenter: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var vector: UIImageView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var dicountLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var cancelOrder: UIButton!
    @IBOutlet weak var newOrder: UIButton!
    @IBOutlet weak var checkout: UIButton!
    
    var total : Float = 0
    var dataSource = [["image2","Kendall Jackson Vintner's Reserve Chardonnay","349.38","1",""],
                      ["image3","Kendall Jackson Vintner's Reserve Chardonnay Luxury Wine","2035.67","2",""],
                      ["image2","Kendall Jackson Vintner's Reserve Chardonnay","349.38","1",""],
                      ["image3","Kendall Jackson Vintner's Reserve Chardonnay Luxury Wine","5439.98","1",""],
                      ["image2","Kendall Jackson Vintner's Reserve Chardonnay","349.38","1",""],
                      ["image3","Kendall Jackson Vintner's Reserve Chardonnay Luxury Wine","4439.98","1",""],
                      ["image2","Kendall Jackson Vintner's Reserve Chardonnay","345.67","2","10 "]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"VectorPic")!)
        self.view.isOpaque = false
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tblView.estimatedRowHeight = 100
        nvItemLeft.layer.cornerRadius = 3
        nvItemLeft.layer.masksToBounds = true
        imgView.layer.cornerRadius = imgView.frame.size.height/2
        imgView.clipsToBounds = true
        imgView.layer.masksToBounds = true
        imgView.layer.borderWidth = 1
        imgView.frame.size = CGSize(width: 30, height: 30)
        imgView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        
        
        clubMemberLbl.frame.size = CGSize(width: view.frame.size.width-16, height: 50)
        clubMemberLbl.layer.cornerRadius = clubMemberLbl.frame.size.height/2
        clubMemberLbl.layer.masksToBounds = true
        let attachment = NSTextAttachment()
        let string = ""
        let str = "  Club member"
        attachment.image = UIImage(named: "customer.png")
        attachment.bounds = CGRect(x: 0, y: 0, width: 16.67, height: 15.83)
        let attachmentString = NSAttributedString(attachment: attachment)
        let myString = NSMutableAttributedString(string: string)
        myString.append(attachmentString)
        myString.append(NSMutableAttributedString(string: str))
        clubMemberLbl.attributedText = myString
        clubMemberLbl.font = UIFont(name: "OpenSans-Bold", size: 18)
        
        
        searchField.frame.size = CGSize(width: view.frame.size.width-16, height: 50)
        searchField.setIconLeft(#imageLiteral(resourceName: "search"))
        searchField.setIconRight(#imageLiteral(resourceName: "Rectangle"))
        
        let attrText = NSMutableAttributedString(string: "Discount : ", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor(cgColor: CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.6))  ])
        attrText.append(NSMutableAttributedString(string: " 10% ", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.red ,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13)]))
        attrText.append(NSAttributedString(string: "(-$25.99)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red]))
        dicountLbl.attributedText = attrText
        
    
        
        searchField.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        searchField.layer.shadowRadius = 3.0
        searchField.layer.shadowOpacity = 1.0
        searchField.layer.shadowOffset = CGSize(width: 4, height: 4)
        searchField.layer.masksToBounds = false
        
        newOrder.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        newOrder.layer.shadowRadius = 3.0
        newOrder.layer.shadowOpacity = 1.0
        newOrder.layer.shadowOffset = CGSize(width: 4, height: 4)
        newOrder.layer.masksToBounds = false
        
        cancelOrder.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cancelOrder.layer.shadowRadius = 3.0
        cancelOrder.layer.shadowOpacity = 1.0
        cancelOrder.layer.shadowOffset = CGSize(width: 4, height: 4)
        cancelOrder.layer.masksToBounds = false
        countTotal()

    }
    func printTotal() {
        let attrText1 = NSMutableAttributedString(string: "Total:  ", attributes:
                [NSAttributedString.Key.foregroundColor : UIColor(cgColor: CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.6)) ])
            attrText1.append(NSMutableAttributedString(string: "$\(total)  ", attributes:
                [NSAttributedString.Key.foregroundColor : UIColor.black ,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13)]))
            totalLbl.attributedText = attrText1

    }
    func countTotal()
    {
        
        for i in 0..<dataSource.count
        {
            let price = (dataSource[i][2] as NSString).floatValue
            let qty = (dataSource[i][3] as NSString).floatValue
            let disc = (dataSource[i][4] as NSString).floatValue
            let finalPrice = price - (disc * qty)
            print(dataSource[0][2])
            total += finalPrice
//            print("$\(total)")
        }
        printTotal()
    }

}

extension ViewController : UITableViewDelegate , UITableViewDataSource
{
        func numberOfSections(in tableView: UITableView) -> Int {
            return dataSource.count
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataSource.count
                return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.frame.size.width = tblView.frame.size.width
        cell.cellImg.image = UIImage(named: dataSource[indexPath.section][0])
        cell.cellLbl.text = dataSource[indexPath.section][1]

        let price  = (dataSource[indexPath.section][2] as NSString).floatValue
        let qty  = (dataSource[indexPath.section][3] as NSString).floatValue
        let discount = (dataSource[indexPath.section][4] as NSString).floatValue
        let disc = (price * discount / 100)
        let dispPrice = price * qty - disc
//        print(disc)
        let attrText1 = NSMutableAttributedString(string: "$\(dispPrice) \n ", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.black , NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18) ])
        if qty > 1{
            attrText1.append(NSMutableAttributedString(string: "\(Int(qty)) * $\(price) \n", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.gray ,NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]))}
        
        else{attrText1.append(NSMutableAttributedString(string: "", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.gray ,NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]))}
        if discount > 0
        {
        attrText1.append(NSMutableAttributedString(string: "\(Int(discount))% (\(disc)) ", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.red ,NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]))
        }
        else
        {
            attrText1.append(NSMutableAttributedString(string: "", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.gray ,NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]))
        }
        cell.cellPriceLbl.textAlignment = .right
        cell.cellPriceLbl.attributedText = attrText1
       
        cell.layer.cornerRadius = 5

        cell.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cell.layer.shadowRadius = 3.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.shadowOffset = CGSize(width: 4, height: 4)
        cell.layer.masksToBounds = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return ""
        
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: tblView.frame.size.width, height: 20))
        let attrText1 = NSMutableAttributedString(string: "7  ", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.black , NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12) ])
        attrText1.append(NSMutableAttributedString(string: "items ", attributes:
            [NSAttributedString.Key.foregroundColor : UIColor.black ,NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]))
        lbl.attributedText = attrText1
        lbl.backgroundColor = .clear
        let lbl1 = UILabel(frame: CGRect(x: 0, y: 0, width: tblView.frame.size.width, height: 20))
        lbl1.text = "#0134234"
        lbl1.textColor = UIColor.black
        lbl1.font = UIFont.systemFont(ofSize: 12)
        lbl1.textAlignment = .right
        lbl.addSubview(lbl1)
        tableView.tableHeaderView = lbl
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? TableViewCell
        {
            cell.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            cell.layer.shadowRadius = 3.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.shadowOffset = CGSize(width: 4, height: 4)
            cell.layer.masksToBounds = false

        }
    }
   
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.clear
        return header
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tblView.rowHeight
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
   
}

extension UITextField
{
    func setIconLeft(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 20, height: 20.84))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    func setIconRight(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 0, y: 0, width: 75, height: 44))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 0, y: 0, width: 80, height: 45))
        iconContainerView.addSubview(iconView)
        let iconSubView = UIButton(frame:
            CGRect(x: 0, y: 0, width: 75, height: 44))
        iconSubView.setImage(UIImage(imageLiteralResourceName: "qrscan"), for: .normal)
        iconSubView.frame = CGRect(x: 26, y: 12, width: 24, height: 20.84)
        iconView.addSubview(iconSubView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}
