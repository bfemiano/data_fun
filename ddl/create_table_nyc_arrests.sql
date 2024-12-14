DROP TABLE IF EXISTS arrests_staging;
CREATE TABLE arrests_staging (
    arrest_key TEXT,
    arrest_date TEXT,
    pd_cd TEXT,
    pd_desc TEXT,
    ky_cd TEXT,
    ofns_desc TEXT,
    law_code TEXT,
    law_cat_cd TEXT,
    arrest_boro TEXT,
    arrest_precinct TEXT,
    jurisdiction_code TEXT,
    age_group TEXT,
    perp_sex TEXT,
    perp_race TEXT,
    x_coord_cd TEXT,
    y_coord_cd TEXT,
    latitude TEXT,
    longitude TEXT,
    lon_lat TEXT
);

DROP TABLE IF EXISTS arrests;
CREATE TABLE arrests (
    arrest_key TEXT,
    arrest_date TEXT,
    pd_cd NUMERIC,
    pd_desc TEXT,
    ky_cd NUMERIC,
    ofns_desc TEXT,
    law_code TEXT,
    law_cat_cd TEXT,
    arrest_boro TEXT,
    arrest_precinct NUMERIC,
    jurisdiction_code NUMERIC,
    age_group TEXT,
    perp_sex TEXT,
    perp_race TEXT,
    x_coord_cd TEXT,
    y_coord_cd TEXT,
    latitude NUMERIC,
    longitude NUMERIC,
    lon_lat POINT
);

CREATE INDEX arrests_lon_lat ON arrests USING gist (lon_lat);