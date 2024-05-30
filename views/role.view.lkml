# The name of this view in Looker is "Role"
view: role {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.role ;;
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
    # This dimension will be called "Built In" in Explore.

  dimension: built_in {
    type: yesno
    sql: ${TABLE}.built_in ;;
  }

  dimension: embed {
    type: yesno
    sql: ${TABLE}.embed ;;
  }

  dimension: model_set_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.model_set_id ;;
  }

  dimension: models {
    type: string
    sql: ${TABLE}.models ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: permission_set_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.permission_set_id ;;
  }

  dimension: permissions {
    type: string
    sql: ${TABLE}.permissions ;;
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
	permission_set.id,
	permission_set.name,
	model_set.id,
	model_set.name,
	access_token.count,
	google_config_default_new_user_role.count,
	ldap_config_default_new_user_role.count,
	ldap_group_role.count,
	oidc_config_default_new_user_role.count,
	oidc_group_role.count,
	proposed_group_role.count,
	role_group.count,
	role_user.count,
	saml_config_default_new_user_role.count,
	saml_group_role.count,
	user_direct_role.count,
	user_facts_role.count
	]
  }

}
