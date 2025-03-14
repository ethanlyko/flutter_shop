# flutter_shop

This flutter shop project demonstrates the use of [Platzi Fake Store API](https://fakeapi.platzi.com/) to simulate e-commerce operations. It utlizes retrofit, riverpod, realm database, and firebase auth. Retrofit is a HTTP client library, riverpod is a reactive caching and data-binding framework to take care of application's logic, and realm is a mobile key-value database. Additionally, we use [firebase_auth](https://pub.dev/packages/firebase_auth) to handle user authentication.

![app preview](media/app_preview.gif)

## Dependencies
   - [retrofit](https://pub.dev/packages/retrofit): A HTTP client library
   - [riverpod](https://pub.dev/packages/riverpod): A reactive caching and data-binding framework
   - [freezed](https://pub.dev/packages/freezed): Code generator for data classe
   - [go_router](https://pub.dev/packages/go_router): A declarative routing package for Flutter
   - [shared_preferences](https://pub.dev/packages/shared_preferences): Wraps platform-specific persistent storage for simple data
   - [realm](https://pub.dev/packages/realm): Realm is a mobile database that runs directly inside phones, tablets or wearables
   - [carousel_slider_plus](https://pub.dev/packages/carousel_slider_plus): A carousel slider widget, support infinite scroll and custom child widget.
   - [firebase_auth](https://pub.dev/packages/firebase_auth): Flutter plugin for Firebase Auth, enabling authentication
   - [badges](https://pub.dev/packages/badges): A package for creating badges.

## How to Run
  1. Clone source
  2. firebase_auth
     - Follow the instructions of [Firebase document](https://firebase.google.com/docs/flutter/setup?platform=ios) to generate required files into the project
  3. Run it

## Overview
This project utilizes riverpod to handle state transitions. When product query executes, ui widgets watch query result which is handled by riverpod mechanism.

![product flow](media/product_flow.png)

It's the same logic for product category query. Moreover, products can be marked as favorite and stored as realm database records. These records can be displayed in favorate page which utilize riverpod mechanism.