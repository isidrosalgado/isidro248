# The name of this view in Looker is "Group"
view: group {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.`group` ;;
  drill_fields: [external_group_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: external_group_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.external_group_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Can Add to Content Metadata" in Explore.

  dimension: can_add_to_content_metadata {
    type: yesno
    sql: ${TABLE}.can_add_to_content_metadata ;;
  }

  dimension: externally_managed {
    type: yesno
    sql: ${TABLE}.externally_managed ;;
  }

  dimension: externally_orphaned {
    type: yesno
    sql: ${TABLE}.externally_orphaned ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: include_by_default {
    type: yesno
    sql: ${TABLE}.include_by_default ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	external_group_id,
	name,
	content_metadata_group_user.count,
	content_view.count,
	google_group.count,
	group_user.count,
	ldap_config_default_new_user_group.count,
	ldap_group.count,
	oauth_client_app.count,
	oidc_config_default_new_user_group.count,
	oidc_group.count,
	role_group.count,
	saml_config_default_new_user_group.count,
	saml_group.count,
	user_attribute_group_value.count
	]
  }

}
