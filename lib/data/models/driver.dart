class Driver {
  late int meetingKey;
  late int sessionKey;
  late int driverNumber;
  late String broadcastName;
  late String fullName;
  late String nameAcronym;
  late String teamName;
  late String teamColour;
  late String firstName;
  late String lastName;
  late String headshotUrl;
  late String countryCode;

  Driver.fromJson(Map<String, dynamic> json) {
    meetingKey = json['meeting_key'];
    sessionKey = json['session_key'];
    driverNumber = json['driver_number'];
    broadcastName = json['broadcast_name'];
    fullName = json['full_name'];
    nameAcronym = json['name_acronym'];
    teamName = json['team_name'];
    teamColour = json['team_colour'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    headshotUrl = json['headshot_url'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meeting_key'] = meetingKey;
    data['session_key'] = sessionKey;
    data['driver_number'] = driverNumber;
    data['broadcast_name'] = broadcastName;
    data['full_name'] = fullName;
    data['name_acronym'] = nameAcronym;
    data['team_name'] = teamName;
    data['team_colour'] = teamColour;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['headshot_url'] = headshotUrl;
    data['country_code'] = countryCode;
    return data;
  }
}
