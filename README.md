# 🎬 JR Case Flutter Uygulaması

NodeLabs Junior Developer Case Study kapsamında geliştirilen bu Flutter uygulaması, film kataloğu üzerinden kimlik doğrulama, içerik keşfi ve profil yönetimi özelliklerini uçtan uca sergileyen üretim seviyesinde bir örnek projedir. Temiz mimari ilkeleri, Riverpod tabanlı durum yönetimi ve güçlü ağ/yerel depolama altyapısı ile gerçek dünyadaki senaryolara uygun bir başlangıç noktası sunar.

## 📚 İçindekiler
- [Öne Çıkan Özellikler](#-öne-çıkan-özellikler)
- [Teknoloji Yığını](#-teknoloji-yığını)
- [Modüler Yapı](#-modüler-yapı)
- [Kurulum](#-kurulum)
- [Geliştirme Akışı](#-geliştirme-akışı)
- [Testler](#-testler)
- [Ağ ve Güvenlik](#-ağ-ve-güvenlik)
- [Uluslararasılaştırma](#-uluslararasılaştırma)
- [Ekran Görüntüleri](#-ekran-görüntüleri)
- [Demo Videosu](#-demo-videosu)
- [Katkıda Bulunma](#-katkıda-bulunma)
- [Lisans](#-lisans)

## ✨ Öne Çıkan Özellikler
- **Kimlik Doğrulama Akışı**: Giriş, kayıt ve JWT tabanlı oturum sürdürme; kayıt sırasında sözleşme onayı ve form doğrulamaları.
- **Profil & Medya Yönetimi**: Kullanıcı bilgileri, profil fotoğrafı yükleme/düzenleme ve favori filmler listesi.
- **Sonsuz Film Akışı**: Vertikal PageView ile sonsuz kaydırmalı film kataloğu, favori yönetimi ve detay sayfası.
- **Film Detay Deneyimi**: Postere tıklayınca tam ekran galeri, temel bilgiler, teknik detaylar ve benzeri içerikler.
- **Özel Arayüz Bileşenleri**: Animasyonlu alt navigasyon çubuğu, özelleştirilmiş form alanları, toast/overlay bildirimleri.
- **Bağlantı İzleme**: `connectivity_plus` ile gerçek zamanlı ağ denetimi ve bağlantı kesildiğinde özel ekran.
- **Ayarlar & Dil Desteği**: EN/TR lokalizasyonu, dil seçimi kalıcı olarak saklanır ve anında uygulanır.

## 🧰 Teknoloji Yığını
- **Flutter 3.8** & **Dart 3.8**
- **State Management**: Riverpod (`hooks_riverpod`, `riverpod_annotation`)
- **Navigasyon**: AutoRoute ve özel alt sekme yönlendirmesi
- **Ağ & Veri**: Dio + interceptor, JWT denetimi, sonsuz sayfalama
- **Modelleme**: Freezed & JsonSerializable ile immutable veri modelleri
- **Yerel Depolama**: `flutter_secure_storage` ile token ve kullanıcı tercihleri
- **Görsel & Animasyon**: Lottie, CachedNetworkImage, özel shimmer/overlay efektleri
- **Çok Dillilik**: Slang/Slang Flutter paketleri ile çoklu dil oluşturma

## 🧱 Modüler Yapı
```
lib/
├── core/
│   ├── constants/        # Renk, tipografi, padding vb.
│   ├── enums/            # Global enum ve varlık tanımları
│   ├── helpers/          # Yardımcı fonksiyonlar (örn. overlay)
│   ├── mixins/           # Form doğrulama mixin'leri
│   ├── models/           # Freezed modelleri (MovieListModel vb.)
│   ├── providers/        # Uygulama genelinde izlenen servisler
│   ├── routes/           # AutoRoute konfigürasyonu ve özel route tipleri
│   ├── services/         # Dio, bağlantı takibi vb. altyapı servisleri
│   └── widgets/          # Ortak bileşenler (app bar, nav bar, butonlar)
├── features/
│   ├── auth/             # Login, Register, fotoğraf yükleme ve ilgili provider'lar
│   ├── home/             # Sonsuz film akışı ve film sağlayıcıları
│   ├── movie_detail/     # Film detay ekranı
│   ├── profile/          # Profil & favoriler ekranı
│   ├── settings/         # Dil seçimi ve tercihler
│   ├── no_connection/    # İnternet bağlantısı yok ekranı
│   └── nav_bar/          # Alt navigasyon ve animasyonlu öğeler
└── main.dart             # Uygulama girişi, tema ve lokalizasyon kurulumu
```

## ⚙️ Kurulum
### 1. Gereksinimler
- Flutter SDK 3.8.1+
- Dart SDK
- Android Studio veya VS Code (+ Flutter eklentileri)
- iOS dağıtımı için Xcode (macOS)

### 2. Depoyu Çekin
```bash
git clone <repo-url>
cd jr_case_boilerplate
```

### 3. Bağımlılıkları Kurun
```bash
flutter pub get
```

### 4. Kod Üretimi (varsa)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 5. Uygulamayı Çalıştırın
```bash
flutter run
```
> Android/iOS cihaz veya emulator üzerinde çalıştırın. Çevrimdışı senaryoları test etmek için sistem bağlantısını kesebilirsiniz.

## 🚀 Geliştirme Akışı
- Yeni bir feature için `lib/features/<feature_name>/` altında alt klasör (views, provider, widgets) açın.
- Ortak bileşenleri `lib/core/widgets/` altında paylaşın.
- Paket güncellemelerinde `build_runner` komutunu tekrar çalıştırın.
- Ağ çağrıları için `DioService` üzerinden JWT ve hata yönetimini kullanın.

## ✅ Testler
Varsayılan Flutter test çerçevesi proje ile birlikte gelir.
```bash
flutter test
```
> Gerektiğinde widget/integration test senaryolarını `test/` ve `integration_test/` klasörlerine ekleyin.

## 🌐 Ağ ve Güvenlik
- **Taban URL**: `https://caseapi.servicelabs.tech/`
- **Interceptor**: Otomatik JWT ekleme, token süresi dolduğunda giriş ekranına yönlendirme
- **Hata Yönetimi**: `CustomException` ile anlamlı hata mesajları
- **Güvenli Depolama**: Token ve dil tercihi `flutter_secure_storage` içinde saklanır

## 🌍 Uluslararasılaştırma
- `assets/i18n/en.i18n.json` ve `assets/i18n/tr.i18n.json` dosyaları Slang üzerinden derlenir.
- Dil seçimi Ayarlar ekranından yapılır ve uygulama yeniden başlatmadan güncellenir.

## 📸 Ekran Görüntüleri
> 📌 Aşağıdaki görseller henüz eklenmedi. Her ekranı kaydedip `assets/screenshots/` klasörüne ekledikten sonra ilgili dosya yollarını güncelleyin.

| Ekran | Önerilen Dosya | Not |
| --- | --- | --- |
| Splash & Lottie animasyonu | `assets/screenshots/splash.png` | Marka logosu ve geçiş animasyonu |
| Giriş (Login) | `assets/screenshots/login.png` | Hata mesajı/şifre gösterimini de yakalayabilirsiniz |
| Kayıt (Register + Sözleşme) | `assets/screenshots/register.png` | Sözleşme onayı ve validasyon örnekleri |
| Profil Fotoğrafı Yükleme | `assets/screenshots/upload_photo.png` | Galeriden seçim veya kamera placeholder |
| Sonsuz Film Akışı (Home) | `assets/screenshots/home_feed.png` | Favori butonu görünür halde |
| Film Detay | `assets/screenshots/movie_detail.png` | Poster galerisini ve teknik detayları gösterin |
| Favorilerle Profil | `assets/screenshots/profile.png` | Kullanıcı bilgisi ve favori grid'i |
| Ayarlar & Dil Değişimi | `assets/screenshots/settings.png` | Dil dropdown açık şekilde |
| İnternet Yok ekranı | `assets/screenshots/no_connection.png` | Lottie animasyonu ve uyarı metni |

## 🎥 Demo Videosu
| İçerik | Önerilen Format | Bağlantı |
| --- | --- | --- |
| Uçtan uca kullanıcı akışı (Splash → Login → Home → Detay → Profil → Ayarlar) | YouTube "Liste Dışı" veya Loom linki | `[Video bağlantınızı buraya ekleyin]` |

> 🎬 Videoyu 60-90 saniye arasında tutup temel kullanıcı akışını gösterin. Bağlantıyı README'ye ekledikten sonra erişim yetkilerini (linke sahip olan görebilir) kontrol edin.

## 🤝 Katkıda Bulunma
1. Depoyu fork'layın
2. Feature branch açın: `git checkout -b feature/ekleme`
3. Commit'leyin: `git commit -m "Açıklayıcı mesaj"`
4. Branch'i push'layın ve Pull Request oluşturun

## 📄 Lisans
Bu proje MIT lisansı ile lisanslanmıştır. Ayrıntılar için `LICENSE` dosyasına göz atın.
