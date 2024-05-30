# The name of this view in Looker is "Ldap User Attribute"
view: ldap_user_attribute {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.ldap_user_attribute ;;
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
    # This dimension will be called "Ldap Config ID" in Explore.

  dimension: ldap_config_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ldap_config_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: required {
    type: yesno
    sql: ${TABLE}.required ;;
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
	ldap_config.id,
	ldap_config.encrypted_auth_username,
	ldap_config.user_attribute_map_first_name,
	ldap_config.user_attribute_map_last_name,
	ldap_user_attribute_attribute.count
	]
  }

}
