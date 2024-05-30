# The name of this view in Looker is "Csp Report"
view: csp_report {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.csp_report ;;
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
    # This dimension will be called "Blocked URI" in Explore.

  dimension: blocked_uri {
    type: string
    sql: ${TABLE}.blocked_uri ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: document_uri {
    type: string
    sql: ${TABLE}.document_uri ;;
  }

  dimension: original_policy {
    type: string
    sql: ${TABLE}.original_policy ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: violated_directive {
    type: string
    sql: ${TABLE}.violated_directive ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
