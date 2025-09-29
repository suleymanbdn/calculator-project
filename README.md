# Hesap Makinesi (Flutter)

> Basit, hızlı ve duyarlı bir hesap makinesi uygulaması. Android, iOS, Web ve masaüstünde çalışır.

---

## ✨ Özellikler

- Temel aritmetik: toplama, çıkarma, çarpma, bölme
- Karanlık/açık tema desteği (Material)
- Klavye odaklı kullanım (Web/Masaüstü)
- Platformlar: Android, iOS, Web, Windows, macOS, Linux

## 🧰 Teknolojiler

- Flutter 3+
- Dart 3+
- Material Design bileşenleri

## 🚀 Hızlı Başlangıç

```bash
# Bağımlılıkları indir
flutter pub get

# Uygulamayı çalıştır (bağlı cihaza/emülatöre)
flutter run

# Web için
flutter run -d chrome
```

## 📸 Ekran Görüntüleri

| Ana Ekran | İşlem Örneği |
| --- | --- |
| ![Ana Ekran](screenshots/screen1.png) | ![İşlem Örneği](screenshots/screen2.png) |

Not: Görselleri `screenshots/` klasörüne ekleyin. İsimleri dilediğiniz gibi düzenleyebilirsiniz.

## 🗂️ Proje Yapısı

```
lib/
  main.dart               # Giriş noktası
  calculator_screen.dart  # Hesap makinesi arayüzü ve mantığı
```

## 🔧 Komutlar (Geliştirici)

```bash
# Format ve analiz
flutter format .
flutter analyze

# Testler
flutter test

# Release APK (Android)
flutter build apk --release
```

## 🗺️ Yol Haritası

- [ ] Bilimsel mod (sin, cos, tan, log)
- [ ] Yerel depolama ile işlem geçmişi
- [ ] Çoklu dil desteği (tr/en)

## 🤝 Katkı

Katkılar memnuniyetle karşılanır. Lütfen PR açmadan önce kısa bir issue oluşturun ve değişikliklerinizi küçük, odaklı PR’lar halinde gönderin.

## 📄 Lisans

Bu proje eğitim amaçlıdır. İhtiyaç halinde bir açık kaynak lisansı eklenebilir (MIT önerilir).

## 📚 Faydalı Bağlantılar

- Flutter Başlangıç: https://docs.flutter.dev/get-started/codelab
- Flutter Cookbook: https://docs.flutter.dev/cookbook
- Flutter Belgeleri: https://docs.flutter.dev/
