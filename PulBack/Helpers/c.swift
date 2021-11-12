//
//  Language.swift
//  Pulback
//
//  Created by Firdavs Zokirov  on 12/08/21.
//

import Foundation

class Language{
    
   class func getTitle(type: Languages) -> String{
        let language = UserDefaults.standard.string(forKey: Keys.LANGUAGE)
        if language == "uz"{
            return getUzValue(type: type)
        }else if language == "eng"{
                return getEngValue(type: type)
        }else{
           return getRusValue(type: type)
        }
    }
    
    
    
}

//MARK: - UZBEK -
extension Language{
 private class  func getUzValue(type:Languages) -> String{
        switch type{
            case .btn_update: return "Yuklash"
            case .btn_yopish: return"Yopish"
            case .btn_profil: return "Profilni yangilash"
            case .btn_outapp: return "Yopish"
                
            case .lbl_spending: return "Siz 0% sarfladingiz"
            case .lbl_call: return "Qo'ngiroq qilish"
            case .lbl_direction: return "Yo'nalish"
            case .lbl_address: return "Manzil"
            case .lbl_market: return "tiin ulgirchi savdo do'kon"
            case .lbl_open: return "ochiq"
            case .lbl_benefit: return "foyda"
            case .lbl_cost: return "xarajat"
            case .lbl_sum: return "so'm"
            case .lbl_language: return "Til"
            case .lbl_tolov: return"Tolov"
           
        }
    }
}

//MARK: - RUSSIAN -
extension Language{
 private  class  func getRusValue(type:Languages) -> String{
        switch type{
            case .btn_update: return "Скачать"
            case .btn_yopish: return "Закрывать"
            case .btn_profil: return "Обновить профиль"
            case .btn_outapp: return "Закрывать"
                
            case .lbl_spending: return "Вы потратили 0%"
            case .lbl_call: return "позвонить"
            case .lbl_direction: return "Направление"
            case .lbl_address: return "Адрес"
            case .lbl_market: return "Тийн торговый магазин"
            case .lbl_open: return "открыто"
            case .lbl_benefit: return "выгода"
            case .lbl_cost: return "Стоимость"
            case .lbl_sum: return "сумма"
            case .lbl_language: return ""
            case .lbl_tolov: return "Оплата"
        }
    }
}


//MARK: - ENGLISH -
extension Language{
 private class func getEngValue(type:Languages) -> String{
        switch type{
            case .btn_update: return "Yuklash"
            case .btn_yopish: return "Close"
            case .btn_profil: return "Update profile"
            case .btn_outapp: return "Close"
               
            case .lbl_spending: return "Siz 0% sarfladingiz"
            case .lbl_call: return "Call"
            case .lbl_direction: return "Direction"
            case .lbl_address: return "Address"
            case .lbl_market: return "tiin trade shop"
            case .lbl_open: return "Open"
            case .lbl_benefit: return "Benefit"
            case .lbl_cost: return "Cost"
            case .lbl_sum: return "Sum"
            case .lbl_language: return "Language"
            case .lbl_tolov: return "Payment"
        }
    }
}
enum Languages{
    //MARK: - Button Settitle
    case btn_update
    case btn_profil
    case btn_outapp
    case btn_yopish
    
    //MARK: - Label.text
    case lbl_spending
    case lbl_call
    case lbl_direction
    case lbl_address
    case lbl_market
    case lbl_open
    case lbl_benefit
    case lbl_cost
    case lbl_sum
    case lbl_language
    case lbl_tolov
}
