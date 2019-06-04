//
//  TYDatePicker.swift
//  POH
//
//  Created by Nate Sesti on 1/17/19.
//  Copyright © 2019 Nate Sesti. All rights reserved.
//

import UIKit

//This was adapted from TYNumberPicker and just converted to conatain a UIDatePicker

protocol TYDatePickerDelegate {
    func selectedDate(_ date: Date)
}

class TYDatePicker: UIViewController {
    
    var delegate: TYDatePickerDelegate!
    var datePickerMode: UIDatePicker.Mode!
    var bgGradients: [UIColor] = [.white, .white]
    var tintColor = UIColor.black
    var heading = ""
    
    private var bgView, pickerView: UIView!
    private var cancelBtn, doneBtn: UIButton!
    private var titleLbl: UILabel!
    
    private var pickerViewBottomConstraint: NSLayoutConstraint?
    private var cancelBtnLeftConstraint: NSLayoutConstraint?
    private var doneBtnRightConstraint: NSLayoutConstraint?
    private var titleLblTopConstraint: NSLayoutConstraint?
    
    private var isPickerOpen = false
    
    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker(frame: .zero)
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = .clear
        return picker
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "arrow").withRenderingMode(.alwaysTemplate))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.transform = imgView.transform.rotated(by: 0.5 * CGFloat.pi).scaledBy(x: 0.65, y: 0.65)
        imgView.tintColor = tintColor
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    // this is for iphone x
    private var bottomPadding: CGFloat = 0.0
    
    init(_ delegate: TYDatePickerDelegate, datePickerMode: UIDatePicker.Mode) {
        self.delegate = delegate
        self.datePickerMode = datePickerMode
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeViews()
        addViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.animatePickerView()
        }
    }
    
    private func initializeViews() {
        bgView = createView()
        bgView.backgroundColor = UIColor(white: 0, alpha: 0.65)
        bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissController)))
        
        pickerView = createView()
        pickerView.layer.masksToBounds = true
        
        cancelBtn = createBtn(#imageLiteral(resourceName: "cancel"))
        doneBtn = createBtn(#imageLiteral(resourceName: "done"))
        doneBtn.tag = 99
        
        titleLbl = createLabel(heading, fontSize: 18)
    }
    
    private func addViews() {
        self.view.addSubview(bgView)
        bgView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        bgView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        bgView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        if let window = UIApplication.shared.keyWindow {
            if #available(iOS 11.0, *) {
                bottomPadding = window.safeAreaInsets.bottom
            } else {
                // Fallback on earlier versions
            }
        }
        
        self.view.addSubview(pickerView)
        if #available(iOS 11.0, *) {
            pickerView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 11.0, *) {
            pickerView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
        pickerViewBottomConstraint = pickerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 250 + bottomPadding)
        pickerViewBottomConstraint?.isActive = true
        pickerView.heightAnchor.constraint(equalToConstant: 250 + bottomPadding).isActive = true
        
        let _ = pickerView.applyGradient(colors: bgGradients, type: .cross)
        pickerView.roundCorners([.topLeft, .topRight], radius: 10)
        
        pickerView.addSubview(cancelBtn)
        cancelBtnLeftConstraint = cancelBtn.leftAnchor.constraint(equalTo: pickerView.leftAnchor, constant: -54)
        cancelBtnLeftConstraint?.isActive = true
        cancelBtn.topAnchor.constraint(equalTo: pickerView.topAnchor).isActive = true
        cancelBtn.widthAnchor.constraint(equalToConstant: 46).isActive = true
        cancelBtn.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        pickerView.addSubview(doneBtn)
        doneBtnRightConstraint = doneBtn.rightAnchor.constraint(equalTo: pickerView.rightAnchor, constant: 54)
        doneBtnRightConstraint?.isActive = true
        doneBtn.topAnchor.constraint(equalTo: pickerView.topAnchor).isActive = true
        doneBtn.widthAnchor.constraint(equalToConstant: 46).isActive = true
        doneBtn.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        pickerView.addSubview(titleLbl)
        titleLbl.centerXAnchor.constraint(equalTo: pickerView.centerXAnchor).isActive = true
        titleLblTopConstraint = titleLbl.topAnchor.constraint(equalTo: pickerView.topAnchor, constant: -86)
        titleLblTopConstraint?.isActive = true
        titleLbl.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        pickerView.addSubview(datePicker)
        datePicker.datePickerMode = datePickerMode
        datePicker.leftAnchor.constraint(equalTo: pickerView.leftAnchor).isActive = true
        datePicker.rightAnchor.constraint(equalTo: pickerView.rightAnchor).isActive = true
        datePicker.topAnchor.constraint(equalTo: pickerView.topAnchor, constant: 50).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 216).isActive = true
        
        pickerView.addSubview(arrowImageView)
        arrowImageView.centerXAnchor.constraint(equalTo: pickerView.leftAnchor).isActive = true
        arrowImageView.centerYAnchor.constraint(equalTo: pickerView.centerYAnchor, constant: 32 - bottomPadding/2).isActive = true
    }
    
    @objc private func btnTapped(_ sender: UIButton) {
        self.animatePickerView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.dismiss(animated: true, completion: {
                if sender.tag == 99 {
                    self.delegate?.selectedDate(self.datePicker.date)
                }
            })
        }
    }
    
    @objc private func dismissController() {
        self.animatePickerView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func animatePickerView() {
        pickerViewBottomConstraint?.constant = isPickerOpen ? 250 + bottomPadding + 10 : 0
        let animationDuration = isPickerOpen ? 0.4 : 0.5
        
        isPickerOpen = !isPickerOpen
        
        UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            
            self.view.layoutIfNeeded()
        })
        
        animateButtons(animationDuration)
    }
    
    private func animateButtons(_ duration: Double) {
        cancelBtnLeftConstraint?.constant = isPickerOpen ? 8 : -54
        doneBtnRightConstraint?.constant = isPickerOpen ? -8 : 54
        titleLblTopConstraint?.constant = isPickerOpen ? 0 : -86
        
        UIView.animate(withDuration: duration, delay: duration/2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            
            self.view.layoutIfNeeded()
        })
    }
    
    private func createView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func createLabel(_ text: String, fontSize: CGFloat) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "HelveticaNeue-Medium", size: fontSize)
        lbl.text = text
        lbl.textColor = tintColor
        return lbl
    }
    
    private func createBtn(_ image: UIImage) -> UIButton {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.imageView?.contentMode = .scaleAspectFit
        btn.setImage(image, for: .normal)
        btn.tintColor = tintColor
        btn.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
        return btn
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
