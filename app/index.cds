using MainService from '../srv/service';

////////////////////////////////////////////////////////////////////////////
//
//	Books Object Page
//
annotate MainService.Books with @(
	UI: {
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}', Target: '@UI.FieldGroup#Details'}
		],
		FieldGroup#General: {
			Data: [
				{Value: title},
				{Value: author_ID},
			]
		},
		FieldGroup#Details: {
			Data: [
				{Value: price},
				{Value: currency_code, Label: '{i18n>Currency}'},
			]
		}
	}
);


// 2) fiori annotations common to all apps...
using my.bookshop as my from '../db/schema';


////////////////////////////////////////////////////////////////////////////
//
//	Books Lists
//
annotate my.Books with @(
	UI: {
		Identification: [{Value:title}],
	  SelectionFields: [ ID, author.name, price, currency_code ],
		LineItem: [
			{Value: ID},
			{Value: title},
			{$Type:'UI.DataFieldWithNavigationPath', Value: author.name, Label:'{i18n>Author}', Target:'author'},
			// {$Type:'UI.DataFieldWithNavigationPath', Value: author_ID, Label:'{i18n>AuthorID}', Target:'author'},
			{Value: author_ID, Label:'{i18n>AuthorID}'},
			{Value: price},
			{Value: currency.symbol, Label:''},
		]
	},
);

////////////////////////////////////////////////////////////////////////////
//
//	Books Details
//
annotate my.Books with @(
	UI: {
  	HeaderInfo: {
  		TypeName: '{i18n>Book}',
  		TypeNamePlural: '{i18n>Books}',
  		Title: {Value: title},
  		Description: {Value: author.name}
  	},
	}
);



////////////////////////////////////////////////////////////////////////////
//
//	Books Elements
//
annotate my.Books with {
	ID @title:'{i18n>ID}' @UI.HiddenFilter;
	title @title:'{i18n>Title}';
	author @title:'{i18n>AuthorID}';
	price @title:'{i18n>Price}';
	stock @title:'{i18n>Stock}';
}

annotate my.Authors with {
	name @title:'{i18n>AuthorName}';
}
