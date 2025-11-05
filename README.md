# health_connect_sleep

## 🛠 Cấu hình dự án

- **Framework:** Flutter (Dart)
- **State Management:** Cubit (flutter_bloc)
- **Thư viện chính:** [health](https://pub.dev/packages/health) ^13.2.1
- **Các package sử dụng:**
  - flutter_bloc: ^8.1.3
  - equatable: ^2.0.5
  - health: ^13.2.1
  - intl: ^0.19.0
  - url_launcher: ^6.2.2

- **Yêu cầu môi trường:**
  - Flutter SDK: >=3.8.1
  - Android: Min SDK 26 (khuyến nghị 28+)
  - iOS, Windows, macOS, Linux: Hỗ trợ build mặc định của Flutter

- **Cấu trúc thư mục:**
  ```
  lib/
    main.dart
    cubit/
      health_connect_cubit.dart
      health_connect_state.dart
    models/
      sleep_data.dart
    screens/
      sleep_screen.dart
    utils/
      health_helper.dart
  ```

- **Hướng dẫn build APK:**
  ```
  flutter build apk --release
  ```
  File xuất ra: `build/app/outputs/flutter-apk/app-release.apk`

- **Tính năng chính:**
  - Kiểm tra trạng thái Health Connect
  - Yêu cầu và kiểm tra quyền truy cập
  - Lấy dữ liệu giấc ngủ 7 ngày gần nhất
  - Giao diện sạch, dễ sử dụng
  - Xử lý trạng thái lỗi, empty, loading
  - Pull-to-refresh

## 📄 Thông tin thêm

- Xem chi tiết hướng dẫn build và submit tại [`BUILD_AND_SUBMIT.md`](BUILD_AND_SUBMIT.md)
