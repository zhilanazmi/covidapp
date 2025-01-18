# COVID-19 Tracker App

A Flutter-based COVID-19 Tracker App that provides real-time COVID-19 statistics and user-specific data. The application features login and signup authentication, animated loading screens, and a user-friendly interface.

## Features
- Tracks and displays real-time COVID-19 statistics.
- User-specific data management.
- Login and signup functionality with authentication.
- Animated loading screens for enhanced user experience.

## Dependencies
The application uses the following dependencies:
```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.6
  pie_chart: ^5.4.0
  animated_text_kit: ^4.2.2
  flutter_spinkit: ^5.2.1
  shimmer: ^3.0.0
  http: ^1.2.1
```

## Prerequisites
- Install Flutter SDK: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
- Install WAMP or XAMPP for backend server.
- Basic knowledge of PHP and MySQL.

## Installation and Setup

### Backend Setup
1. Install WAMP or XAMPP on your machine.
2. Open phpMyAdmin and create a database named `flutter`.
3. Create a table named `users` with the following columns:
   - `id`: INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT
   - `name`: VARCHAR(100), NOT NULL
   - `email`: VARCHAR(255), NOT NULL, UNIQUE
   - `password`: VARCHAR(255), NOT NULL
   - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIME
4. Update the IP address in the Flutter project:
   - Use `ipconfig` to find your local IP address.
   - Replace the placeholder URL in `main.dart` and `signup.dart` with your local IP, e.g.,
     ```dart
     final url = Uri.parse('http://<your-local-ip>/flutter_backend/login.php');
     ```
5. Place the PHP files (`login.php`, `signup.php`, `db.php`) in the `flutter_backend` folder under the `www` directory (WAMP) or `htdocs` directory (XAMPP).

### Flutter Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repository/covid-tracker.git
   ```
2. Navigate to the project directory:
   ```bash
   cd covid-tracker
   ```
3. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```

### Running the Project Locally
1. Start your WAMP or XAMPP server.
2. Run the Flutter application:
   ```bash
   flutter run
   ```

## How to Use the Application
1. **Launch the App:** Run the app on an emulator or connected device.
2. **Sign Up:** Create a new account by providing your name, email, and password.
3. **Login:** Use your credentials to log into the application.
4. **View Statistics:** Explore real-time COVID-19 statistics displayed in an easy-to-understand format.
5. **User Data:** Access your user-specific information within the app.
6. **Enjoy Animations:** Experience smooth transitions and animated loading screens while navigating the app.

## Contributing
We welcome contributions to improve the application. Please fork the repository and submit a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

