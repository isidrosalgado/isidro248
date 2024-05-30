# The name of this view in Looker is "Prototype Resolution"
view: prototype_resolution {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.prototype_resolution ;;
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
    # This dimension will be called "Prototype File Names" in Explore.

  dimension: prototype_file_names {
    type: string
    sql: ${TABLE}.prototype_file_names ;;
  }

  dimension: prototype_file_names_json {
    type: string
    sql: ${TABLE}.prototype_file_names_json ;;
  }

  dimension: remote_ref {
    type: string
    sql: ${TABLE}.remote_ref ;;
  }

  dimension: remote_url {
    type: string
    sql: ${TABLE}.remote_url ;;
  }

  dimension: root_project_id {
    type: string
    sql: ${TABLE}.root_project_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
