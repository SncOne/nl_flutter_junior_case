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
	@override String get haveAccount => 'Hesabın var mı?';
	@override String get profile_detail => 'Profil Detayı';
	@override String get upload_photo => 'Fotoğraf Yükle';
	@override String get upload_photo_subtitle => 'Profil fotoğrafın için görsel yükleyebilirsin';
	@override String get kContinue => 'Devam Et';
	@override String get skip => 'Atla';
	@override String get home => 'Ana Sayfa';
	@override String get profile => 'Profil';
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
	@override String get see_all_token_plans => 'Tüm Jetonları Gör';
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
			case 'haveAccount': return 'Hesabın var mı?';
			case 'profile_detail': return 'Profil Detayı';
			case 'upload_photo': return 'Fotoğraf Yükle';
			case 'upload_photo_subtitle': return 'Profil fotoğrafın için görsel yükleyebilirsin';
			case 'kContinue': return 'Devam Et';
			case 'skip': return 'Atla';
			case 'home': return 'Ana Sayfa';
			case 'profile': return 'Profil';
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
			case 'see_all_token_plans': return 'Tüm Jetonları Gör';
			default: return null;
		}
	}
}

