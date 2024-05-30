# The name of this view in Looker is "Query API Client Context"
view: query_api_client_context {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.query_api_client_context ;;
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
    # This dimension will be called "Attribute0" in Explore.

  dimension: attribute0 {
    type: string
    sql: ${TABLE}.attribute0 ;;
  }

  dimension: attribute1 {
    type: string
    sql: ${TABLE}.attribute1 ;;
  }

  dimension: attribute2 {
    type: string
    sql: ${TABLE}.attribute2 ;;
  }

  dimension: attribute3 {
    type: string
    sql: ${TABLE}.attribute3 ;;
  }

  dimension: attribute4 {
    type: string
    sql: ${TABLE}.attribute4 ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: extra_attributes {
    type: string
    sql: ${TABLE}.extra_attributes ;;
  }

  dimension: history_slug {
    type: string
    sql: ${TABLE}.history_slug ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
