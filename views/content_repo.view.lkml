# The name of this view in Looker is "Content Repo"
view: content_repo {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.content_repo ;;
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
    # This dimension will be called "Deploy Secret" in Explore.

  dimension: deploy_secret {
    type: string
    sql: ${TABLE}.deploy_secret ;;
  }

  dimension: git_password {
    type: string
    sql: ${TABLE}.git_password ;;
  }

  dimension: git_server_port {
    type: number
    sql: ${TABLE}.git_server_port ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_git_server_port {
    type: sum
    sql: ${git_server_port} ;;  }
  measure: average_git_server_port {
    type: average
    sql: ${git_server_port} ;;  }

  dimension: git_server_scheme {
    type: string
    sql: ${TABLE}.git_server_scheme ;;
  }

  dimension: git_service_name {
    type: string
    sql: ${TABLE}.git_service_name ;;
  }

  dimension: git_username {
    type: string
    sql: ${TABLE}.git_username ;;
  }

  dimension: instance_name {
    type: string
    sql: ${TABLE}.instance_name ;;
  }

  dimension: repo_url {
    type: string
    sql: ${TABLE}.repo_url ;;
  }

  dimension: use_git_cookie_auth {
    type: yesno
    sql: ${TABLE}.use_git_cookie_auth ;;
  }
  measure: count {
    type: count
    drill_fields: [id, instance_name, git_service_name, git_username]
  }
}
