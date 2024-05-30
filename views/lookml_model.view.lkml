# The name of this view in Looker is "Lookml Model"
view: lookml_model {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.lookml_model ;;
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
    # This dimension will be called "Name" in Explore.

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension: unlimited_db_connections {
    type: yesno
    sql: ${TABLE}.unlimited_db_connections ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, project_name, lookml_model_db_connection.count]
  }
}
