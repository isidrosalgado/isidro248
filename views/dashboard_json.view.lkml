# The name of this view in Looker is "Dashboard JSON"
view: dashboard_json {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.dashboard_json ;;
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
    # This dimension will be called "Dashboard ID" in Explore.

  dimension: dashboard_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.dashboard_id ;;
  }

  dimension: json_description {
    type: string
    sql: ${TABLE}.json_description ;;
  }
  measure: count {
    type: count
    drill_fields: [id, dashboard.id]
  }
}
