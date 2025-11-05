# 📦 Build và Submit Assignment

## 🎯 Checklist trước khi submit

- [ ] Code đã được test trên thiết bị thật
- [ ] APK build thành công
- [ ] Git repository đã được tạo (public hoặc add quyền truy cập)
- [ ] README.md đầy đủ thông tin
- [ ] Code đã được format và clean

## 🔨 Build APK

### Option 1: Release APK (Recommended)
```bash
flutter build apk --release
```
File output: `build/app/outputs/flutter-apk/app-release.apk`

### Option 2: Debug APK (for testing)
```bash
flutter build apk --debug
```
File output: `build/app/outputs/flutter-apk/app-debug.apk`

### Option 3: Split APKs by ABI (smaller size)
```bash
flutter build apk --split-per-abi
```
Tạo ra 3 files:
- `app-armeabi-v7a-release.apk` (cho thiết bị 32-bit)
- `app-arm64-v8a-release.apk` (cho thiết bị 64-bit, khuyến nghị)
- `app-x86_64-release.apk` (cho emulator x86)

## 📤 Upload lên Git

### 1. Tạo Git repository

#### GitHub:
```bash
# Initialize git
git init

# Add all files
git add .

# First commit
git commit -m "Initial commit: Sleep Tracker App with Cubit"

# Create repository on GitHub, then:
git remote add origin https://github.com/your-username/sleep-tracker.git
git branch -M main
git push -u origin main
```

#### GitLab:
```bash
git init
git add .
git commit -m "Initial commit: Sleep Tracker App with Cubit"
git remote add origin https://gitlab.com/your-username/sleep-tracker.git
git branch -M main
git push -u origin main
```

### 2. Tạo Release với APK

#### GitHub:
1. Vào repository → Releases → "Create a new release"
2. Tag version: `v1.0.0`
3. Release title: `Sleep Tracker v1.0.0`
4. Description: Copy nội dung từ README features
5. Upload APK file
6. Publish release

#### GitLab:
1. Vào repository → Deployments → Releases → "New release"
2. Tag name: `v1.0.0`
3. Release notes: Copy features
4. Upload APK
5. Create release

## 📧 Submit Assignment

### Chuẩn bị:

1. **Git Repository URL**
   ```
   https://github.com/your-username/sleep-tracker
   ```

2. **APK File**
   - Upload APK lên Google Drive hoặc Dropbox
   - Hoặc đính kèm trong Git Release
   - Link download APK: `https://...`

3. **Email Template:**

```
Subject: Flutter Practical Assignment Submission - Sleep Tracker App

Dear [Reviewer Name],

I have completed the Flutter Practical Assignment - Sleep Tracker App.

Assignment Details:
- Framework: Flutter (Dart)
- State Management: Cubit (flutter_bloc)
- Main Library: health ^13.2.1

Deliverables:

1. Git Repository:
   URL: https://github.com/your-username/sleep-tracker
   Branch: main

2. APK File:
   Release APK: [Link to GitHub Release or Drive]
   Version: 1.0.0
   Size: ~XX MB
   Min SDK: 28 (Android 9.0)

Key Features Implemented:
✅ Health Connect status check
✅ Permission management
✅ Sleep data fetching (last 7 days)
✅ Clean UI with all required states
✅ Error handling
✅ Pull-to-refresh
✅ Empty state handling

Testing Notes:
- Tested on: [Device name, Android version]
- Health Connect version: [version]
- Test data source: Better Sleep / Google Fit

Additional Documentation:
- README.md with setup instructions
- BUILD_AND_SUBMIT.md with build guide
- Clean code structure with comments

Please let me know if you need any additional information.

Best regards,
[Your Name]
```

## ✅ Verification Checklist

### Code Quality:
- [ ] No compilation errors
- [ ] No warnings in console
- [ ] Code is well-commented
- [ ] Proper error handling
- [ ] Clean architecture (Cubit pattern)

### Functionality:
- [ ] App checks Health Connect installation
- [ ] Install button works (opens Play Store)
- [ ] Permission request works
- [ ] Retry permission button works
- [ ] Sleep data loads correctly
- [ ] Pull-to-refresh works
- [ ] Empty state shows when no data
- [ ] Error states handled properly

### UI/UX:
- [ ] Loading indicators show during async operations
- [ ] All messages are clear and helpful
- [ ] Navigation flows correctly
- [ ] No UI crashes or freezes
- [ ] Icons and colors are appropriate

### Documentation:
- [ ] README.md is complete
- [ ] Setup instructions are clear
- [ ] Testing steps are documented
- [ ] Code structure is explained

### Git Repository:
- [ ] All source files committed
- [ ] .gitignore properly configured
- [ ] README and docs included
- [ ] Commit messages are meaningful
- [ ] Repository is accessible

## 🎬 Demo Video (Optional but Recommended)

Nếu muốn tạo demo video:

1. **Screen Recording:**
   - Sử dụng ADB: `adb shell screenrecord /sdcard/demo.mp4`
   - Hoặc dùng Android built-in screen recorder

2. **Content to show:**
   - Launch app (Health Connect not installed)
   - Click Install button
   - After installing Health Connect
   - Grant permissions
   - View sleep data
   - Pull to refresh
   - Show empty state (if possible)

3. **Upload:**
   - YouTube (unlisted)
   - Loom
   - Google Drive

## 📞 Support

Nếu gặp vấn đề khi build hoặc submit:

1. Check Flutter doctor: `flutter doctor -v`
2. Clean project: `flutter clean && flutter pub get`
3. Re-build: `flutter build apk --release`
4. Check Android Studio for specific errors

## 🎉 Final Notes

- Hoàn thành trong vòng 5 ngày từ khi nhận assignment
- Đảm bảo APK có thể cài đặt và chạy trên Android thật
- Code phải clean và dễ đọc
- Documentation phải đầy đủ

Good luck! 🚀