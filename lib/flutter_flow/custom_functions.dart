import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int? ageCalculation(DateTime? date) {
  if (date == null) {
    return null;
  }
  final now = DateTime.now();
  int age = now.year - date.year;

// Adjust age if the current date hasn't reached the birth date of this year

  if (now.month < date.month ||
      (now.month == date.month && now.day < date.day)) {
    age--;
  }

// Check if age is less than 1 after adjustment

  if (age < 1) {
    return 1;
  }

  return age;
}

DateTime? stringToDateTime(String? stringDateTime) {
  // string to datetime format
  if (stringDateTime == null) {
    return null;
  }
  try {
    return DateTime.parse(stringDateTime);
  } catch (e) {
    return null;
  }
}

List<PatientSearchDataStruct>? sortingPatientsByCreatedDateDecreasing(
    List<PatientSearchDataStruct>? userProfilesList) {
  // sorting list of data by created_at column
  userProfilesList?.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  return userProfilesList;
}

List<UserProfilesDataStruct>? sortingUsersByCreatedDateDecreasing(
    List<UserProfilesDataStruct>? userProfilesList) {
  // sorting list of data by created_at column
  userProfilesList?.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  return userProfilesList;
}

List<String>? addStringToListAtFirst(
  List<String>? listOfStrings,
  String? value,
) {
  // add 'value' to list at 0 index
  listOfStrings?.insert(0, value ?? '');
  return listOfStrings;
}

int? generateRandomNumber() {
  // generate random number from 1 to 6 once
  return math.Random().nextInt(6) + 1;
}

List<int>? numberToList(int? number) {
  // parse  'number' to list of digits
  if (number == null) {
    return null;
  }
  final digits = <int>[];
  if (number == 0) {
    digits.add(0);
  } else {
    int temp = number.abs();
    while (temp > 0) {
      digits.add(temp % 10);
      temp ~/= 10;
    }
    if (number < 0) {
      digits.add(-1);
    }
  }
  return digits.reversed.toList();
}

List<String>? stringToList(String? string) {
  // convert word in "string" to list of values
  if (string == null) {
    return null;
  }
  return string.split('');
}

String? intToString(int? number) {
  // convert integer to string
  return number?.toString();
}

List<int>? sortListByIncreasing(List<int> valuesList) {
  // sort list of integers by increasing
  valuesList.sort();
  return valuesList;
}
