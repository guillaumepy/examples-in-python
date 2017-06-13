 COPY (SELECT
  CONCAT(ht."Major", ht."Minor") as "id"
  , hl."Address"
  , ht."ApprLandVal" + ht."ApprImpsVal" as "AppraisedValue"
  , ht."TaxableLandVal" + ht."TaxableImpsVal" as "TaxableValue"
  , hp."SqFtLot"
  , hp."WaterSystem"
  , hp."SewerSystem"
  , hp."Access"
  , hp."Topography"
  , hp."StreetSurface"
  , hp."RestrictiveSzShape"
  , hp."InadequateParking"
  , hp."PcntUnusable"
  , hp."MtRainier"
  , hp."Olympics"
  , hp."Cascades"
  , hp."Territorial"
  , hp."SeattleSkyline"
  , hp."PugetSound"
  , hp."LakeWashington"
  , hp."LakeSammamish"
  , hp."SmallLakeRiverCreek"
  , hp."OtherView"
  , hp."WfntLocation"
  , hp."WfntFootage"
  , hp."WfntBank"
  , hp."WfntPoorQuality"
  , hp."WfntRestrictedAccess"
  , hp."WfntAccessRights"
  , hp."WfntProximityInfluence"
  , hp."TidelandShoreland"
  , hp."LotDepthFactor"
  , hp."TrafficNoise"
  , hp."AirportNoise"
  , hp."PowerLines"
  , hp."OtherNuisances"
  , hp."NbrBldgSites"
  , hp."Contamination"
  , hp."DNRLease"
  , hp."AdjacentGolfFairway"
  , hp."AdjacentGreenbelt"
  , hp."CommonProperty"
  , hp."HistoricSite"
  , hp."CurrentUseDesignation"
  , hp."NativeGrowthProtEsmt"
  , hp."Easements"
  , hp."OtherDesignation"
  , hp."DeedRestrictions"
  , hp."DevelopmentRightsPurch"
  , hp."CoalMineHazard"
  , hp."CriticalDrainage"
  , hp."ErosionHazard"
  , hp."LandfillBuffer"
  , hp."HundredYrFloodPlain"
  , hp."SeismicHazard"
  , hp."LandslideHazard"
  , hp."SteepSlopeHazard"
  , hp."Stream"
  , hp."Wetland"
  , hp."SpeciesOfConcern"
  , hp."SensitiveAreaTract"
  , hp."WaterProblems"
  , hp."TranspConcurrency"
  , hp."OtherProblems"
  FROM house_taxes_tmp ht
  JOIN house_parcel_tmp hp USING ("Major", "Minor")
  JOIN house_location_tmp hl USING ("Major", "Minor")
  WHERE hp."PropType" = 'R')
TO '/tmp/king_county_data.csv' 
WITH  DELIMITER ','
CSV HEADER;
