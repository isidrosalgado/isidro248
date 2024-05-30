# The name of this view in Looker is "Oidc Group"
view: oidc_group {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.oidc_group ;;
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
    # This dimension will be called "Group ID" in Explore.

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: oidc_config_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.oidc_config_id ;;
  }

  dimension: proposed_group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.proposed_group_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	name,
	oidc_config.id,
	oidc_config.user_attribute_map_first_name,
	oidc_config.user_attribute_map_last_name,
	group.name,
	group.external_group_id,
	proposed_group.id,
	proposed_group.name,
	oidc_group_role.count
	]
  }

}
