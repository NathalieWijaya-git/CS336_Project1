/*-------------------------------------------------------------------------------------------------------------------------------
Tables for Respondent Information Section
-------------------------------------------------------------------------------------------------------------------------------*/
-- Create Agency table
DROP TABLE IF EXISTS agency_table CASCADE;
CREATE TABLE agency_table (
    agency_name TEXT,
    agency_abbr TEXT,
    agency_code INTEGER PRIMARY KEY
);

-- Create Edit Status table
DROP TABLE IF EXISTS edit_status_table CASCADE;
CREATE TABLE edit_status_table ( 
    edit_status_name TEXT,
    edit_status INTEGER PRIMARY KEY
);

-- Create Respondent Information Table
DROP TABLE IF EXISTS respondent_information_table CASCADE;
CREATE TABLE respondent_information_table (
    applicant_id INTEGER PRIMARY KEY,
    respondent_id TEXT,
    agency_code INTEGER,
    edit_status INTEGER,
    FOREIGN KEY (agency_code) REFERENCES agency_table(agency_code) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (edit_status) REFERENCES edit_status_table(edit_status) ON DELETE CASCADE ON UPDATE CASCADE
);
---------------------------------------------------------------------------------------------------------------------------------

/*-------------------------------------------------------------------------------------------------------------------------------
Tables for Loan Information Section
-------------------------------------------------------------------------------------------------------------------------------*/
-- Create Loan Type Table
DROP TABLE IF EXISTS loan_type_table CASCADE;
CREATE TABLE loan_type_table (
    loan_type_name TEXT,
    loan_type INTEGER PRIMARY KEY
);

-- Create Property Type Table
DROP TABLE IF EXISTS property_type_table CASCADE;
CREATE TABLE property_type_table (
    property_type_name TEXT,
    property_type INTEGER PRIMARY KEY
);

-- Create Loan Purpose Table
DROP TABLE IF EXISTS loan_purpose_table CASCADE;
CREATE TABLE loan_purpose_table (
    loan_purpose_name TEXT,
    loan_purpose INTEGER PRIMARY KEY
);

-- Create Owner Occupancy Table
DROP TABLE IF EXISTS owner_occupancy_table CASCADE;
CREATE TABLE owner_occupancy_table (
    owner_occupancy_name TEXT,
    owner_occupancy INTEGER PRIMARY KEY
);

-- Create Preapproval Table
DROP TABLE IF EXISTS preapproval_table CASCADE;
CREATE TABLE preapproval_table (
    preapproval_name TEXT,
    preapproval INTEGER PRIMARY KEY
);

-- Create Action Taken Table
DROP TABLE IF EXISTS action_taken_table CASCADE;
CREATE TABLE action_taken_table (
    action_taken_name TEXT,
    action_taken INTEGER PRIMARY KEY
);

-- Create Purchaser Type Table
DROP TABLE IF EXISTS purchaser_type_table CASCADE;
CREATE TABLE purchaser_type_table (
    purchaser_type_name TEXT,
    purchaser_type INTEGER PRIMARY KEY
);

-- Create Denial Reason Table
DROP TABLE IF EXISTS denial_reason_table CASCADE;
CREATE TABLE denial_reason_table (
    denial_reason_name TEXT,
    denial_reason INTEGER PRIMARY KEY
);

-- Create Loan Information Table
DROP TABLE IF EXISTS loan_information_table CASCADE;
CREATE TABLE loan_information_table (
    applicant_id INTEGER PRIMARY KEY,
    sequence_number INTEGER,
    loan_type INTEGER,
    property_type INTEGER,
    loan_purpose INTEGER,
    owner_occupancy INTEGER,
    loan_amount_000s INTEGER,
    preapproval INTEGER,
    action_taken INTEGER,
    purchaser_type INTEGER,
    rate_spread NUMERIC(10,5),
    FOREIGN KEY (loan_type) REFERENCES loan_type_table(loan_type) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (property_type) REFERENCES property_type_table(property_type) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (loan_purpose) REFERENCES loan_purpose_table(loan_purpose) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (owner_occupancy) REFERENCES owner_occupancy_table(owner_occupancy) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (preapproval) REFERENCES preapproval_table(preapproval) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (action_taken) REFERENCES action_taken_table(action_taken) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (purchaser_type) REFERENCES purchaser_type_table(purchaser_type) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create Denial Reason Table
DROP TABLE IF EXISTS denial_reason_number_table CASCADE;
CREATE TABLE denial_reason_number_table (
    applicant_id INTEGER,
    denial_reason INTEGER,
    denial_reason_number INTEGER, -- Denial reason column 1, 2, 3
    PRIMARY KEY (applicant_id, denial_reason),
    FOREIGN KEY (applicant_id) REFERENCES loan_information_table(applicant_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (denial_reason) REFERENCES denial_reason_table(denial_reason) ON DELETE CASCADE ON UPDATE CASCADE
);
---------------------------------------------------------------------------------------------------------------------------------

/*-------------------------------------------------------------------------------------------------------------------------------
Tables for Property Location Section
-------------------------------------------------------------------------------------------------------------------------------*/
-- Create MSA/MD Table
DROP TABLE IF EXISTS msamd_table CASCADE;
CREATE TABLE msamd_table (
    msamd_name TEXT,
    msamd TEXT PRIMARY KEY
);

-- Create State Table
DROP TABLE IF EXISTS state_table CASCADE;
CREATE TABLE state_table (
    state_name TEXT,
    state_abbr TEXT,
    state_code INTEGER PRIMARY KEY
);

-- Create County Table
DROP TABLE IF EXISTS county_table CASCADE; 
CREATE TABLE county_table (
    county_name TEXT,
    county_code TEXT PRIMARY KEY
);

-- Create Property Location Table
DROP TABLE IF EXISTS property_location_table CASCADE;
CREATE TABLE property_location_table (
    msamd TEXT,
    state_code INTEGER,
    county_code TEXT,
    census_tract_number NUMERIC(10, 2),
    population_number INTEGER,
    minority_population NUMERIC(10,5),
    hud_median_family_income INTEGER,
    tract_to_msamd_income NUMERIC (10,5),
    number_of_owner_occupied_units INTEGER,
    number_of_1_to_4_family_units INTEGER,
    FOREIGN KEY (msamd) REFERENCES msamd_table(msamd) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (state_code) REFERENCES state_table(state_code) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (county_code) REFERENCES county_table(county_code) ON DELETE CASCADE ON UPDATE CASCADE
);
---------------------------------------------------------------------------------------------------------------------------------

/*-------------------------------------------------------------------------------------------------------------------------------
Tables for Applicant Information Section
-------------------------------------------------------------------------------------------------------------------------------*/
-- Create Ethnicity Table
DROP TABLE IF EXISTS ethnicity_table CASCADE;
CREATE TABLE ethnicity_table (
    ethnicity_name TEXT,
    ethnicity_number INTEGER PRIMARY KEY
);

-- Create Race Table
DROP TABLE IF EXISTS race_table CASCADE;
CREATE TABLE race_table (
    race_name TEXT,
    race_id INTEGER PRIMARY KEY
);

-- Create Sex Table
DROP TABLE IF EXISTS sex_table CASCADE;
CREATE TABLE sex_table (
    sex_name TEXT,
    sex_number INTEGER PRIMARY KEY
);

-- Create HOEPA Table
DROP TABLE IF EXISTS hoepa_table CASCADE;
CREATE TABLE hoepa_table (
    hoepa_status_name TEXT,
    hoepa_status INTEGER PRIMARY KEY
);

-- Create Lien Status Table
DROP TABLE IF EXISTS lien_status_table CASCADE;
CREATE TABLE lien_status_table (
    lien_status_name TEXT,
    lien_status INTEGER PRIMARY KEY
);

-- Create Application Date Indicator Table
DROP TABLE IF EXISTS application_date_indicator_table CASCADE;
CREATE TABLE application_date_indicator_table (
    application_date_indicator INTEGER PRIMARY KEY,
    indicator_description TEXT
);

-- Create Applicant Information Table
DROP TABLE IF EXISTS applicant_information_table CASCADE;
CREATE TABLE applicant_information_table (
    applicant_id INTEGER PRIMARY KEY,
    as_of_year INTEGER,
    applicant_ethnicity INTEGER,
    co_applicant_ethnicity INTEGER,
    applicant_sex INTEGER, 
    co_applicant_sex INTEGER,
    applicant_income_000s INTEGER,
    hoepa_status INTEGER,
    lien_status INTEGER,
    application_date_indicator INTEGER,
    FOREIGN KEY (applicant_ethnicity) REFERENCES ethnicity_table(ethnicity_number) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (co_applicant_ethnicity) REFERENCES ethnicity_table(ethnicity_number) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (applicant_sex) REFERENCES sex_table(sex_number) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (co_applicant_sex) REFERENCES sex_table(sex_number) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (hoepa_status) REFERENCES hoepa_table(hoepa_status) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (lien_status) REFERENCES lien_status_table(lien_status) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (application_date_indicator) REFERENCES application_date_indicator_table(application_date_indicator) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create Applicant Race Table
DROP TABLE IF EXISTS applicant_race_table CASCADE;
CREATE TABLE applicant_race_table (
    applicant_id INTEGER,
    race_id INTEGER,
    race_number INTEGER, -- Race column 1, 2, 3, 4, 5
    PRIMARY KEY (applicant_id, race_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant_information_table(applicant_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (race_id) REFERENCES race_table(race_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create Co-Applicant Race Table
DROP TABLE IF EXISTS co_applicant_race_table CASCADE;
CREATE TABLE co_applicant_race_table (
    applicant_id INTEGER,
    race_id INTEGER,
    race_number INTEGER, -- Race column 1, 2, 3, 4, 5
    PRIMARY KEY (applicant_id, race_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant_information_table(applicant_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (race_id) REFERENCES race_table(race_id) ON DELETE CASCADE ON UPDATE CASCADE
);
-------------------------------------------------------------------------------------------------------------------------------

/*-----------------------------------------------------------------------------------------------------------------------------
Insert Statements for Agency Information Section
-----------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO agency_table (agency_name, agency_abbr, agency_code)
VALUES 
    ('Office of the Comptroller of the Currency', 'OCC', 1),
    ('Federal Reserve System', 'FRS', 2),
    ('Federal Deposit Insurance Corporation', 'FDIC', 3),
    ('National Credit Union Administration', 'NCUA', 5),
    ('Department of Housing and Urban Development', 'HUD', 7),
    ('Consumer Financial Protection Bureau', 'CFPB', 9);

INSERT INTO edit_status_table (edit_status_name, edit_status)
VALUES
    ('Validity edit failure only', 5),
    ('Quality edit failure only', 6),
    ('Validity and quality edit failures', 7);

INSERT INTO respondent_information_table (applicant_id, respondent_id, agency_code, edit_status)
SELECT applicant_id, respondent_id, agency_code, edit_status
FROM preliminary;
-------------------------------------------------------------------------------------------------------------------------------
/*-----------------------------------------------------------------------------------------------------------------------------
Insert Statements for Loan Information Table
-----------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO loan_type_table(loan_type_name, loan_type) 
VALUES
    ('Conventional', 1),
    ('FHA-insured', 2),
    ('VA-guaranteed', 3),
    ('FSA/RHS-guaranteed', 4);

INSERT INTO property_type_table(property_type_name, property_type) 
VALUES
    ('One to four-family (other than manufactured housing)', 1),
    ('Manufactured housing', 2),
    ('Multifamily', 3);

INSERT INTO loan_purpose_table(loan_purpose_name, loan_purpose) 
VALUES
    ('Home purchase', 1),
    ('Home improvement', 2),
    ('Refinancing', 3);

INSERT INTO owner_occupancy_table(owner_occupancy_name, owner_occupancy) 
VALUES
    ('Owner-occupied as a principal dwelling', 1),
    ('Not owner occupied as a principal dwelling', 2),
    ('Not applicable', 3);

INSERT INTO preapproval_table(preapproval_name, preapproval) 
VALUES
    ('Preapproval was requested', 1),
    ('Preapproval was not requested', 2),
    ('Not applicable', 3);

INSERT INTO action_taken_table(action_taken_name, action_taken) 
VALUES
    ('Loan originated', 1),
    ('Application approved but not accepted', 2),
    ('Application denied by financial institution', 3),
    ('Application withdrawn by applicant', 4),
    ('File closed for incompleteness', 5),
    ('Loan purchased by the institution', 6),
    ('Preapproval request denied by financial institution', 7),
    ('Preapproval request approved but not accepted (optional reporting)', 8); 

INSERT INTO purchaser_type_table(purchaser_type_name, purchaser_type) 
VALUES
    ('Loan was not originated or was not sold in calendar year covered by register', 0),
    ('Fannie Mae (FNMA)', 1),
    ('Ginnie Mae (GNMA)', 2),
    ('Freddie Mac (FHLMC)', 3),
    ('Farmer Mac (FAMC)', 4),
    ('Private securitization', 5),
    ('Commercial bank, savings bank or savings association', 6),
    ('Life insurance company, credit union, mortgage bank, or finance company', 7),
    ('Affiliate institution', 8),
    ('Other type of purchaser', 9);

INSERT INTO loan_information_table (applicant_id, sequence_number, loan_type, property_type, loan_purpose, owner_occupancy, loan_amount_000s, preapproval, action_taken, purchaser_type, rate_spread)
SELECT applicant_id, sequence_number, loan_type, property_type, loan_purpose, owner_occupancy, loan_amount_000s, preapproval, action_taken, purchaser_type, rate_spread
FROM preliminary;

INSERT INTO denial_reason_table(denial_reason_name, denial_reason) 
VALUES
    ('Debt-to-income ratio', 1),
    ('Employment history', 2),
    ('Credit history', 3),
    ('Collateral', 4),
    ('Insufficient cash (downpayment, closing costs)', 5),
    ('Unverifiable information', 6),
    ('Credit application incomplete', 7),
    ('Mortgage insurance denied', 8),
    ('Other', 9);

INSERT INTO denial_reason_number_table (applicant_id, denial_reason, denial_reason_number)
SELECT applicant_id, denial_reason_1, 1
FROM preliminary
WHERE denial_reason_1 IS NOT NULL;

INSERT INTO denial_reason_number_table (applicant_id, denial_reason, denial_reason_number)
SELECT applicant_id, denial_reason_2, 2
FROM preliminary
WHERE denial_reason_2 IS NOT NULL;

INSERT INTO denial_reason_number_table (applicant_id, denial_reason, denial_reason_number)
SELECT applicant_id, denial_reason_3, 3
FROM preliminary
WHERE denial_reason_3 IS NOT NULL;
-------------------------------------------------------------------------------------------------------------------------------
/*-----------------------------------------------------------------------------------------------------------------------------
Insert Statements for Property Location Tables
-----------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO msamd_table (msamd_name, msamd)
SELECT DISTINCT msamd_name, msamd
FROM preliminary
WHERE msamd IS NOT NULL;

INSERT INTO state_table (state_name, state_abbr, state_code)
SELECT DISTINCT state_name, state_abbr, state_code
FROM preliminary
WHERE state_code IS NOT NULL;

INSERT INTO county_table (county_name, county_code)
SELECT DISTINCT county_name, county_code
FROM preliminary
WHERE county_code IS NOT NULL;

-- Add property_location_id to property_location_table
ALTER TABLE property_location_table
ADD COLUMN property_location_id SERIAL;

-- Set property_location_id to be the primary key of property_location_table
ALTER TABLE property_location_table
ADD CONSTRAINT pk_property_location_id PRIMARY KEY (property_location_id);

INSERT INTO property_location_table (msamd, state_code, county_code, census_tract_number, population_number, minority_population, hud_median_family_income, tract_to_msamd_income, number_of_owner_occupied_units, number_of_1_to_4_family_units)
SELECT DISTINCT msamd, state_code, county_code, census_tract_number, population_number, minority_population, hud_median_family_income, tract_to_msamd_income, number_of_owner_occupied_units, number_of_1_to_4_family_units
FROM preliminary;
-------------------------------------------------------------------------------------------------------------------------------
/*-----------------------------------------------------------------------------------------------------------------------------
Insert Statements for Applicant Information Table
-----------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO ethnicity_table (ethnicity_name, ethnicity_number)
VALUES
    ('Hispanic or Latino', 1),
    ('Not Hispanic or Latino', 2),
    ('Information not provided by applicant in mail, Internet, or telephone application', 3),
    ('Not applicable', 4),
    ('No co-applicant', 5);

INSERT INTO race_table (race_name, race_id)
VALUES
    ('American Indian or Alaska Native', 1),
    ('Asian', 2),
    ('Black or African American', 3),
    ('Native Hawaiian or Other Pacific Islander', 4),
    ('White', 5),
    ('Information not provided by applicant in mail, Internet, or telephone application', 6),
    ('Not applicable', 7),
    ('No co-applicant', 8);

INSERT INTO sex_table (sex_name, sex_number)
VALUES
    ('Male', 1),
    ('Female', 2),
    ('Information not provided by applicant in mail, Internet, or telephone application', 3),
    ('Not applicable', 4),
    ('No co-applicant', 5);

INSERT INTO hoepa_table (hoepa_status_name, hoepa_status)
VALUES
    ('HOEPA loan', 1),
    ('Not a HOEPA loan', 2);

INSERT INTO lien_status_table (lien_status_name, lien_status)
VALUES
    ('Secured by a first lien', 1),
    ('Secured by a subordinate lien', 2),
    ('Not secured by a lien', 3),
    ('Not applicable (purchased loans)', 4);

INSERT INTO application_date_indicator_table (application_date_indicator, indicator_description)
VALUES
    (0, 'Application Date >= 01-01-2004'),
    (1, 'Application Date < 01-01-2004'),
    (2, 'Application Date = NA');

INSERT INTO applicant_information_table (applicant_id, as_of_year, applicant_ethnicity, co_applicant_ethnicity, applicant_sex, co_applicant_sex, applicant_income_000s, hoepa_status, lien_status, application_date_indicator)
SELECT 
    applicant_id, 
    as_of_year,
    applicant_ethnicity, 
    co_applicant_ethnicity,
    applicant_sex, 
    co_applicant_sex,
    applicant_income_000s, 
    hoepa_status, 
    lien_status, 
    application_date_indicator
FROM preliminary;
-- Add property_location_id to applicant_information_table as a foreign key
ALTER TABLE applicant_information_table
ADD COLUMN property_location_id INTEGER,
ADD CONSTRAINT fk_property_location_table
FOREIGN KEY (property_location_id)
REFERENCES property_location_table(property_location_id);

-- Add property_location_concat to applicant_information_table
ALTER TABLE applicant_information_table
ADD COLUMN property_location_concat TEXT;

-- property_location_concat in applicant_information_table is a string literal of all columns in property_location_table
UPDATE applicant_information_table ait
SET property_location_concat = CONCAT(msamd, '|', state_code, '|', county_code, '|', census_tract_number, '|', population_number, '|', minority_population, '|', hud_median_family_income, '|', tract_to_msamd_income, '|', number_of_owner_occupied_units, '|', number_of_1_to_4_family_units)
FROM preliminary p
WHERE ait.applicant_id = p.applicant_id;

-- Add property_location_concat to property_location_table
ALTER TABLE property_location_table
ADD COLUMN property_location_concat TEXT;

-- property_location_concat in property_location_table is a string literal of all columns in property_location_table
UPDATE property_location_table
SET property_location_concat = CONCAT(msamd, '|', state_code, '|', county_code, '|', census_tract_number, '|', population_number, '|', minority_population, '|', hud_median_family_income, '|', tract_to_msamd_income, '|', number_of_owner_occupied_units, '|', number_of_1_to_4_family_units);

-- property_location_concat will map property_location_table to applicant_information_table
UPDATE applicant_information_table ait
SET property_location_id = plt.property_location_id
FROM property_location_table plt
WHERE ait.property_location_concat = plt.property_location_concat;

-- Drop property_location_concat from applicant_information_table and property_information_table
ALTER TABLE applicant_information_table DROP COLUMN property_location_concat;
ALTER TABLE property_location_table DROP COLUMN property_location_concat;

INSERT INTO applicant_race_table (applicant_id, race_id, race_number)
SELECT applicant_id, applicant_race_1, 1
FROM preliminary
WHERE applicant_race_1 IS NOT NULL;

INSERT INTO applicant_race_table (applicant_id, race_id, race_number)
SELECT applicant_id, applicant_race_2, 2
FROM preliminary
WHERE applicant_race_2 IS NOT NULL;

INSERT INTO applicant_race_table (applicant_id, race_id, race_number)
SELECT applicant_id, applicant_race_3, 3
FROM preliminary
WHERE applicant_race_3 IS NOT NULL;

INSERT INTO applicant_race_table (applicant_id, race_id, race_number)
SELECT applicant_id, applicant_race_4, 4
FROM preliminary
WHERE applicant_race_4 IS NOT NULL;

INSERT INTO applicant_race_table (applicant_id, race_id, race_number)
SELECT applicant_id, applicant_race_5, 5
FROM preliminary
WHERE applicant_race_5 IS NOT NULL;

INSERT INTO co_applicant_race_table (applicant_id, race_id, race_number)
SELECT applicant_id, co_applicant_race_1, 1
FROM preliminary
WHERE co_applicant_race_1 IS NOT NULL;

INSERT INTO co_applicant_race_table (applicant_id, race_id, race_number)
SELECT applicant_id, co_applicant_race_2, 2
FROM preliminary
WHERE co_applicant_race_2 IS NOT NULL;

INSERT INTO co_applicant_race_table (applicant_id, race_id, race_number)
SELECT applicant_id, co_applicant_race_3, 3
FROM preliminary
WHERE co_applicant_race_3 IS NOT NULL;

INSERT INTO co_applicant_race_table (applicant_id, race_id, race_number)
SELECT applicant_id, co_applicant_race_4, 4
FROM preliminary
WHERE co_applicant_race_4 IS NOT NULL;

INSERT INTO co_applicant_race_table (applicant_id, race_id, race_number)
SELECT applicant_id, co_applicant_race_5, 5
FROM preliminary
WHERE co_applicant_race_5 IS NOT NULL;
-------------------------------------------------------------------------------------------------------------------------------