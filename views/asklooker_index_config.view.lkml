# The name of this view in Looker is "Asklooker Index Config"
view: asklooker_index_config {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.asklooker_index_config ;;
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
    # This dimension will be called "Cron" in Explore.

  dimension: cron {
    type: string
    sql: ${TABLE}.cron ;;
  }

  dimension: metadata_config_id {
    type: string
    sql: ${TABLE}.metadata_config_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: next_run {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.next_run_at ;;
  }
  measure: count {
    type: count
    drill_fields: [id, asklooker_index_execution_history.count]
  }
}
