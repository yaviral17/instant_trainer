enum SupplementPreference { yes, no, maybe }

String supplementPrompt(SupplementPreference pref) {
  switch (pref) {
    case SupplementPreference.yes:
      return "I am open to taking supplements like protein powder, multivitamins, etc.";
    case SupplementPreference.no:
      return "I do not want any supplements in their plan.";
    case SupplementPreference.maybe:
      return "I am unsure about supplements, suggest only if truly beneficial.";
  }
}
