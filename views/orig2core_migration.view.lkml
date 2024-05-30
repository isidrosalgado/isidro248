# The name of this view in Looker is "Orig2core Migration"
view: orig2core_migration {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.orig2core_migration ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cmek Path" in Explore.

  dimension: cmek_path {
    type: string
    sql: ${TABLE}.cmek_path ;;
  }

  dimension: gcs_bucket {
    type: string
    sql: ${TABLE}.gcs_bucket ;;
  }

  dimension: gcs_folder {
    type: string
    sql: ${TABLE}.gcs_folder ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: requested {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.requested_at ;;
  }

  dimension: requested_by_userid {
    type: string
    sql: ${TABLE}.requested_by_userid ;;
  }

  dimension: service_json {
    type: string
    sql: ${TABLE}.service_json ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: status_detail {
    type: string
    sql: ${TABLE}.status_detail ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
