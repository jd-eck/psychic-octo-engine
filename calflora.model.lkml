connection: "calflora"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=4.18
# NOTE: for BigQuery specific considerations

explore: obs {}

explore: complications {}

explore: timely_effective {}

#explre: somthing{}
