# The name of this view in Looker is "Theme"
view: theme {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.theme ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: begin {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.begin_at ;;
  }

  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.end_at ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Name" in Explore.

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: name_key {
    type: string
    sql: ${TABLE}.name_key ;;
  }

  dimension: settings_json {
    type: string
    sql: ${TABLE}.settings_json ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
