# ⚡ Pulse Mobile App

🎮 **Game-inspired Athlete Performance Tracker** built with Flutter for SIH 2025.

Pulse Mobile is a comprehensive fitness testing application that combines traditional athletic assessments with cutting-edge AI technology. Athletes can perform various fitness tests, track their results, and receive AI-powered feedback through a futuristic, gamified user interface.

## 🚀 Features

### 🔐 Authentication & Onboarding
- **Multi-language Support**: 22+ Indian languages including Hindi, Bengali, Tamil, Telugu, and more
- **User Registration & Login**: Secure authentication with backend integration
- **Onboarding Flow**: Interactive introduction to app features
- **Language Selection**: Choose preferred language on first launch

### 📏 Athletic Tests

#### Manual Tests
- **Height & Weight**: Record physical measurements
- **Shuttle Run**: Manual time entry for speed and agility testing

#### Sensor-Based Tests
- **Endurance Run**: GPS tracking with accelerometer data for stamina assessment

#### AI-Powered Tests
- **Vertical Jump**: On-device AI model for jump height measurement
- **Sit-ups**: Computer vision-based repetition counting with pose detection

### 🧠 AI & Technology
- **On-device AI Models**: TensorFlow Lite models for real-time analysis
- **Pose Detection**: MediaPipe integration for movement tracking
- **Computer Vision**: Camera-based exercise monitoring
- **Real-time Feedback**: Instant performance analysis

### 📡 Backend Integration
- **Data Storage**: Secure result storage via REST API
- **AI Feedback**: Backend-powered performance insights and recommendations
- **Progress Tracking**: Historical data analysis and trend visualization

### 🎮 Gamified UI
- **Dark Theme**: Futuristic neon aesthetic with gradient overlays
- **Game-style Cards**: Interactive test selection with visual feedback
- **Smooth Animations**: Engaging transitions and micro-interactions
- **Modern Typography**: Custom fonts for enhanced readability

## 🛠️ Tech Stack

### Frontend
- **Flutter 3.9.2+**: Cross-platform mobile development
- **Dart**: Programming language
- **Provider**: State management
- **Google Fonts**: Typography system

### AI & ML
- **TensorFlow Lite**: On-device model inference
- **MediaPipe**: Pose detection and tracking
- **Computer Vision**: Real-time movement analysis

### Sensors & Hardware
- **Camera**: Video capture for AI analysis
- **GPS**: Location tracking for endurance runs
- **Accelerometer**: Motion detection and analysis
- **Permission Handler**: Device access management

### Backend & API
- **HTTP**: REST API communication
- **Shared Preferences**: Local data persistence
- **File Management**: Image and video processing

### Localization
- **Flutter Localizations**: Multi-language support
- **ARB Files**: Translation resource management
- **Intl**: Internationalization utilities

## 📂 Project Structure

```
lib/
├── main.dart                 # App entry point
├── l10n/                    # Localization files (22+ languages)
├── models/                  # Data models
│   ├── test_result.dart     # Test result structure
│   └── user.dart           # User data model
├── routes/                  # Navigation routing
│   └── app_routes.dart     # Route definitions
├── screens/                 # App screens
│   ├── auth/               # Authentication screens
│   │   ├── language_selector.dart
│   │   ├── login.dart
│   │   ├── onboarding.dart
│   │   └── register.dart
│   ├── dashboard/          # Main dashboard
│   │   └── dashboard.dart
│   ├── info/               # Information screens
│   │   └── height_weight.dart
│   ├── profile/            # User profile
│   │   └── profile_page.dart
│   └── sports/             # Athletic test screens
│       ├── endurance_run.dart
│       ├── progress_page.dart
│       ├── shuttle_run.dart
│       ├── situp_screen.dart
│       ├── situps.dart
│       ├── vertical_jump_screen.dart
│       └── vertical_jump.dart
├── services/               # Business logic
│   ├── api_service.dart    # Backend API integration
│   ├── auth_service.dart   # Authentication logic
│   ├── mediapipe_pose.dart # Pose detection
│   ├── mock_situp_service.dart
│   ├── mock_vertical_jump_service.dart
│   ├── pose_detector.dart  # AI pose detection
│   ├── pose_painter.dart   # Visual pose rendering
│   ├── sensor_service.dart # Hardware sensors
│   └── skeleton_painter.dart
├── theme/                  # UI theming
│   └── app_theme.dart     # Dark theme configuration
├── utils/                  # Utilities
│   └── constants.dart     # App constants
└── widgets/               # Reusable components
    ├── drawer.dart        # Navigation drawer
    └── test_card.dart     # Test selection cards

assets/
├── images/                # UI assets and test images
└── models/               # AI model files
    ├── movenet_lightning.tflite
    └── pose_landmarker_lite.task
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.9.2 or higher
- Dart SDK
- Android Studio / VS Code
- Android device or emulator (API level 21+)
- iOS device or simulator (iOS 11.0+)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd pulse-mobile
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate localization files**
   ```bash
   flutter gen-l10n
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Build Instructions

#### Android
```bash
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release
```

#### iOS
```bash
# Debug build
flutter build ios --debug

# Release build
flutter build ios --release
```

## 🔄 Data Flow

1. **Test Execution**: Athlete performs test (manual, sensor, or AI-powered)
2. **Data Collection**: App captures relevant metrics and measurements
3. **Local Processing**: On-device AI models analyze performance data
4. **Data Transmission**: Structured JSON sent to backend via `/data/store`
5. **Feedback Request**: Athlete requests insights via `/feedback` endpoint
6. **Result Display**: AI-generated feedback presented in gamified UI

## 📱 Supported Tests

| Test Type | Method | AI Integration | Data Collected |
|-----------|--------|----------------|----------------|
| Height & Weight | Manual Entry | ❌ | Physical measurements |
| Shuttle Run | Manual Timer | ❌ | Time, distance |
| Endurance Run | GPS + Sensors | ❌ | Distance, time, pace |
| Vertical Jump | Camera + AI | ✅ | Jump height, form analysis |
| Sit-ups | Camera + AI | ✅ | Repetition count, form |

## 🌐 Localization

The app supports 22+ Indian languages:
- Assamese (as)
- Bengali (bn)
- Bodo (brx)
- Dogri (doi)
- English (en)
- Gujarati (gu)
- Hindi (hi)
- Kannada (kn)
- Konkani (kok)
- Kashmiri (ks)
- Maithili (mai)
- Malayalam (ml)
- Manipuri (mni)
- Marathi (mr)
- Nepali (ne)
- Odia (or)
- Punjabi (pa)
- Santali (sat)
- Sindhi (sd)
- Tamil (ta)
- Telugu (te)
- Urdu (ur)

## 🎨 UI/UX Design

### Theme
- **Dark Mode**: Primary interface with neon accents
- **Color Palette**: Deep blacks, electric blues, and vibrant gradients
- **Typography**: Modern, readable fonts with proper hierarchy
- **Animations**: Smooth transitions and engaging micro-interactions

### Components
- **Test Cards**: Gamified selection interface with hover effects
- **Progress Indicators**: Visual feedback for test completion
- **Results Display**: Clear, actionable performance insights
- **Navigation**: Intuitive drawer-based navigation system

## 🔧 Configuration

### API Endpoints
Update `lib/services/api_service.dart` with your backend URLs:
```dart
static const String baseUrl = 'https://your-backend-url.com';
static const String storeDataEndpoint = '/data/store';
static const String feedbackEndpoint = '/feedback';
```

### AI Models
Place TensorFlow Lite models in `assets/models/`:
- `movenet_lightning.tflite`: Pose detection model
- `pose_landmarker_lite.task`: MediaPipe pose landmarker

## 🧪 Testing

Run the test suite:
```bash
flutter test
```

## 📦 Dependencies

Key dependencies include:
- `flutter_localizations`: Multi-language support
- `google_fonts`: Typography
- `camera`: Video capture
- `geolocator`: GPS tracking
- `provider`: State management
- `shared_preferences`: Local storage
- `http`: API communication
- `permission_handler`: Device permissions

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is part of the Smart India Hackathon 2025 (SIH 2025).

## 🏆 Acknowledgments

- **Smart India Hackathon 2025** for the platform
- **Flutter Team** for the amazing framework
- **MediaPipe** for pose detection capabilities
- **TensorFlow Lite** for on-device AI inference

## 📞 Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation for common solutions

---

**Built with ❤️ for athletes and fitness enthusiasts**