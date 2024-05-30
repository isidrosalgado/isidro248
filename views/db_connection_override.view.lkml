# The name of this view in Looker is "Db Connection Override"
view: db_connection_override {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.db_connection_override ;;
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
    # This dimension will be called "After Connect Statements" in Explore.

  dimension: after_connect_statements {
    type: string
    sql: ${TABLE}.after_connect_statements ;;
  }

  dimension: context {
    type: string
    sql: ${TABLE}.context ;;
  }

  dimension: database {
    type: string
    sql: ${TABLE}.`database` ;;
  }

  dimension: db_connection_certificate_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.db_connection_certificate_id ;;
  }

  dimension: db_connection_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.db_connection_id ;;
  }

  dimension: host {
    type: string
    sql: ${TABLE}.host ;;
  }

  dimension: integrity_hash {
    type: string
    sql: ${TABLE}.integrity_hash ;;
  }

  dimension: jdbc_additional_params {
    type: string
    sql: ${TABLE}.jdbc_additional_params ;;
  }

  dimension: misc_field {
    type: string
    sql: ${TABLE}.misc_field ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
  }

  dimension: port {
    type: string
    sql: ${TABLE}.port ;;
  }

  dimension: schema {
    type: string
    sql: ${TABLE}.`schema` ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	username,
	db_connection.id,
	db_connection.name,
	db_connection.username,
	db_connection.ssh_username,
	db_connection.tmp_db_name,
	db_connection_certificate.id
	]
  }

}
