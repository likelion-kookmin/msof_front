# msof_front

[![Netlify Status](https://api.netlify.com/api/v1/badges/654d426c-c84b-41df-9174-15e93ece2c88/deploy-status)](https://app.netlify.com/sites/msof-front-test/deploys)

## Installation

### 사전준비 (개발환경)

실행에 앞서서 아래의 항목들을 미리 설치해야합니다.
설치는 [링크](https://flutter.dev/docs/get-started/install)를 참고해주세요.  
만약에 Web만 실행하고 싶으시다면 Android와 관련된 내용들은 없어도 됩니다.

```
Doctor summary (to see all details, run flutter doctor -v):
[√] Flutter (Channel stable, 2.0.5, on Microsoft Windows [Version 10.0.19042.928], locale ko-KR)
[√] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
[√] Chrome - develop for the web
[√] Android Studio (version 4.0)
[√] VS Code (version 1.55.2)
```

### 실행

프로젝트를 실행가능한 device를 찾기 위해 다음 명령어를 입력해줍니다.

```
❯ flutter devices
3 connected devices:

sdk gphone x86 (mobile) • emulator-5554 • android-x86    • Android 11 (API 30) (emulator)
Chrome (web) • chrome • web-javascript • Google Chrome 90.0.4430.93
Edge (web)   • edge   • web-javascript • Microsoft Edge 89.0.774.68
```

Web으로 실행하기 위해서는 두 번째 열에 있는 이름을 이용해 다음과 같이 명령어를 입력해줍니다.

```
# Android emulator
flutte run -d emulator-5554

# Chrome
flutter run -d chrome

# Edge
flutter run -d edge
```

## Development

### Branchs

본 프로젝트는 아래 3개의 브랜치로 운영하고 있습니다.

- main: 바로 배포 가능한 브랜치
- develop: 개발 브랜치
- gh-pages: 실제로 배포되는 브랜치
