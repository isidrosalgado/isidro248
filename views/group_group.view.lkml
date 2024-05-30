# The name of this view in Looker is "Group Group"
view: group_group {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.group_group ;;
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
    # This dimension will be called "Included Group ID" in Explore.

  dimension: included_group_id {
    type: number
    sql: ${TABLE}.included_group_id ;;
  }

  dimension: into_group_id {
    type: number
    sql: ${TABLE}.into_group_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
