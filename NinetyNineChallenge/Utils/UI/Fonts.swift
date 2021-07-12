//
//  Fonts.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 11/7/21.
//

import UIKit

extension UIFont {
    //HELVETICA LIGHT
    static var helveticaLight16: UIFont {
        return Fonts.helveticaLight(size: 16)
    }
    
    static var helveticaLight14: UIFont {
        return Fonts.helveticaLight(size: 14)
    }
    
    static var helveticaLight12: UIFont {
        return Fonts.helveticaLight(size: 11)
    }
    
    // HELVETICA REGULAR
    static var helveticaRegular64: UIFont {
        return Fonts.helveticaRegular(size: 64)
    }

    static var helveticaRegular18: UIFont {
        return Fonts.helveticaRegular(size: 18)
    }
    
    static var helveticaRegular16: UIFont {
        return Fonts.helveticaRegular(size: 16)
    }

    static var helveticaRegular14: UIFont {
        return Fonts.helveticaRegular(size: 14)
    }
    
    static var helveticaRegular13: UIFont {
        return Fonts.helveticaRegular(size: 13)
    }

    static var helveticaRegular12: UIFont {
        return Fonts.helveticaRegular(size: 12)
    }
    
    static var helveticaRegular10: UIFont {
        return Fonts.helveticaRegular(size: 10)
    }

    static var helveticaRegular20: UIFont {
        return Fonts.helveticaRegular(size: 20)
    }

    // HELVETICA BOLD

    static var helveticaBold64: UIFont {
        return Fonts.helveticaBold(size: 64)
    }

    static var helveticaBold32: UIFont {
        return Fonts.helveticaBold(size: 32)
    }

    static var helveticaBold24: UIFont {
        return Fonts.helveticaBold(size: 24)
    }
    
    static var helveticaBold22: UIFont {
        return Fonts.helveticaBold(size: 22)
    }

    static var helveticaBold20: UIFont {
        return Fonts.helveticaBold(size: 20)
    }

    static var helveticaBold18: UIFont {
        return Fonts.helveticaBold(size: 18)
    }

    static var helveticaBold16: UIFont {
        return Fonts.helveticaBold(size: 16)
    }

    static var helveticaBold14: UIFont {
        return Fonts.helveticaBold(size: 14)
    }
    
    static var helveticaBold12: UIFont {
        return Fonts.helveticaBold(size: 12)
    }
    
    static var helveticaBold10: UIFont {
        return Fonts.helveticaBold(size: 10)
    }
    
    static var helveticaMedium18: UIFont {
        return Fonts.helveticaMedium(size: 18)
    }
    
    static var helveticaMedium16: UIFont {
        return Fonts.helveticaMedium(size: 16)
    }
    
    static var helveticaMedium14: UIFont {
        return Fonts.helveticaMedium(size: 14)
    }
    
    static var helveticaMedium12: UIFont {
        return Fonts.helveticaMedium(size: 12)
    }


    private enum Fonts {
        static func helveticaRegular(size: CGFloat) -> UIFont {
            return UIFont(name: GlobalConstants.fontNameNormal, size: size) ?? defaultFont(size: size)
        }

        static func helveticaBold(size: CGFloat) -> UIFont {
            return UIFont(name: GlobalConstants.fontNameBold, size: size) ?? defaultFont(size: size)
        }
        
        static func helveticaLight(size: CGFloat) -> UIFont {
            return UIFont(name: GlobalConstants.fontNameLight, size: size) ?? defaultFont(size: size)
        }
        
        static func helveticaMedium(size: CGFloat) -> UIFont {
            return UIFont(name: GlobalConstants.fontNameMedium, size: size) ?? defaultFont(size: size)
        }
        
        private static func defaultFont(size: CGFloat) -> UIFont {
            return systemFont(ofSize: size)
        }
    }
}
