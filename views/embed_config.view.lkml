# The name of this view in Looker is "Embed Config"
view: embed_config {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.embed_config ;;
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
    # This dimension will be called "Alert URL Allowlist" in Explore.

  dimension: alert_url_allowlist {
    type: string
    sql: ${TABLE}.alert_url_allowlist ;;
  }

  dimension: alert_url_label {
    type: string
    sql: ${TABLE}.alert_url_label ;;
  }

  dimension: alert_url_param_owner {
    type: string
    sql: ${TABLE}.alert_url_param_owner ;;
  }

  dimension: domain_whitelist {
    type: string
    sql: ${TABLE}.domain_whitelist ;;
  }

  dimension: embed_content_management {
    type: yesno
    sql: ${TABLE}.embed_content_management ;;
  }

  dimension: embed_content_navigation {
    type: yesno
    sql: ${TABLE}.embed_content_navigation ;;
  }

  dimension: hide_look_navigation {
    type: yesno
    sql: ${TABLE}.hide_look_navigation ;;
  }

  dimension: look_filters {
    type: yesno
    sql: ${TABLE}.look_filters ;;
  }

  dimension: sso_auth_enabled {
    type: yesno
    sql: ${TABLE}.sso_auth_enabled ;;
  }

  dimension: strict_sameorigin_for_login {
    type: yesno
    sql: ${TABLE}.strict_sameorigin_for_login ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
