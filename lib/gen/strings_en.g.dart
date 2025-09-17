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
	late final TranslationsTermsEn terms = TranslationsTermsEn._(_root);

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

	/// en: 'Failed to fetch data: ${error}'
	String failed_to_fetch({required Object error}) => 'Failed to fetch data: ${error}';

	/// en: 'Something went wrong: ${error}'
	String something_went_wrong({required Object error}) => 'Something went wrong: ${error}';

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

	/// en: 'Token'
	String get token => 'Token';

	/// en: 'Weekly'
	String get weekly => 'Weekly';

	/// en: 'See All Token Plans'
	String get see_all_token_plans => 'See All Token Plans';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Select Language'
	String get select_language => 'Select Language';

	/// en: 'Version: ${value}'
	String version({required Object value}) => 'Version: ${value}';

	/// en: 'No Internet Connection'
	String get no_internet_connection => 'No Internet Connection';

	late final TranslationsValidationEn validation = TranslationsValidationEn._(_root);

	/// en: 'My Likes'
	String get liked_movies => 'My Likes';

	/// en: 'Gallery'
	String get gallery => 'Gallery';

	/// en: 'Details'
	String get details => 'Details';

	/// en: 'Director'
	String get director => 'Director';

	/// en: 'Actors'
	String get actors => 'Actors';

	/// en: 'Genre'
	String get genre => 'Genre';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Writer'
	String get writer => 'Writer';

	/// en: 'Released'
	String get released => 'Released';

	/// en: 'Type'
	String get type => 'Type';

	/// en: 'Plot'
	String get plot => 'Plot';

	/// en: 'It seems that you have not liked any movies yet.'
	String get no_liked_movies => 'It seems that you have not liked any movies yet.';

	/// en: 'Coming Soon'
	String get coming_soon => 'Coming Soon';

	/// en: 'Successfully logged in!'
	String get login_success => 'Successfully logged in!';

	/// en: 'Token not found'
	String get token_not_found => 'Token not found';

	/// en: 'You must accept the terms and conditions to proceed.'
	String get accept_terms => 'You must accept the terms and conditions to proceed.';

	/// en: 'Registration successful! '
	String get registration_success => 'Registration successful! ';
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

// Path: terms
class TranslationsTermsEn {
	TranslationsTermsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome'
	String get title => 'Welcome';

	/// en: 'This is a sample terms of use text. By using the app you agree to the following conditions.'
	String get intro => 'This is a sample terms of use text. By using the app you agree to the following conditions.';

	/// en: '1. Use of service: App content is for informational purposes and may change. Users must use content under their responsibility.'
	String get item1 => '1. Use of service: App content is for informational purposes and may change. Users must use content under their responsibility.';

	/// en: '2. Disclaimer: The app provider does not guarantee continuous availability or error-free content.'
	String get item2 => '2. Disclaimer: The app provider does not guarantee continuous availability or error-free content.';

	/// en: '3. Privacy: Users' personal data will be processed according to the privacy policy. (This sample project may not process real data.)'
	String get item3 => '3. Privacy: Users\' personal data will be processed according to the privacy policy. (This sample project may not process real data.)';

	/// en: 'This text is a sample. For a real project prepare legal texts with your legal counsel or update them to comply with local regulations.'
	String get note => 'This text is a sample. For a real project prepare legal texts with your legal counsel or update them to comply with local regulations.';

	/// en: 'I Accept'
	String get accept => 'I Accept';
}

// Path: validation
class TranslationsValidationEn {
	TranslationsValidationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Email is required'
	String get email_required => 'Email is required';

	/// en: 'Invalid email format'
	String get invalid_email => 'Invalid email format';

	/// en: 'Name is required'
	String get name_required => 'Name is required';

	/// en: 'Name must be at least 3 characters long'
	String get name_min_length => 'Name must be at least 3 characters long';

	/// en: 'Password is required'
	String get password_required => 'Password is required';

	/// en: 'Password must be at least 6 characters long'
	String get password_min_length => 'Password must be at least 6 characters long';

	/// en: 'Confirm Password is required'
	String get confirm_password_required => 'Confirm Password is required';

	/// en: 'Passwords do not match'
	String get passwords_do_not_match => 'Passwords do not match';
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
			case 'terms.title': return 'Welcome';
			case 'terms.intro': return 'This is a sample terms of use text. By using the app you agree to the following conditions.';
			case 'terms.item1': return '1. Use of service: App content is for informational purposes and may change. Users must use content under their responsibility.';
			case 'terms.item2': return '2. Disclaimer: The app provider does not guarantee continuous availability or error-free content.';
			case 'terms.item3': return '3. Privacy: Users\' personal data will be processed according to the privacy policy. (This sample project may not process real data.)';
			case 'terms.note': return 'This text is a sample. For a real project prepare legal texts with your legal counsel or update them to comply with local regulations.';
			case 'terms.accept': return 'I Accept';
			case 'haveAccount': return 'Already have an account?';
			case 'profile_detail': return 'Profile Details';
			case 'upload_photo': return 'Upload Photo';
			case 'upload_photo_subtitle': return 'You can upload an image for your profile photo';
			case 'kContinue': return 'Continue';
			case 'skip': return 'Skip';
			case 'home': return 'Home';
			case 'profile': return 'Profile';
			case 'failed_to_fetch': return ({required Object error}) => 'Failed to fetch data: ${error}';
			case 'something_went_wrong': return ({required Object error}) => 'Something went wrong: ${error}';
			case 'add_photo': return 'Add Photo';
			case 'limited_offer': return 'Limited Offer';
			case 'limited_offer_subtitle': return 'Select a token pack to earn bonuses and unlock new sections!';
			case 'bonus': return 'Available Bonuses';
			case 'premium_account': return 'Premium Account';
			case 'more_matches': return 'More Matches';
			case 'featured': return 'Featured';
			case 'more_likes': return 'More Likes';
			case 'unlock_features_title': return 'Choose a token pack to unlock features';
			case 'token': return 'Token';
			case 'weekly': return 'Weekly';
			case 'see_all_token_plans': return 'See All Token Plans';
			case 'logout': return 'Logout';
			case 'settings': return 'Settings';
			case 'select_language': return 'Select Language';
			case 'version': return ({required Object value}) => 'Version: ${value}';
			case 'no_internet_connection': return 'No Internet Connection';
			case 'validation.email_required': return 'Email is required';
			case 'validation.invalid_email': return 'Invalid email format';
			case 'validation.name_required': return 'Name is required';
			case 'validation.name_min_length': return 'Name must be at least 3 characters long';
			case 'validation.password_required': return 'Password is required';
			case 'validation.password_min_length': return 'Password must be at least 6 characters long';
			case 'validation.confirm_password_required': return 'Confirm Password is required';
			case 'validation.passwords_do_not_match': return 'Passwords do not match';
			case 'liked_movies': return 'My Likes';
			case 'gallery': return 'Gallery';
			case 'details': return 'Details';
			case 'director': return 'Director';
			case 'actors': return 'Actors';
			case 'genre': return 'Genre';
			case 'language': return 'Language';
			case 'writer': return 'Writer';
			case 'released': return 'Released';
			case 'type': return 'Type';
			case 'plot': return 'Plot';
			case 'no_liked_movies': return 'It seems that you have not liked any movies yet.';
			case 'coming_soon': return 'Coming Soon';
			case 'login_success': return 'Successfully logged in!';
			case 'token_not_found': return 'Token not found';
			case 'accept_terms': return 'You must accept the terms and conditions to proceed.';
			case 'registration_success': return 'Registration successful! ';
			default: return null;
		}
	}
}

