# The name of this view in Looker is "Backup Configuration"
view: backup_configuration {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.backup_configuration ;;
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
    # This dimension will be called "Custom S3 Bucket" in Explore.

  dimension: custom_s3_bucket {
    type: string
    sql: ${TABLE}.custom_s3_bucket ;;
  }

  dimension: custom_s3_bucket_region {
    type: string
    sql: ${TABLE}.custom_s3_bucket_region ;;
  }

  dimension: encrypted_custom_s3_key {
    type: string
    sql: ${TABLE}.encrypted_custom_s3_key ;;
  }

  dimension: encrypted_custom_s3_secret {
    type: string
    sql: ${TABLE}.encrypted_custom_s3_secret ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
