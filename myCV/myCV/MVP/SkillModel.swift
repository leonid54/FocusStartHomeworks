import UIKit

final class SkillModel {
    
    struct SkillScreenContent {
        let devExperienceText = l10n("SKILL_VIEW_EXP")
        let descDevExperienceText = l10n("SKILL_VIEW_DESC_EXP")
        let languageExperienceText = l10n("SKILL_VIEW_LANG")
        let descLanguageExperienceText = l10n("SKILL_VIEW_DESC_LANG")
        let myExpectText = l10n("SKILL_VIEW_EXPECT")
        let descMyExpectText = l10n("SKILL_VIEW_DESC_EXPECT")
    }
    
    func getSkillText() -> SkillScreenContent {
        SkillScreenContent()
    }
}
