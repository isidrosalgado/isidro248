# The name of this view in Looker is "Db Connection"
view: db_connection {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.db_connection ;;
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
    # This dimension will be called "After Connect Statements" in Explore.

  dimension: after_connect_statements {
    type: string
    sql: ${TABLE}.after_connect_statements ;;
  }

  dimension: always_retry_failed_builds {
    type: yesno
    sql: ${TABLE}.always_retry_failed_builds ;;
  }

  dimension: analytical_view_dataset {
    type: string
    sql: ${TABLE}.analytical_view_dataset ;;
  }

  dimension: connection_pooling {
    type: yesno
    sql: ${TABLE}.connection_pooling ;;
  }

  dimension: cost_estimate_enabled {
    type: yesno
    sql: ${TABLE}.cost_estimate_enabled ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: custom_local_port {
    type: number
    sql: ${TABLE}.custom_local_port ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_custom_local_port {
    type: sum
    sql: ${custom_local_port} ;;  }
  measure: average_custom_local_port {
    type: average
    sql: ${custom_local_port} ;;  }

  dimension: database {
    type: string
    sql: ${TABLE}.`database` ;;
  }

  dimension: db_connection_certificate_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.db_connection_certificate_id ;;
  }

  dimension: db_timezone {
    type: string
    sql: ${TABLE}.db_timezone ;;
  }

  dimension: dialect {
    type: string
    sql: ${TABLE}.dialect ;;
  }

  dimension: disable_context_comment {
    type: yesno
    sql: ${TABLE}.disable_context_comment ;;
  }

  dimension: encrypted_private_key {
    type: string
    sql: ${TABLE}.encrypted_private_key ;;
  }

  dimension: example {
    type: yesno
    sql: ${TABLE}.example ;;
  }

  dimension: host {
    type: string
    sql: ${TABLE}.host ;;
  }

  dimension: impersonated_service_account {
    type: string
    sql: ${TABLE}.impersonated_service_account ;;
  }

  dimension: integrity_hash {
    type: string
    sql: ${TABLE}.integrity_hash ;;
  }

  dimension: jdbc_additional_params {
    type: string
    sql: ${TABLE}.jdbc_additional_params ;;
  }

  dimension: last_reap_at {
    type: number
    sql: ${TABLE}.last_reap_at ;;
  }

  dimension: last_regen_at {
    type: number
    sql: ${TABLE}.last_regen_at ;;
  }

  dimension: maintenance_cron {
    type: string
    sql: ${TABLE}.maintenance_cron ;;
  }

  dimension: managed {
    type: yesno
    sql: ${TABLE}.managed ;;
  }

  dimension: max_billing_gigabytes {
    type: string
    sql: ${TABLE}.max_billing_gigabytes ;;
  }

  dimension: max_billing_tier {
    type: number
    sql: ${TABLE}.max_billing_tier ;;
  }

  dimension: max_connections {
    type: number
    sql: ${TABLE}.max_connections ;;
  }

  dimension: misc_field {
    type: string
    sql: ${TABLE}.misc_field ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: oauth_application_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.oauth_application_id ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
  }

  dimension: pdt_api_control_enabled {
    type: yesno
    sql: ${TABLE}.pdt_api_control_enabled ;;
  }

  dimension: pdt_concurrency {
    type: number
    sql: ${TABLE}.pdt_concurrency ;;
  }

  dimension: pool_timeout {
    type: number
    sql: ${TABLE}.pool_timeout ;;
  }

  dimension: port {
    type: string
    sql: ${TABLE}.port ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: query_timezone {
    type: string
    sql: ${TABLE}.query_timezone ;;
  }

  dimension: reg_key {
    type: string
    sql: ${TABLE}.reg_key ;;
  }

  dimension: schema {
    type: string
    sql: ${TABLE}.`schema` ;;
  }

  dimension_group: schema_busted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.schema_busted_at ;;
  }

  dimension: sql_runner_precache_tables {
    type: yesno
    sql: ${TABLE}.sql_runner_precache_tables ;;
  }

  dimension: sql_writing_with_info_schema {
    type: yesno
    sql: ${TABLE}.sql_writing_with_info_schema ;;
  }

  dimension: ssh_forward {
    type: yesno
    sql: ${TABLE}.ssh_forward ;;
  }

  dimension: ssh_host {
    type: string
    sql: ${TABLE}.ssh_host ;;
  }

  dimension: ssh_port {
    type: number
    sql: ${TABLE}.ssh_port ;;
  }

  dimension: ssh_remote_host {
    type: string
    sql: ${TABLE}.ssh_remote_host ;;
  }

  dimension: ssh_remote_port {
    type: number
    sql: ${TABLE}.ssh_remote_port ;;
  }

  dimension: ssh_username {
    type: string
    sql: ${TABLE}.ssh_username ;;
  }

  dimension: ssl {
    type: yesno
    sql: ${TABLE}.`ssl` ;;
  }

  dimension: tmp_db_name {
    type: string
    sql: ${TABLE}.tmp_db_name ;;
  }

  dimension: tunnel_id {
    type: string
    sql: ${TABLE}.tunnel_id ;;
  }

  dimension: use_gcp_default_credentials {
    type: yesno
    sql: ${TABLE}.use_gcp_default_credentials ;;
  }

  dimension: user_attribute_fields {
    type: string
    sql: ${TABLE}.user_attribute_fields ;;
  }

  dimension: user_db_credentials {
    type: yesno
    sql: ${TABLE}.user_db_credentials ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: uses_tns {
    type: yesno
    sql: ${TABLE}.uses_tns ;;
  }

  dimension: verify_ssl {
    type: yesno
    sql: ${TABLE}.verify_ssl ;;
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
	username,
	ssh_username,
	tmp_db_name,
	user.first_name,
	user.last_name,
	user.dev_mode_user_id,
	user.dev_branch_name,
	db_connection_certificate.id,
	oauth_application.id,
	oauth_application.name,
	db_connection_override.count,
	lookml_model_db_connection.count,
	upload_table.count
	]
  }

}
