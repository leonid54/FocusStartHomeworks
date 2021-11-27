import UIKit

final class MyInfoModel {
    
    struct MyInfoScreenContent {
        let nameText = l10n("MY_INFO_NAME")
        let surnameText = l10n("MY_INFO_SURNAME")
        let ageText = l10n("MY_INFO_AGE")
        let educationText = l10n("MY_INFO_EDUCATION")
        let cityText = l10n("MY_INFO_CITY")
    }
    
    func getLabelText() -> MyInfoScreenContent {
        MyInfoScreenContent()
    }
}
