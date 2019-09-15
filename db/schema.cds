namespace my.bookshop;
using Currency from '@sap/cds/common';

entity Books {
  key ID : Integer;
  title  : localized String(111);
  author : Association to Authors;
  price  : Decimal(9,2);
  currency : Currency;
}

entity Authors {
  key ID : Integer;
  name   : String(111);
  books  : Association to many Books on books.author = $self;
}

