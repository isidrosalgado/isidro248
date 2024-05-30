# The name of this view in Looker is "Whitelabel Configuration"
view: whitelabel_configuration {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.whitelabel_configuration ;;
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
    # This dimension will be called "Allow Looker Links" in Explore.

  dimension: allow_looker_links {
    type: yesno
    sql: ${TABLE}.allow_looker_links ;;
  }

  dimension: allow_looker_mentions {
    type: yesno
    sql: ${TABLE}.allow_looker_mentions ;;
  }

  dimension: custom_welcome_email_advanced {
    type: yesno
    sql: ${TABLE}.custom_welcome_email_advanced ;;
  }

  dimension: default_title {
    type: string
    sql: ${TABLE}.default_title ;;
  }

  dimension: favicon_file {
    type: string
    sql: ${TABLE}.favicon_file ;;
  }

  dimension: logo_file {
    type: string
    sql: ${TABLE}.logo_file ;;
  }

  dimension: show_docs {
    type: yesno
    sql: ${TABLE}.show_docs ;;
  }

  dimension: show_email_sub_options {
    type: yesno
    sql: ${TABLE}.show_email_sub_options ;;
  }

  dimension: show_help_menu {
    type: yesno
    sql: ${TABLE}.show_help_menu ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
