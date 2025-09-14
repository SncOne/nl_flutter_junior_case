///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Sign In'
	String get login => 'Sign In';

	/// en: 'Sign in with your credentials'
	String get loginSubtitle => 'Sign in with your credentials';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Confirm Password'
	String get confirmPassword => 'Confirm Password';

	/// en: 'Forgot Password'
	String get forgotPassword => 'Forgot Password';

	/// en: 'Don't have an account?'
	String get noAccount => 'Don\'t have an account?';

	/// en: 'Sign Up'
	String get signUp => 'Sign Up';

	/// en: 'Create Account'
	String get createAccount => 'Create Account';

	/// en: 'Create an account by entering your details'
	String get createAccountSubtitle => 'Create an account by entering your details';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Last Name'
	String get surname => 'Last Name';

	late final TranslationsTermsAndConditionsEn termsAndConditions = TranslationsTermsAndConditionsEn._(_root);

	/// en: 'Already have an account?'
	String get haveAccount => 'Already have an account?';

	/// en: 'Profile Details'
	String get profile_detail => 'Profile Details';

	/// en: 'Upload Photo'
	String get upload_photo => 'Upload Photo';

	/// en: 'You can upload an image for your profile photo'
	String get upload_photo_subtitle => 'You can upload an image for your profile photo';

	/// en: 'Continue'
	String get kContinue => 'Continue';

	/// en: 'Skip'
	String get skip => 'Skip';

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Profile'
	String get profile => 'Profile';

	/// en: 'Add Photo'
	String get add_photo => 'Add Photo';

	/// en: 'Limited Offer'
	String get limited_offer => 'Limited Offer';

	/// en: 'Select a token pack to earn bonuses and unlock new sections!'
	String get limited_offer_subtitle => 'Select a token pack to earn bonuses and unlock new sections!';

	/// en: 'Available Bonuses'
	String get bonus => 'Available Bonuses';

	/// en: 'Premium Account'
	String get premium_account => 'Premium Account';

	/// en: 'More Matches'
	String get more_matches => 'More Matches';

	/// en: 'Featured'
	String get featured => 'Featured';

	/// en: 'More Likes'
	String get more_likes => 'More Likes';

	/// en: 'Choose a token pack to unlock features'
	String get unlock_features_title => 'Choose a token pack to unlock features';

	/// en: 'Weekly'
	String get weekly => 'Weekly';

	/// en: 'See All Token Plans'
	String get see_all_token_plans => 'See All Token Plans';
}

// Path: termsAndConditions
class TranslationsTermsAndConditionsEn {
	TranslationsTermsAndConditionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Terms and Conditions '
	String get prefix => 'Terms and Conditions ';

	/// en: 'I have Read and Agree.'
	String get action => 'I have Read and Agree.';

	/// en: 'Please read the Terms and Conditions before signing up.'
	String get suffix => 'Please read the Terms and Conditions before signing up.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'login': return 'Sign In';
			case 'loginSubtitle': return 'Sign in with your credentials';
			case 'email': return 'Email';
			case 'password': return 'Password';
			case 'confirmPassword': return 'Confirm Password';
			case 'forgotPassword': return 'Forgot Password';
			case 'noAccount': return 'Don\'t have an account?';
			case 'signUp': return 'Sign Up';
			case 'createAccount': return 'Create Account';
			case 'createAccountSubtitle': return 'Create an account by entering your details';
			case 'name': return 'Name';
			case 'surname': return 'Last Name';
			case 'termsAndConditions.prefix': return 'Terms and Conditions ';
			case 'termsAndConditions.action': return 'I have Read and Agree.';
			case 'termsAndConditions.suffix': return 'Please read the Terms and Conditions before signing up.';
			case 'haveAccount': return 'Already have an account?';
			case 'profile_detail': return 'Profile Details';
			case 'upload_photo': return 'Upload Photo';
			case 'upload_photo_subtitle': return 'You can upload an image for your profile photo';
			case 'kContinue': return 'Continue';
			case 'skip': return 'Skip';
			case 'home': return 'Home';
			case 'profile': return 'Profile';
			case 'add_photo': return 'Add Photo';
			case 'limited_offer': return 'Limited Offer';
			case 'limited_offer_subtitle': return 'Select a token pack to earn bonuses and unlock new sections!';
			case 'bonus': return 'Available Bonuses';
			case 'premium_account': return 'Premium Account';
			case 'more_matches': return 'More Matches';
			case 'featured': return 'Featured';
			case 'more_likes': return 'More Likes';
			case 'unlock_features_title': return 'Choose a token pack to unlock features';
			case 'weekly': return 'Weekly';
			case 'see_all_token_plans': return 'See All Token Plans';
			default: return null;
		}
	}
}

