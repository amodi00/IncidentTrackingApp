using { MyIncidentApp } from '../db/schema.cds';

service MyIncidentAppSrv {
  @odata.draft.enabled
  entity Incidents as projection on MyIncidentApp.Incidents;
  @odata.draft.enabled
  entity ReplacementItems as projection on MyIncidentApp.ReplacementItems;
  @odata.draft.enabled
  entity Products as projection on MyIncidentApp.Products;
}