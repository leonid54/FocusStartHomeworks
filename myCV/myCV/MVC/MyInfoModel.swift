import UIKit

final class MyInfoModel {
    
    struct MyInfoScreenContent {
        let nameText: String
        let surnameText: String
        let ageText: String
        let educationText: String
        let cityText: String
    }
    
    func getLabelText() -> MyInfoScreenContent {
        MyInfoScreenContent(nameText: l10n("MY_INFO_NAME"), surnameText: l10n("MY_INFO_SURNAME"), ageText: l10n("MY_INFO_AGE"), educationText: l10n("MY_INFO_EDUCATION"), cityText: l10n("MY_INFO_CITY"))
    }
}
