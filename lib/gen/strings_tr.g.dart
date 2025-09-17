///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsTr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsTr _root = this; // ignore: unused_field

	@override 
	TranslationsTr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTr(meta: meta ?? this.$meta);

	// Translations
	@override String get login => 'Giriş Yap';
	@override String get loginSubtitle => 'Kullanıcı bilgilerinle giriş yap';
	@override String get email => 'E-posta';
	@override String get password => 'Şifre';
	@override String get confirmPassword => 'Şifre Tekrar';
	@override String get forgotPassword => 'Şifremi Unuttum';
	@override String get noAccount => 'Bir hesabın yok mu?';
	@override String get signUp => 'Kayıt Ol';
	@override String get createAccount => 'Hesap Oluştur';
	@override String get createAccountSubtitle => 'Kullanıcı bilgilerini girerek kayıt ol';
	@override String get name => 'İsim';
	@override String get surname => 'Soyisim';
	@override late final _TranslationsTermsAndConditionsTr termsAndConditions = _TranslationsTermsAndConditionsTr._(_root);
	@override late final _TranslationsTermsTr terms = _TranslationsTermsTr._(_root);
	@override String get haveAccount => 'Hesabın var mı?';
	@override String get profile_detail => 'Profil Detayı';
	@override String get upload_photo => 'Fotoğraf Yükle';
	@override String get upload_photo_subtitle => 'Profil fotoğrafın için görsel yükleyebilirsin';
	@override String get kContinue => 'Devam Et';
	@override String get skip => 'Atla';
	@override String get home => 'Ana Sayfa';
	@override String get profile => 'Profil';
	@override String failed_to_fetch({required Object error}) => 'Veri alınamadı: ${error}';
	@override String something_went_wrong({required Object error}) => 'Bir şeyler ters gitti: ${error}';
	@override String get add_photo => 'Fotoğraf Ekle';
	@override String get limited_offer => 'Sınırlı Teklif';
	@override String get limited_offer_subtitle => 'Jeton paketini seçerek bonus kazanın ve yeni bölümlerin kilidini açın!';
	@override String get bonus => 'Alacağınız Bonuslar';
	@override String get premium_account => 'Premium Hesap';
	@override String get more_matches => 'Daha Fazla Eşleşme';
	@override String get featured => 'Öne Çıkarma';
	@override String get more_likes => 'Daha Fazla Beğeni';
	@override String get unlock_features_title => 'Kilidi açmak için bir jeton paketi seçin';
	@override String get weekly => 'Başına Haftalık';
	@override String get token => 'Jeton';
	@override String get see_all_token_plans => 'Tüm Jetonları Gör';
	@override String get logout => 'Çıkış Yap';
	@override String get settings => 'Ayarlar';
	@override String get select_language => 'Dil Seç';
	@override String version({required Object value}) => 'Sürüm: ${value}';
	@override String get no_internet_connection => 'İnternet Bağlantısı Yok';
	@override late final _TranslationsValidationTr validation = _TranslationsValidationTr._(_root);
	@override String get liked_movies => 'Beğendiklerim';
	@override String get gallery => 'Galeri';
	@override String get details => 'Detaylar';
	@override String get director => 'Yönetmen';
	@override String get actors => 'Oyuncular';
	@override String get genre => 'Tür';
	@override String get language => 'Dil';
	@override String get writer => 'Yazar';
	@override String get released => 'Yayınlanma';
	@override String get type => 'Tür';
	@override String get plot => 'Konu';
	@override String get no_liked_movies => 'Görünüşe göre henüz beğendiğiniz film yok.';
	@override String get coming_soon => 'Çok Yakında';
	@override String get login_success => 'Başarıyla giriş yapıldı!';
	@override String get token_not_found => 'Token bulunamadı';
	@override String get accept_terms => 'Devam etmek için şartları kabul etmelisiniz.';
	@override String get registration_success => 'Kayıt başarılı!';
}

// Path: termsAndConditions
class _TranslationsTermsAndConditionsTr implements TranslationsTermsAndConditionsEn {
	_TranslationsTermsAndConditionsTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get prefix => 'Kullanıcı sözleşmesini ';
	@override String get action => 'Okudum ve Kabul ediyorum.';
	@override String get suffix => 'Lütfen kayıt olmadan önce kullanıcı sözleşmesini okuyunuz.';
}

// Path: terms
class _TranslationsTermsTr implements TranslationsTermsEn {
	_TranslationsTermsTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hoşgeldiniz';
	@override String get intro => 'Bu örnek kullanım şartları metnidir. Uygulamayı kullanarak aşağıdaki koşulları kabul etmiş sayılırsınız.';
	@override String get item1 => '1. Hizmetin kullanımı: Uygulama içeriği bilgilendirme amaçlıdır ve değiştirilebilir. Kullanıcılar içerikleri sorumlulukları dahilinde kullanmalıdır.';
	@override String get item2 => '2. Sorumluluk reddi: Uygulama sağlayıcısı, uygulamanın sürekli erişilebilir olacağını veya içeriklerin hatasız olacağını garanti etmez.';
	@override String get item3 => '3. Gizlilik: Kullanıcıların kişisel verileri gizlilik politikasına uygun şekilde işlenir. (Bu örnek projede gerçek veri işleme olmayabilir.)';
	@override String get note => 'Bu metin örnektir. Gerçek bir proje için yasal metinleri hukuk danışmanınızla hazırlayın veya yerel düzenlemelere uygun olarak güncelleyin.';
	@override String get accept => 'Kabul Ediyorum';
}

// Path: validation
class _TranslationsValidationTr implements TranslationsValidationEn {
	_TranslationsValidationTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get email_required => 'E-posta gerekli';
	@override String get invalid_email => 'Geçersiz e-posta formatı';
	@override String get name_required => 'İsim gerekli';
	@override String get name_min_length => 'İsim en az 3 karakter olmalıdır';
	@override String get password_required => 'Şifre gerekli';
	@override String get password_min_length => 'Şifre en az 6 karakter olmalıdır';
	@override String get confirm_password_required => 'Şifre Tekrar gerekli';
	@override String get passwords_do_not_match => 'Şifreler uyuşmuyor';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsTr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'login': return 'Giriş Yap';
			case 'loginSubtitle': return 'Kullanıcı bilgilerinle giriş yap';
			case 'email': return 'E-posta';
			case 'password': return 'Şifre';
			case 'confirmPassword': return 'Şifre Tekrar';
			case 'forgotPassword': return 'Şifremi Unuttum';
			case 'noAccount': return 'Bir hesabın yok mu?';
			case 'signUp': return 'Kayıt Ol';
			case 'createAccount': return 'Hesap Oluştur';
			case 'createAccountSubtitle': return 'Kullanıcı bilgilerini girerek kayıt ol';
			case 'name': return 'İsim';
			case 'surname': return 'Soyisim';
			case 'termsAndConditions.prefix': return 'Kullanıcı sözleşmesini ';
			case 'termsAndConditions.action': return 'Okudum ve Kabul ediyorum.';
			case 'termsAndConditions.suffix': return 'Lütfen kayıt olmadan önce kullanıcı sözleşmesini okuyunuz.';
			case 'terms.title': return 'Hoşgeldiniz';
			case 'terms.intro': return 'Bu örnek kullanım şartları metnidir. Uygulamayı kullanarak aşağıdaki koşulları kabul etmiş sayılırsınız.';
			case 'terms.item1': return '1. Hizmetin kullanımı: Uygulama içeriği bilgilendirme amaçlıdır ve değiştirilebilir. Kullanıcılar içerikleri sorumlulukları dahilinde kullanmalıdır.';
			case 'terms.item2': return '2. Sorumluluk reddi: Uygulama sağlayıcısı, uygulamanın sürekli erişilebilir olacağını veya içeriklerin hatasız olacağını garanti etmez.';
			case 'terms.item3': return '3. Gizlilik: Kullanıcıların kişisel verileri gizlilik politikasına uygun şekilde işlenir. (Bu örnek projede gerçek veri işleme olmayabilir.)';
			case 'terms.note': return 'Bu metin örnektir. Gerçek bir proje için yasal metinleri hukuk danışmanınızla hazırlayın veya yerel düzenlemelere uygun olarak güncelleyin.';
			case 'terms.accept': return 'Kabul Ediyorum';
			case 'haveAccount': return 'Hesabın var mı?';
			case 'profile_detail': return 'Profil Detayı';
			case 'upload_photo': return 'Fotoğraf Yükle';
			case 'upload_photo_subtitle': return 'Profil fotoğrafın için görsel yükleyebilirsin';
			case 'kContinue': return 'Devam Et';
			case 'skip': return 'Atla';
			case 'home': return 'Ana Sayfa';
			case 'profile': return 'Profil';
			case 'failed_to_fetch': return ({required Object error}) => 'Veri alınamadı: ${error}';
			case 'something_went_wrong': return ({required Object error}) => 'Bir şeyler ters gitti: ${error}';
			case 'add_photo': return 'Fotoğraf Ekle';
			case 'limited_offer': return 'Sınırlı Teklif';
			case 'limited_offer_subtitle': return 'Jeton paketini seçerek bonus kazanın ve yeni bölümlerin kilidini açın!';
			case 'bonus': return 'Alacağınız Bonuslar';
			case 'premium_account': return 'Premium Hesap';
			case 'more_matches': return 'Daha Fazla Eşleşme';
			case 'featured': return 'Öne Çıkarma';
			case 'more_likes': return 'Daha Fazla Beğeni';
			case 'unlock_features_title': return 'Kilidi açmak için bir jeton paketi seçin';
			case 'weekly': return 'Başına Haftalık';
			case 'token': return 'Jeton';
			case 'see_all_token_plans': return 'Tüm Jetonları Gör';
			case 'logout': return 'Çıkış Yap';
			case 'settings': return 'Ayarlar';
			case 'select_language': return 'Dil Seç';
			case 'version': return ({required Object value}) => 'Sürüm: ${value}';
			case 'no_internet_connection': return 'İnternet Bağlantısı Yok';
			case 'validation.email_required': return 'E-posta gerekli';
			case 'validation.invalid_email': return 'Geçersiz e-posta formatı';
			case 'validation.name_required': return 'İsim gerekli';
			case 'validation.name_min_length': return 'İsim en az 3 karakter olmalıdır';
			case 'validation.password_required': return 'Şifre gerekli';
			case 'validation.password_min_length': return 'Şifre en az 6 karakter olmalıdır';
			case 'validation.confirm_password_required': return 'Şifre Tekrar gerekli';
			case 'validation.passwords_do_not_match': return 'Şifreler uyuşmuyor';
			case 'liked_movies': return 'Beğendiklerim';
			case 'gallery': return 'Galeri';
			case 'details': return 'Detaylar';
			case 'director': return 'Yönetmen';
			case 'actors': return 'Oyuncular';
			case 'genre': return 'Tür';
			case 'language': return 'Dil';
			case 'writer': return 'Yazar';
			case 'released': return 'Yayınlanma';
			case 'type': return 'Tür';
			case 'plot': return 'Konu';
			case 'no_liked_movies': return 'Görünüşe göre henüz beğendiğiniz film yok.';
			case 'coming_soon': return 'Çok Yakında';
			case 'login_success': return 'Başarıyla giriş yapıldı!';
			case 'token_not_found': return 'Token bulunamadı';
			case 'accept_terms': return 'Devam etmek için şartları kabul etmelisiniz.';
			case 'registration_success': return 'Kayıt başarılı!';
			default: return null;
		}
	}
}

