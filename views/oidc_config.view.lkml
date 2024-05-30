# The name of this view in Looker is "Oidc Config"
view: oidc_config {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.oidc_config ;;
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
    # This dimension will be called "Active" in Explore.

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: allow_direct_roles {
    type: yesno
    sql: ${TABLE}.allow_direct_roles ;;
  }

  dimension: allow_normal_group_membership {
    type: yesno
    sql: ${TABLE}.allow_normal_group_membership ;;
  }

  dimension: allow_roles_from_normal_groups {
    type: yesno
    sql: ${TABLE}.allow_roles_from_normal_groups ;;
  }

  dimension: alternate_email_login_allowed {
    type: yesno
    sql: ${TABLE}.alternate_email_login_allowed ;;
  }

  dimension: audience {
    type: string
    sql: ${TABLE}.audience ;;
  }

  dimension: auth_requires_role {
    type: yesno
    sql: ${TABLE}.auth_requires_role ;;
  }

  dimension: authorization_endpoint {
    type: string
    sql: ${TABLE}.authorization_endpoint ;;
  }

  dimension: enabled {
    type: yesno
    sql: ${TABLE}.enabled ;;
  }

  dimension: encrypted_secret {
    type: string
    sql: ${TABLE}.encrypted_secret ;;
  }

  dimension: groups_attribute {
    type: string
    sql: ${TABLE}.groups_attribute ;;
  }

  dimension: identifier {
    type: string
    sql: ${TABLE}.identifier ;;
  }

  dimension: issuer {
    type: string
    sql: ${TABLE}.issuer ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: modified {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.modified_at ;;
  }

  dimension: modified_by {
    type: number
    sql: ${TABLE}.modified_by ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_modified_by {
    type: sum
    sql: ${modified_by} ;;  }
  measure: average_modified_by {
    type: average
    sql: ${modified_by} ;;  }

  dimension: new_user_migration_types {
    type: string
    sql: ${TABLE}.new_user_migration_types ;;
  }

  dimension: scopes {
    type: string
    sql: ${TABLE}.scopes ;;
  }

  dimension: set_roles_from_groups {
    type: yesno
    sql: ${TABLE}.set_roles_from_groups ;;
  }

  dimension_group: test_expires {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.test_expires_at ;;
  }

  dimension: test_slug {
    type: string
    sql: ${TABLE}.test_slug ;;
  }

  dimension: token_endpoint {
    type: string
    sql: ${TABLE}.token_endpoint ;;
  }

  dimension: user_attribute_map_email {
    type: string
    sql: ${TABLE}.user_attribute_map_email ;;
  }

  dimension: user_attribute_map_first_name {
    type: string
    sql: ${TABLE}.user_attribute_map_first_name ;;
  }

  dimension: user_attribute_map_last_name {
    type: string
    sql: ${TABLE}.user_attribute_map_last_name ;;
  }

  dimension: userinfo_endpoint {
    type: string
    sql: ${TABLE}.userinfo_endpoint ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	user_attribute_map_first_name,
	user_attribute_map_last_name,
	oidc_config_default_new_user_group.count,
	oidc_config_default_new_user_role.count,
	oidc_group.count,
	oidc_user_attribute.count
	]
  }

}
