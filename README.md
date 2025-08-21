# 🌍 Countries App

An iOS application built with **SwiftUI** using the **Clean architecture**.  
It allows users to search for countries, view basic information, and mark them as favorites.  

---

##  Features
-  **Search countries** in real-time by name  
-  **Favorites**: mark and access your favorite countries  
-  **Bottom Navigation** with tabs for countries and favorites  
-  **Clean SwiftUI + MVVM architecture**  
-  **Networking** using `URLSession` and a public countries API  
-  **Security-first approach** following **OWASP Mobile guidelines**  

---

## Tech Stack
- **Language:** Swift 5.9+  
- **Framework:** SwiftUI  
- **Architecture:** Clean architecture
- **Networking:** URLSession   
- **IDE:** Xcode 16  
- **Compatibility:** iOS 16+  

---


##  Security
This app follows best practices recommended by **OWASP Mobile**:

1. **App Transport Security (ATS)** enabled in `Info.plist`  
2. **Input validation** to prevent crashes on searches  
3. **Basic Jailbreak detection** to mitigate risks on compromised devices  
4. **Keychain usage** (future extension for sensitive data such as authentication)  
5. **Service modularization** to isolate networking and security logic  

---

##  Recomendations
This app follows some practices recommended by **OWASP Mobile**:

1. **App Transport Security (ATS)** enabled in `Info.plist`  
3. **Basic Jailbreak detection** to mitigate risks on compromised devices  
4. **Keychain usage** (future extension for sensitive data such as authentication)  
5. **Service modularization** to isolate networking and security logic  

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/jesersu/CountriesApp.git
