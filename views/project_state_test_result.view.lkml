# The name of this view in Looker is "Project State Test Result"
view: project_state_test_result {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.project_state_test_result ;;
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
    # This dimension will be called "Project State ID" in Explore.

  dimension: project_state_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.project_state_id ;;
  }

  dimension: test_name {
    type: string
    sql: ${TABLE}.test_name ;;
  }

  dimension: test_name_hash {
    type: string
    sql: ${TABLE}.test_name_hash ;;
  }

  dimension: test_result {
    type: string
    sql: ${TABLE}.test_result ;;
  }
  measure: count {
    type: count
    drill_fields: [id, test_name, project_state.id, project_state.name]
  }
}
