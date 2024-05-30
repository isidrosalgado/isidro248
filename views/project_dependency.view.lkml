# The name of this view in Looker is "Project Dependency"
view: project_dependency {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.project_dependency ;;
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
    # This dimension will be called "Commit Sha" in Explore.

  dimension: commit_sha {
    type: string
    sql: ${TABLE}.commit_sha ;;
  }

  dimension: local_imports {
    type: string
    sql: ${TABLE}.local_imports ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
