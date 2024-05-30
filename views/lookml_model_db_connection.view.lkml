# The name of this view in Looker is "Lookml Model Db Connection"
view: lookml_model_db_connection {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.lookml_model_db_connection ;;
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
    # This dimension will be called "Db Connection ID" in Explore.

  dimension: db_connection_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.db_connection_id ;;
  }

  dimension: lookml_model_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.lookml_model_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	lookml_model.id,
	lookml_model.name,
	lookml_model.project_name,
	db_connection.id,
	db_connection.name,
	db_connection.username,
	db_connection.ssh_username,
	db_connection.tmp_db_name
	]
  }

}
