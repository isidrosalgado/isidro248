# The name of this view in Looker is "Oidc Config Default New User Role"
view: oidc_config_default_new_user_role {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.oidc_config_default_new_user_role ;;
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
    # This dimension will be called "Oidc Config ID" in Explore.

  dimension: oidc_config_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.oidc_config_id ;;
  }

  dimension: role_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.role_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	oidc_config.id,
	oidc_config.user_attribute_map_first_name,
	oidc_config.user_attribute_map_last_name,
	role.id,
	role.name
	]
  }

}
