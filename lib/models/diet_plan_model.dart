class DietPlanModel {
  String? username;
  String? userage;
  String? userweight;
  String? userheight;
  bool? userismale;
  String? userdietarypreference;
  String? userfitnessgoal;
  String? useractivitylevel;
  String? userexerciseintensity;
  String? userstepcount;
  String? userspending;
  String? usersupplementpreference;
  Map<String, dynamic>? generatedDietPlan;
  double? bmr;
  double? tdee;

  DietPlanModel({
    this.username,
    this.userage,
    this.userweight,
    this.userheight,
    this.userismale,
    this.userdietarypreference,
    this.userfitnessgoal,
    this.useractivitylevel,
    this.userexerciseintensity,
    this.userstepcount,
    this.userspending,
    this.usersupplementpreference,
    this.generatedDietPlan,
    this.bmr,
    this.tdee,
  });

  DietPlanModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userage = json['userage'];
    userweight = json['userweight'];
    userheight = json['userheight'];
    userismale = json['userismale'];
    userdietarypreference = json['userdietarypreference'];
    userfitnessgoal = json['userfitnessgoal'];
    useractivitylevel = json['useractivitylevel'];
    userexerciseintensity = json['userexerciseintensity'];
    userstepcount = json['userstepcount'];
    userspending = json['userspending'];
    usersupplementpreference = json['usersupplementpreference'];
    generatedDietPlan = json['generatedDietPlan'];
    bmr = json['bmr'];
    tdee = json['tdee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['userage'] = userage;
    data['userweight'] = userweight;
    data['userheight'] = userheight;
    data['userismale'] = userismale;
    data['userdietarypreference'] = userdietarypreference;
    data['userfitnessgoal'] = userfitnessgoal;
    data['useractivitylevel'] = useractivitylevel;
    data['userexerciseintensity'] = userexerciseintensity;
    data['userstepcount'] = userstepcount;
    data['userspending'] = userspending;
    data['usersupplementpreference'] = usersupplementpreference;
    data['generatedDietPlan'] = generatedDietPlan;
    data['bmr'] = bmr;
    data['tdee'] = tdee;
    return data;
  }

  @override
  String toString() {
    return 'DietPlanModel{username: $username, userage: $userage, userweight: $userweight, userheight: $userheight, userismale: $userismale, userdietarypreference: $userdietarypreference, userfitnessgoal: $userfitnessgoal, useractivitylevel: $useractivitylevel, userexerciseintensity: $userexerciseintensity, userstepcount: $userstepcount, userspending: $userspending, usersupplementpreference: $usersupplementpreference, generatedDietPlan: $generatedDietPlan, bmr: $bmr, tdee: $tdee}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DietPlanModel &&
        other.username == username &&
        other.userage == userage &&
        other.userweight == userweight &&
        other.userheight == userheight &&
        other.userismale == userismale &&
        other.userdietarypreference == userdietarypreference &&
        other.userfitnessgoal == userfitnessgoal &&
        other.useractivitylevel == useractivitylevel &&
        other.userexerciseintensity == userexerciseintensity &&
        other.userstepcount == userstepcount &&
        other.userspending == userspending &&
        other.usersupplementpreference == usersupplementpreference &&
        other.generatedDietPlan == generatedDietPlan &&
        other.bmr == bmr &&
        other.tdee == tdee;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        userage.hashCode ^
        userweight.hashCode ^
        userheight.hashCode ^
        userismale.hashCode ^
        userdietarypreference.hashCode ^
        userfitnessgoal.hashCode ^
        useractivitylevel.hashCode ^
        userexerciseintensity.hashCode ^
        userstepcount.hashCode ^
        userspending.hashCode ^
        usersupplementpreference.hashCode ^
        generatedDietPlan.hashCode ^
        bmr.hashCode ^
        tdee.hashCode;
  }

  String prompt() {
    return ''''
You are a professional AI dietician and fitness expert. Based on the user information provided below, generate a detailed daily diet plan that suits their body, preferences, and goals.

### USER PROFILE
- Name: ${username!} 
- Age: ${userage!} years
- Gender: ${userismale! ? "Male" : "Female"}
- Weight: ${userweight!} kg
- Height: ${userheight!} cm

### DIETARY PREFERENCE
${userdietarypreference!}

### FITNESS GOAL
${userfitnessgoal!}

### PHYSICAL ACTIVITY
- Daily Activity Level: ${useractivitylevel!}
- Exercise Frequency per Week: ${userexerciseintensity!}
- Average Daily Steps: ${userstepcount!}
- Estimated Calories Burned per Day: Estimated calories burned per day: ${tdee!.toStringAsFixed(0)} kcal

### FINANCIAL PREFERENCE
- Monthly Budget for Diet: ${userspending!}
- Open to Supplements: ${usersupplementpreference!}

---

Please generate a structured JSON response with the following format:

```json
{
  "daily_plan": {
    "breakfast": {
      "time": "8:00 AM",
      "items": ["...", "..."],
      "calories": 300,
      "protein": "20g",
      "carbohydrates": "40g",
      "fats": "10g",
      "fiber": "5g"

    },
    "mid_morning_snack": {
      "time": "10:30 AM",
      "items": ["...", "..."],
      "calories": 300,
      "protein": "20g",
      "carbohydrates": "40g",
      "fats": "10g",
      "fiber": "5g"

    },
    "lunch": {
      "time": "1:00 PM",
      "items": ["...", "..."],
      "calories": 300,
      "protein": "20g",
      "carbohydrates": "40g",
      "fats": "10g",
      "fiber": "5g"
    },
    "evening_snack": {
      "time": "4:30 PM",
      "items": ["...", "..."],
    "calories": 300,
      "protein": "20g",
      "carbohydrates": "40g",
      "fats": "10g",
      "fiber": "5g"
    },
    "dinner": {
      "time": "7:30 PM",
      "items": ["...", "..."],
      "calories": 300,
      "protein": "20g",
      "carbohydrates": "40g",
      "fats": "10g",
      "fiber": "5g"
    },
    "supplements": [
      {
        "name": "...",
        "purpose": "...",
        "timing": "..."
      }
    ]
  },
  "total_daily_calories": 1550,
  "nutrition_breakdown": {
    "calories": 300,
      "protein": "20g",
      "carbohydrates": "40g",
      "fats": "10g",
      "fiber": "5g"
  },
  "water_intake": {
    "amount": "2.5 liters",
    "notes": "Drink water throughout the day."
  },
}
```
### NOTES 
-  Just provide the JSON response without any additional text or explanation.
- ensure the JSON structure and keys name are same as given above.
''';
  }
}
