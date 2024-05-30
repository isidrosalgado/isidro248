# The name of this view in Looker is "Google Config"
view: google_config {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.google_config ;;
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

  dimension: auth_requires_role {
    type: yesno
    sql: ${TABLE}.auth_requires_role ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_secret {
    type: string
    sql: ${TABLE}.client_secret ;;
  }

  dimension: credentials_encrypted {
    type: yesno
    sql: ${TABLE}.credentials_encrypted ;;
  }

  dimension: domains {
    type: string
    sql: ${TABLE}.domains ;;
  }

  dimension: enabled {
    type: yesno
    sql: ${TABLE}.enabled ;;
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
  measure: count {
    type: count
    drill_fields: [id, google_config_default_new_user_role.count, google_group.count]
  }
}
