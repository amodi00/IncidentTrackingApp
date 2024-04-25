using { MyIncidentAppSrv } from '../srv/service.cds';

annotate MyIncidentAppSrv.Incidents with @UI.DataPoint #Title: {
  Value: Title,
  Title: 'Title',
};
annotate MyIncidentAppSrv.Incidents with @UI.DataPoint #Status: {
  Value: Status,
  Title: 'Status',
};
annotate MyIncidentAppSrv.Incidents with @UI.DataPoint #Priority: {
  Value: Priority,
  Title: 'Priority',
};
annotate MyIncidentAppSrv.Incidents with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#Title', ID: 'Title' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#Status', ID: 'Status' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#Priority', ID: 'Priority' }
];
annotate MyIncidentAppSrv.Incidents with @UI.HeaderInfo: {
  TypeName: 'Incident',
  TypeNamePlural: 'Incidents',
  Title: { Value: incidentsID }
};
annotate MyIncidentAppSrv.Incidents with {
  ID @UI.Hidden
};
annotate MyIncidentAppSrv.Incidents with @UI.Identification: [{ Value: incidentsID }];
annotate MyIncidentAppSrv.Incidents with {
  incidentsID @Common.Label: 'ID';
  Title @Common.Label: 'Title';
  Description @Common.Label: 'Description';
  Status @Common.Label: 'Status';
  Priority @Common.Label: 'Priority';
  Date @Common.Label: 'Date';
  ReplacementItems @Common.Label: 'Replacement Items'
};
annotate MyIncidentAppSrv.Incidents with {
  ID @Common.Text: { $value: incidentsID, ![@UI.TextArrangement]: #TextOnly };
};
annotate MyIncidentAppSrv.Incidents with @UI.SelectionFields: [
  incidentsID
];
annotate MyIncidentAppSrv.Incidents with @UI.LineItem #incidentsTable: [
    { $Type: 'UI.DataField', Value: incidentsID },
    { $Type: 'UI.DataField', Value: Title },
    { $Type: 'UI.DataField', Value: Description },
    { $Type: 'UI.DataField', Value: Status },
    { $Type: 'UI.DataField', Value: Priority },
    { $Type: 'UI.DataField', Value: Date }
];
annotate MyIncidentAppSrv.Incidents with @UI.SelectionPresentationVariant #incidentsTable: {
  Text : 'Incidents',
  SelectionVariant : {
    SelectOptions : []
  },
  PresentationVariant : {
    Visualizations : ['@UI.LineItem#incidentsTable']
  }
};
annotate MyIncidentAppSrv.Incidents with @UI.LineItem #replacementItemsTable: [
    { $Type: 'UI.DataField', Value: ReplacementItems.replacementItemsID },
    { $Type: 'UI.DataField', Value: ReplacementItems.Quantity }
];
annotate MyIncidentAppSrv.Incidents with @UI.SelectionPresentationVariant #replacementItemsTable: {
  Text : 'Replacement Items',
  SelectionVariant : {
    SelectOptions : []
  },
  PresentationVariant : {
    Visualizations : ['@UI.LineItem#replacementItemsTable']
  }
};
annotate MyIncidentAppSrv.Incidents with @UI.FieldGroup #incidentDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: incidentsID },
    { $Type: 'UI.DataField', Value: Title },
    { $Type: 'UI.DataField', Value: Description },
    { $Type: 'UI.DataField', Value: Status },
    { $Type: 'UI.DataField', Value: Priority },
    { $Type: 'UI.DataField', Value: Date }

  ]
};


annotate MyIncidentAppSrv.ReplacementItems with @UI.LineItem #replacementItems: [
    { $Type: 'UI.DataField', Value: replacementItemsID },
    { $Type: 'UI.DataField', Value: Quantity }

  ];


annotate MyIncidentAppSrv.Incidents with @UI.Facets: [
  {
    $Type: 'UI.CollectionFacet',
    ID: 'incidentTab',
    Label: 'Incident',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'incidentDetails', Label: 'Incident Details', Target: '@UI.FieldGroup#incidentDetails' } ]
  },
  {
    $Type: 'UI.CollectionFacet',
    ID: 'replacementItemsTab',
    Label: 'Replacement Items',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'replacementItems', Label: 'Replacement Items', Target: 'ReplacementItems/@UI.LineItem#replacementItems' } ]
  }
];
annotate MyIncidentAppSrv.ReplacementItems with {
  Product @Common.ValueList: {
    CollectionPath: 'Products',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: Product_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productsID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Price'
      },
    ],
  }
};
annotate MyIncidentAppSrv.ReplacementItems with {
  incidents @Common.ValueList: {
    CollectionPath: 'Incidents',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: incidents_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'incidentsID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Status'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Priority'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Date'
      },
    ],
  }
};
annotate MyIncidentAppSrv.ReplacementItems with @UI.DataPoint #Quantity: {
  Value: Quantity,
  Title: 'Quantity',
};
annotate MyIncidentAppSrv.ReplacementItems with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#Quantity', ID: 'Quantity' }
];
annotate MyIncidentAppSrv.ReplacementItems with @UI.HeaderInfo: {
  TypeName: 'Replacement Item',
  TypeNamePlural: 'Replacement Items',
  Title: { Value: replacementItemsID }
};
annotate MyIncidentAppSrv.ReplacementItems with {
  ID @UI.Hidden
};
annotate MyIncidentAppSrv.ReplacementItems with @UI.Identification: [{ Value: replacementItemsID }];
annotate MyIncidentAppSrv.ReplacementItems with {
  replacementItemsID @Common.Label: 'ID';
  Quantity @Common.Label: 'Quantity';
  Product @Common.Label: 'Product';
  incidents @Common.Label: 'Incident'
};
annotate MyIncidentAppSrv.ReplacementItems with {
  ID @Common.Text: { $value: replacementItemsID, ![@UI.TextArrangement]: #TextOnly };
  Product @Common.Text: { $value: Product.productsID, ![@UI.TextArrangement]: #TextOnly };
  incidents @Common.Text: { $value: incidents.incidentsID, ![@UI.TextArrangement]: #TextOnly };
};
annotate MyIncidentAppSrv.ReplacementItems with @UI.SelectionFields: [
  Product_ID,
  incidents_ID
];
annotate MyIncidentAppSrv.ReplacementItems with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: replacementItemsID },
    { $Type: 'UI.DataField', Value: Quantity },
    { $Type: 'UI.DataField', Label: 'Product', Value: Product_ID },
    { $Type: 'UI.DataField', Label: 'Incident', Value: incidents_ID }
];
annotate MyIncidentAppSrv.ReplacementItems with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: replacementItemsID },
    { $Type: 'UI.DataField', Value: Quantity },
    { $Type: 'UI.DataField', Label: 'Product', Value: Product_ID },
    { $Type: 'UI.DataField', Label: 'Incident', Value: incidents_ID }
]};
annotate MyIncidentAppSrv.ReplacementItems with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];
annotate MyIncidentAppSrv.Products with @UI.DataPoint #Name: {
  Value: Name,
  Title: 'Name',
};
annotate MyIncidentAppSrv.Products with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#Name', ID: 'Name' }
];
annotate MyIncidentAppSrv.Products with @UI.HeaderInfo: {
  TypeName: 'Product',
  TypeNamePlural: 'Products',
  Title: { Value: productsID }
};
annotate MyIncidentAppSrv.Products with {
  ID @UI.Hidden
};
annotate MyIncidentAppSrv.Products with @UI.Identification: [{ Value: productsID }];
annotate MyIncidentAppSrv.Products with {
  productsID @Common.Label: 'ID';
  Name @Common.Label: 'Name';
  Description @Common.Label: 'Description';
  Price @Common.Label: 'Price'
};
annotate MyIncidentAppSrv.Products with {
  ID @Common.Text: { $value: productsID, ![@UI.TextArrangement]: #TextOnly };
};
annotate MyIncidentAppSrv.Products with @UI.SelectionFields: [
  productsID
];
annotate MyIncidentAppSrv.Products with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: productsID },
    { $Type: 'UI.DataField', Value: Name },
    { $Type: 'UI.DataField', Value: Description },
    { $Type: 'UI.DataField', Value: Price }
];
annotate MyIncidentAppSrv.Products with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: productsID },
    { $Type: 'UI.DataField', Value: Name },
    { $Type: 'UI.DataField', Value: Description },
    { $Type: 'UI.DataField', Value: Price }
]};
annotate MyIncidentAppSrv.Products with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];