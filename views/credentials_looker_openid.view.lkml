# The name of this view in Looker is "Credentials Looker Openid"
view: credentials_looker_openid {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.credentials_looker_openid ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Email" in Explore.

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: encrypted_secret {
    type: string
    sql: ${TABLE}.encrypted_secret ;;
  }

  dimension_group: last_login {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_login_at ;;
  }

  dimension: last_login_ip {
    type: string
    sql: ${TABLE}.last_login_ip ;;
  }

  dimension: secret {
    type: string
    sql: ${TABLE}.secret ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, user.first_name, user.last_name, user.dev_mode_user_id, user.dev_branch_name]
  }
}
