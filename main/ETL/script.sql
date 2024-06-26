WITH icu_patients_ingredients AS (
    SELECT 
        ip.subject_id,
        ip.hadm_id,
        ip.stay_id,
        ip.gender,
        ip.deathtime,
        ip.anchor_age,
        ip.pesoadm,
        ip.altura,
        ip.pesoadm / ((ip.altura / 100) * (ip.altura / 100)) AS imc,
        CASE
            WHEN EXTRACT(MINUTE FROM (ip.intime - ip.outtime)) > 30 THEN EXTRACT(HOUR FROM (ip.intime - ip.outtime)) + 1 
            ELSE EXTRACT(HOUR FROM (ip.intime - ip.outtime))
        END AS time_to_leave_icu,
        CASE
            WHEN EXTRACT(MINUTE FROM (ie.starttime - ip.intime)) > 30 THEN EXTRACT(HOUR FROM (ie.starttime - ip.intime)) + 1 
            ELSE EXTRACT(HOUR FROM (ie.starttime - ip.intime))
        END AS time_to_first_nutrition
    FROM `doutorado-398920.UTI.ICUpatients5` ip
    INNER JOIN `doutorado-398920.UTI.ICUp5ingredientevents` ie
    ON ip.subject_id = ie.subject_id
)

SELECT 
    subject_id, 
    hadm_id, 
    stay_id, 
    gender,
    CASE WHEN deathtime IS NULL THEN false ELSE true END AS is_dead,
    CASE 
        WHEN anchor_age < 18 THEN 0
        WHEN anchor_age >= 18 AND anchor_age < 50 THEN 1
        WHEN anchor_age >= 50 AND anchor_age < 60 THEN 2
        WHEN anchor_age >= 60 AND anchor_age < 70 THEN 3
        WHEN anchor_age >= 70 AND anchor_age < 80 THEN 4
        WHEN anchor_age >= 80 THEN 5
    END AS age_group,
    CASE
        WHEN pesoadm < 30 THEN 0
        WHEN pesoadm >= 30 AND pesoadm < 50 THEN 1
        WHEN pesoadm >= 50 AND pesoadm < 100 THEN 2
        WHEN pesoadm >= 100 AND pesoadm < 200 THEN 3
        WHEN pesoadm >= 200 THEN 4
    END AS weight_group,
    CASE
        WHEN altura < 50 THEN 0
        WHEN altura >= 50 AND altura < 100 THEN 1
        WHEN altura >= 100 AND altura < 200 THEN 2
        WHEN altura >= 200 THEN 3
    END AS height_group,
    CASE 
        WHEN imc < 18.5 THEN 1
        WHEN imc >= 18.5 AND imc < 25 THEN 2
        WHEN imc >= 25 AND imc < 30 THEN 3
        WHEN imc >= 30 AND imc < 35 THEN 4
        WHEN imc >= 35 AND imc < 40 THEN 5
        WHEN imc >= 40 THEN 6
    END AS imc_group,
    CASE
        WHEN MOD(time_to_first_nutrition, 24) >= 6 THEN 
            CAST(time_to_first_nutrition/24 + 1 AS INT64)
        ELSE
            CAST(time_to_first_nutrition/24 AS INT64)
    END AS days_to_first_nutrition,
    CASE
        WHEN time_to_leave_icu < 15 THEN 1
        WHEN time_to_leave_icu >= 15 AND time_to_leave_icu < 30 THEN 2
        WHEN time_to_leave_icu >= 30 THEN 3
    END AS time_to_leave_icu_group

FROM icu_patients_ingredients;