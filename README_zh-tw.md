# flutter_shop

### [English](README.md), [中文](README_zh-tw.md)

這個 Flutter 商店專案演示了如何使用 [Platzi Fake Store API](https://fakeapi.platzi.com/) 來模擬電子商務操作。它使用了 Retrofit、Riverpod、Realm 資料庫和 Firebase Auth。Retrofit 是一個 HTTP 客戶端函式庫，Riverpod 是一個反應式快取和資料綁定框架，用於處理應用程式的邏輯，而 Realm 是一個行動裝置的鍵值資料庫。此外，我們使用 [firebase_auth](https://pub.dev/packages/firebase_auth) 來處理使用者身份驗證。


![app preview](media/app_preview.gif)

## 相依性
   - [retrofit](https://pub.dev/packages/retrofit): 一個 HTTP 客戶端函式庫
   - [riverpod](https://pub.dev/packages/riverpod): 一個反應式快取和資料綁定框架
   - [freezed](https://pub.dev/packages/freezed): 資料類別的程式碼產生器
   - [go_router](https://pub.dev/packages/go_router): Flutter 的宣告式路由套件
   - [shared_preferences](https://pub.dev/packages/shared_preferences): 包裝平台特定的持久性儲存，用於儲存簡單的資料
   - [realm](https://pub.dev/packages/realm): Realm 是一個直接在手機、平板電腦或穿戴裝置內執行的行動資料庫
   - [carousel_slider_plus](https://pub.dev/packages/carousel_slider_plus): 一個輪播部件，支援無限滾動和自定義子部件。
   - [firebase_auth](https://pub.dev/packages/firebase_auth): Firebase Auth 的 Flutter 外掛程式，用於啟用身份驗證
   - [badges](https://pub.dev/packages/badges): 用於建立徽章的套件。

## 如何執行
  1. git clone https://github.com/ethanlyko/flutter_shop.git
  2. firebase_auth
     - 依照 [Firebase 文件](https://firebase.google.com/docs/flutter/setup?platform=ios) 的說明，將所需檔案產生到專案中
  3. 執行專案

## 概觀
此專案利用 Riverpod 來處理狀態轉換。當產品查詢執行時，UI 會監聽由 Riverpod 機制處理的查詢結果，這個結果由 Riverpod 機制處理，然後更新 UI。

![product flow](media/product_flow.png)

產品類別查詢也是相同的邏輯。此外，產品可以被標記為最愛，並儲存為 Realm 資料庫記錄。這些記錄可以在最愛頁面中顯示，該頁面也利用了 Riverpod 機制。
