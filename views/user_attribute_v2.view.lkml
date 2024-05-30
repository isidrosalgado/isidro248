# The name of this view in Looker is "User Attribute V2"
view: user_attribute_v2 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.user_attribute_v2 ;;
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
    # This dimension will be called "Default Value" in Explore.

  dimension: default_value {
    type: string
    sql: ${TABLE}.default_value ;;
  }

  dimension: hidden_value_domain_whitelist {
    type: string
    sql: ${TABLE}.hidden_value_domain_whitelist ;;
  }

  dimension: is_permanent {
    type: yesno
    sql: ${TABLE}.is_permanent ;;
  }

  dimension: is_system {
    type: yesno
    sql: ${TABLE}.is_system ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: user_can_edit {
    type: yesno
    sql: ${TABLE}.user_can_edit ;;
  }

  dimension: user_can_view {
    type: yesno
    sql: ${TABLE}.user_can_view ;;
  }

  dimension: value_is_hidden {
    type: yesno
    sql: ${TABLE}.value_is_hidden ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
