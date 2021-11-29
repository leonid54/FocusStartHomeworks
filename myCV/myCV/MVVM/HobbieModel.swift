import UIKit

final class HobbieModel {
    
    struct HobbieScreenContent {
        let sportText = l10n("HOBBIE_VIEW_SPORT")
        let descSportText = l10n("HOBBIE_VIEW_DESC_SPORT")
        let artText = l10n("HOBBIE_VIEW_ART")
        let descArtText = l10n("HOBBIE_VIEW_DESC_ART")
    }

    func getHobbieText() -> HobbieScreenContent {
        HobbieScreenContent()
    }
}
