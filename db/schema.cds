namespace MyIncidentApp;

entity Incidents {
  key ID: UUID;
  incidentsID: String(50) @assert.unique @mandatory;
  Title: String(50);
  Description: String;
  Status: String(20);
  Priority: String(20);
  Date: Date;
  ReplacementItems: Association to many ReplacementItems on ReplacementItems.incidents = $self;
}

entity ReplacementItems {
  key ID: UUID;
  replacementItemsID: String(50) @assert.unique @mandatory;
  Quantity: Integer;
  Product: Association to Products;
  incidents: Association to Incidents;
}

entity Products {
  key ID: UUID;
  productsID: String(50) @assert.unique @mandatory;
  Name: String(50);
  Description: String;
  Price: Decimal;
}
