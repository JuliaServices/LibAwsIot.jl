var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = LibAwsIot","category":"page"},{"location":"#LibAwsIot","page":"Home","title":"LibAwsIot","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for LibAwsIot.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [LibAwsIot]","category":"page"},{"location":"#LibAwsIot.AWS_C_IOTDEVICE_PACKAGE_ID","page":"Home","title":"LibAwsIot.AWS_C_IOTDEVICE_PACKAGE_ID","text":"Documentation not found.\n\n\n\n\n\n","category":"constant"},{"location":"#LibAwsIot.AWS_IOT_ST_FIELD_NUMBER_SHIFT","page":"Home","title":"LibAwsIot.AWS_IOT_ST_FIELD_NUMBER_SHIFT","text":"Documentation not found.\n\n\n\n\n\n","category":"constant"},{"location":"#LibAwsIot.AWS_IOT_ST_MAXIMUM_1_BYTE_VARINT_VALUE","page":"Home","title":"LibAwsIot.AWS_IOT_ST_MAXIMUM_1_BYTE_VARINT_VALUE","text":"Documentation not found.\n\n\n\n\n\n","category":"constant"},{"location":"#LibAwsIot.AWS_IOT_ST_MAXIMUM_2_BYTE_VARINT_VALUE","page":"Home","title":"LibAwsIot.AWS_IOT_ST_MAXIMUM_2_BYTE_VARINT_VALUE","text":"Documentation not found.\n\n\n\n\n\n","category":"constant"},{"location":"#LibAwsIot.AWS_IOT_ST_MAXIMUM_3_BYTE_VARINT_VALUE","page":"Home","title":"LibAwsIot.AWS_IOT_ST_MAXIMUM_3_BYTE_VARINT_VALUE","text":"Documentation not found.\n\n\n\n\n\n","category":"constant"},{"location":"#LibAwsIot.AWS_IOT_ST_MAXIMUM_VARINT","page":"Home","title":"LibAwsIot.AWS_IOT_ST_MAXIMUM_VARINT","text":"Documentation not found.\n\n\n\n\n\n","category":"constant"},{"location":"#LibAwsIot.AWS_IOT_ST_MAX_PAYLOAD_SIZE","page":"Home","title":"LibAwsIot.AWS_IOT_ST_MAX_PAYLOAD_SIZE","text":"Documentation not found.\n\n\n\n\n\n","category":"constant"},{"location":"#LibAwsIot.AWS_IOT_ST_SPLIT_MESSAGE_SIZE","page":"Home","title":"LibAwsIot.AWS_IOT_ST_SPLIT_MESSAGE_SIZE","text":"Documentation not found.\n\n\n\n\n\n","category":"constant"},{"location":"#LibAwsIot.__JL_Ctag_205","page":"Home","title":"LibAwsIot.__JL_Ctag_205","text":"__JL_Ctag_205\n\nDocumentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iotdevice_defender_get_ip_list_fn","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_get_ip_list_fn","text":"User callback type invoked to retrieve an ip list custom metric\n\nList provided will already be initialized and caller must push items into the list of type (struct aws_string *). String allocated that are placed into the list are destroyed by the defender task after it is done with the list.\n\nreturns: AWS_OP_SUCCESS if the custom metric was successfully added to the task config\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iotdevice_defender_get_number_fn","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_get_number_fn","text":"User callback type invoked to retrieve a number type custom metric.\n\nreturns: AWS_OP_SUCCESS if the custom metric was successfully added to the task config\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iotdevice_defender_get_number_list_fn","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_get_number_list_fn","text":"User callback type invoked to retrieve a number list custom metric\n\nList provided will already be initialized and caller must push items into the list of type double.\n\nreturns: AWS_OP_SUCCESS if the custom metric was successfully added to the task config\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iotdevice_defender_get_string_list_fn","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_get_string_list_fn","text":"User callback type invoked to retrieve a string list custom metric\n\nList provided will already be initialized and caller must push items into the list of type (struct aws_string *). String allocated that are placed into the list are destroyed by the defender task after it is done with the list.\n\nreturns: AWS_OP_SUCCESS if the custom metric was successfully added to the task config\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iotdevice_defender_publish_fn","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_publish_fn","text":"Callback to invoke when the defender task needs to \"publish\" a report. Useful to override default MQTT publish behavior, for testing report outputs\n\nNotes: * This function should not perform blocking IO. * This function should copy the report if it needs to hold on to the memory for an IO operation\n\nreturns: AWS_OP_SUCCESS if the user callback wants to consider the publish failed.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iotdevice_defender_report_accepted_fn","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_report_accepted_fn","text":"User callback type invoked when the subscribed device defender topic for accepted reports receives a message.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iotdevice_defender_report_format","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_report_format","text":"aws_iotdevice_defender_report_format\n\nDocumentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iotdevice_defender_report_rejected_fn","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_report_rejected_fn","text":"User callback type invoked when a report fails to submit.\n\nThere are two possibilities for failed submission: 1. The MQTT client fails to publish the message and returns an error code. In this scenario, the client_error_code will be a value other than AWS_ERROR_SUCCESS. The rejected_message_payload parameter will be NULL. 2. After a successful publish, a reply is received on the respective MQTT rejected topic with a message. In this scenario, the client_error_code will be AWS_ERROR_SUCCESS, and rejected_message_payload will contain the payload of the rejected message received.\n\nArguments\n\nrejected_message_payload:[in] response payload recieved from rejection topic\nuserdata:[in] callback userdata\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iotdevice_defender_task","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_task","text":"Documentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iotdevice_defender_task_canceled_fn","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_task_canceled_fn","text":"User callback type invoked when DeviceDefender task has completed cancellation. After a request to stop the task, this signals the completion of the cancellation and no further user callbacks will be invoked.\n\nArguments\n\nuserdata:[in] callback userdata\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iotdevice_defender_task_config","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_task_config","text":"Documentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iotdevice_defender_task_failure_fn","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_task_failure_fn","text":"General callback handler for the task to report that an error occurred while running the DeviceDefender task. Error codes can only go so far in describing where/when and how the failure occur so the errors here may best communicate where/when and the how of the underlying call should be found in log output\n\nArguments\n\nis_task_stopped:[in] flag indicating whether or not the task is unable to continue running\nerror_code:[in] error code describing the nature of the failure\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iotdevice_error","page":"Home","title":"LibAwsIot.aws_iotdevice_error","text":"aws_iotdevice_error\n\nDocumentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iotdevice_log_subject","page":"Home","title":"LibAwsIot.aws_iotdevice_log_subject","text":"aws_iotdevice_log_subject\n\nDocumentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel","page":"Home","title":"LibAwsIot.aws_secure_tunnel","text":"aws_secure_tunnel\n\nDocumentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel_connection_view","page":"Home","title":"LibAwsIot.aws_secure_tunnel_connection_view","text":"aws_secure_tunnel_connection_view\n\nRead-only snapshot of a Secure Tunnel Connection Completion Data\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel_connections","page":"Home","title":"LibAwsIot.aws_secure_tunnel_connections","text":"aws_secure_tunnel_connections\n\nDocumentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel_field_number","page":"Home","title":"LibAwsIot.aws_secure_tunnel_field_number","text":"aws_secure_tunnel_field_number\n\nDocumentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel_message_received_fn","page":"Home","title":"LibAwsIot.aws_secure_tunnel_message_received_fn","text":"Signature of callback to invoke on received messages\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel_message_storage","page":"Home","title":"LibAwsIot.aws_secure_tunnel_message_storage","text":"aws_secure_tunnel_message_storage\n\nDocumentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel_message_type","page":"Home","title":"LibAwsIot.aws_secure_tunnel_message_type","text":"aws_secure_tunnel_message_type\n\nType of IoT Secure Tunnel message. Enum values match IoT Secure Tunneling Local Proxy V3 Websocket Protocol Guide values.\n\nhttps://github.com/aws-samples/aws-iot-securetunneling-localproxy/blob/main/V3WebSocketProtocolGuide.md\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel_message_view","page":"Home","title":"LibAwsIot.aws_secure_tunnel_message_view","text":"aws_secure_tunnel_message_view\n\nRead-only snapshot of a Secure Tunnel Message\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel_on_message_received_fn","page":"Home","title":"LibAwsIot.aws_secure_tunnel_on_message_received_fn","text":"Documentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel_operation","page":"Home","title":"LibAwsIot.aws_secure_tunnel_operation","text":"Documentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel_options","page":"Home","title":"LibAwsIot.aws_secure_tunnel_options","text":"aws_secure_tunnel_options\n\nBasic Secure Tunnel configuration struct.\n\nContains connection properties for the creation of a Secure Tunnel\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel_options_storage","page":"Home","title":"LibAwsIot.aws_secure_tunnel_options_storage","text":"aws_secure_tunnel_options_storage\n\nDocumentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel_protocol_buffer_wire_type","page":"Home","title":"LibAwsIot.aws_secure_tunnel_protocol_buffer_wire_type","text":"aws_secure_tunnel_protocol_buffer_wire_type\n\nDocumentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel_state","page":"Home","title":"LibAwsIot.aws_secure_tunnel_state","text":"aws_secure_tunnel_state\n\nThe various states that the secure tunnel can be in. A secure tunnel has both a current state and a desired state. Desired state is only allowed to be one of {STOPPED, CONNECTED, TERMINATED}. The secure tunnel transitions states based on either (1) changes in desired state, or (2) external events.\n\nMost states are interruptible (in the sense of a change in desired state causing an immediate change in state) but CONNECTING cannot be interrupted due to waiting for an asynchronous callback (that has no cancel) to complete.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunnel_vtable","page":"Home","title":"LibAwsIot.aws_secure_tunnel_vtable","text":"aws_secure_tunnel_vtable\n\nDocumentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunneling_local_proxy_mode","page":"Home","title":"LibAwsIot.aws_secure_tunneling_local_proxy_mode","text":"aws_secure_tunneling_local_proxy_mode\n\nDocumentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunneling_on_connection_complete_fn","page":"Home","title":"LibAwsIot.aws_secure_tunneling_on_connection_complete_fn","text":"Signature of callback to invoke on fully established connection to Secure Tunnel Service\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunneling_on_connection_reset_fn","page":"Home","title":"LibAwsIot.aws_secure_tunneling_on_connection_reset_fn","text":"Signature of callback to invoke on a connection id stream being reset\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunneling_on_connection_shutdown_fn","page":"Home","title":"LibAwsIot.aws_secure_tunneling_on_connection_shutdown_fn","text":"Signature of callback to invoke on shutdown of connection to Secure Tunnel Service\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunneling_on_connection_start_fn","page":"Home","title":"LibAwsIot.aws_secure_tunneling_on_connection_start_fn","text":"Signature of callback to invoke on start of a connection id stream\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunneling_on_send_message_complete_fn","page":"Home","title":"LibAwsIot.aws_secure_tunneling_on_send_message_complete_fn","text":"Signature of callback to invoke on completion of an outbound message\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunneling_on_session_reset_fn","page":"Home","title":"LibAwsIot.aws_secure_tunneling_on_session_reset_fn","text":"Signature of callback to invoke on session reset recieved from the Secure Tunnel Service\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunneling_on_stopped_fn","page":"Home","title":"LibAwsIot.aws_secure_tunneling_on_stopped_fn","text":"Signature of callback to invoke on Secure Tunnel reaching a STOPPED state\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunneling_on_stream_reset_fn","page":"Home","title":"LibAwsIot.aws_secure_tunneling_on_stream_reset_fn","text":"Signature of callback to invoke on a stream being reset\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunneling_on_stream_start_fn","page":"Home","title":"LibAwsIot.aws_secure_tunneling_on_stream_start_fn","text":"Signature of callback to invoke on the start of a stream\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_secure_tunneling_on_termination_complete_fn","page":"Home","title":"LibAwsIot.aws_secure_tunneling_on_termination_complete_fn","text":"Signature of callback to invoke on termination completion of the Native Secure Tunnel Client\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.data_tunnel_pair","page":"Home","title":"LibAwsIot.data_tunnel_pair","text":"data_tunnel_pair\n\nDocumentation not found.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.defender_custom_metric_type","page":"Home","title":"LibAwsIot.defender_custom_metric_type","text":"defender_custom_metric_type\n\nChange name if this needs external exposure. Needed to keep track of how to interpret instantiated metrics, and cast the supplier_fn correctly.\n\n\n\n\n\n","category":"type"},{"location":"#LibAwsIot.aws_iot_st_msg_serialize_from_view-Tuple{Any, Any, Any}","page":"Home","title":"LibAwsIot.aws_iot_st_msg_serialize_from_view","text":"aws_iot_st_msg_serialize_from_view(buffer, allocator, message_view)\n\nDocumentation not found.\n\nPrototype\n\nint aws_iot_st_msg_serialize_from_view( struct aws_byte_buf *buffer, struct aws_allocator *allocator, const struct aws_secure_tunnel_message_view *message_view);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_config_clean_up-Tuple{Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_config_clean_up","text":"aws_iotdevice_defender_config_clean_up(config)\n\nDestroys a new reporting task for Device Defender metrics\n\nArguments\n\nconfig:[in] defender task configuration\n\nPrototype\n\nvoid aws_iotdevice_defender_config_clean_up(struct aws_iotdevice_defender_task_config *config);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_config_create-NTuple{4, Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_config_create","text":"aws_iotdevice_defender_config_create(config_out, allocator, thing_name, report_format)\n\nCreates a new reporting task config for Device Defender metrics collection\n\nArguments\n\nconfig_out:[in] output to write a pointer to a task configuration. Will write non-NULL if successful in creating the the task configuration. Will write NULL if there is an error during creation\nallocator:[in] allocator to use for the task configuration's internal data, and the task itself when started\nthing_name:[in] thing name the task config is reporting for\nreport_format:[in] report format to produce when publishing to IoT\n\nReturns\n\nAWS_OP_SUCCESS and config_out will be non-NULL. Returns an error code otherwise\n\nPrototype\n\nint aws_iotdevice_defender_config_create( struct aws_iotdevice_defender_task_config **config_out, struct aws_allocator *allocator, const struct aws_byte_cursor *thing_name, enum aws_iotdevice_defender_report_format report_format);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_config_register_ip_list_metric-NTuple{4, Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_config_register_ip_list_metric","text":"aws_iotdevice_defender_config_register_ip_list_metric(task_config, metric_name, supplier, userdata)\n\nAdds IP list custom metric to the Device Defender task configuration. Has no impact on a defender task already started using the configuration.\n\nArguments\n\ntask_config:[in] the defender task configuration to register the metric to\nmetric_name:[in] UTF8 byte string of the metric name\nsupplier:[in] callback function to produce the metric value when requested at report generation time\nuserdata:[in] specific callback data for the supplier callback function\n\nPrototype\n\nvoid aws_iotdevice_defender_config_register_ip_list_metric( struct aws_iotdevice_defender_task_config *task_config, const struct aws_byte_cursor *metric_name, aws_iotdevice_defender_get_ip_list_fn *supplier, void *userdata);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_config_register_number_list_metric-NTuple{4, Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_config_register_number_list_metric","text":"aws_iotdevice_defender_config_register_number_list_metric(task_config, metric_name, supplier, userdata)\n\nAdds number list custom metric to the Device Defender task configuration. Has no impact on a defender task already started using the configuration.\n\nArguments\n\ntask_config:[in] the defender task configuration to register the metric to\nmetric_name:[in] UTF8 byte string of the metric name\nsupplier:[in] callback function to produce the metric value when requested at report generation time\nuserdata:[in] specific callback data for the supplier callback function\n\nPrototype\n\nvoid aws_iotdevice_defender_config_register_number_list_metric( struct aws_iotdevice_defender_task_config *task_config, const struct aws_byte_cursor *metric_name, aws_iotdevice_defender_get_number_list_fn *supplier, void *userdata);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_config_register_number_metric-NTuple{4, Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_config_register_number_metric","text":"aws_iotdevice_defender_config_register_number_metric(task_config, metric_name, supplier, userdata)\n\nAdds number custom metric to the Device Defender task configuration. Has no impact on a defender task already started using the configuration.\n\nArguments\n\ntask_config:[in] the defender task configuration to register the metric to\nmetric_name:[in] UTF8 byte string of the metric name\nsupplier:[in] callback function to produce the metric value when requested at report generation time\nuserdata:[in] specific callback data for the supplier callback function\n\nPrototype\n\nvoid aws_iotdevice_defender_config_register_number_metric( struct aws_iotdevice_defender_task_config *task_config, const struct aws_byte_cursor *metric_name, aws_iotdevice_defender_get_number_fn *supplier, void *userdata);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_config_register_string_list_metric-NTuple{4, Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_config_register_string_list_metric","text":"aws_iotdevice_defender_config_register_string_list_metric(task_config, metric_name, supplier, userdata)\n\nAdds string list custom metric to the Device Defender task configuration. Has no impact on a defender task already started using the configuration.\n\nArguments\n\ntask_config:[in] the defender task configuration to register the metric to\nmetric_name:[in] UTF8 byte string of the metric name\nsupplier:[in] callback function to produce the metric value when requested at report generation time\nuserdata:[in] specific callback data for the supplier callback function\n\nPrototype\n\nvoid aws_iotdevice_defender_config_register_string_list_metric( struct aws_iotdevice_defender_task_config *task_config, const struct aws_byte_cursor *metric_name, aws_iotdevice_defender_get_string_list_fn *supplier, void *userdata);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_config_set_callback_userdata-Tuple{Any, Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_config_set_callback_userdata","text":"aws_iotdevice_defender_config_set_callback_userdata(config, userdata)\n\nSets the userdata for the device defender task's callback functions\n\nArguments\n\nconfig:[in] defender task configuration\nuserdata:[in] how much time in nanoseconds between defender task runs\n\nReturns\n\nAWS_OP_SUCCESS when the property has been set properly. Returns an error code if the value was not able to be set\n\nPrototype\n\nint aws_iotdevice_defender_config_set_callback_userdata( struct aws_iotdevice_defender_task_config *config, void *userdata);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_config_set_report_accepted_fn-Tuple{Any, Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_config_set_report_accepted_fn","text":"aws_iotdevice_defender_config_set_report_accepted_fn(config, accepted_fn)\n\nSets the report rejected callback function to invoke when is canceled and not going to be scheduled to run. This is a suggestion of when it is OK to close or free resources kept around while the task is running.\n\nArguments\n\nconfig:[in] defender task configuration\naccepted_fn:[in] accepted report callback function\n\nReturns\n\nAWS_OP_SUCCESS when the report accepted callback has been set. Returns an error if the callback was not set\n\nPrototype\n\nint aws_iotdevice_defender_config_set_report_accepted_fn( struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_report_accepted_fn *accepted_fn);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_config_set_report_rejected_fn-Tuple{Any, Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_config_set_report_rejected_fn","text":"aws_iotdevice_defender_config_set_report_rejected_fn(config, rejected_fn)\n\nSets the report rejected callback function to invoke when is canceled and not going to be scheduled to run. This is a suggestion of when it is OK to close or free resources kept around while the task is running.\n\nArguments\n\nconfig:[in] defender task configuration\nrejected_fn:[in] rejected report callback function\n\nReturns\n\nAWS_OP_SUCCESS when the report rejected callback has been set. Returns an error if the callback was not set\n\nPrototype\n\nint aws_iotdevice_defender_config_set_report_rejected_fn( struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_report_rejected_fn *rejected_fn);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_config_set_task_cancelation_fn-Tuple{Any, Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_config_set_task_cancelation_fn","text":"aws_iotdevice_defender_config_set_task_cancelation_fn(config, cancel_fn)\n\nSets the task cancelation callback function to invoke when the task is canceled and not going to be scheduled to run. This is a suggestion of when it is OK to close or free resources kept around while the task is running.\n\nArguments\n\nconfig:[in] defender task configuration\ncancel_fn:[in] cancelation callback function\n\nReturns\n\nAWS_OP_SUCCESS when the task cancelation callback has been set. Returns an error if the callback was not set\n\nPrototype\n\nint aws_iotdevice_defender_config_set_task_cancelation_fn( struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_task_canceled_fn *cancel_fn);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_config_set_task_failure_fn-Tuple{Any, Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_config_set_task_failure_fn","text":"aws_iotdevice_defender_config_set_task_failure_fn(config, failure_fn)\n\nSets the task failure callback function to invoke when the running of the task encounters a failure. Though this is optional to specify, it is important to register a handler to at least monitor failure that stops the task from running\n\nThe most likely scenario for task not being able to continue is failure to reschedule the task\n\nArguments\n\nconfig:[in] defender task configuration\nfailure_fn:[in] failure callback function\n\nReturns\n\nAWS_OP_SUCCESS when the task failure callback has been set. Returns an error if the callback was not set\n\nPrototype\n\nint aws_iotdevice_defender_config_set_task_failure_fn( struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_task_failure_fn *failure_fn);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_config_set_task_period_ns-Tuple{Any, Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_config_set_task_period_ns","text":"aws_iotdevice_defender_config_set_task_period_ns(config, task_period_ns)\n\nSets the period of the device defender task\n\nArguments\n\nconfig:[in] defender task configuration\ntask_period_ns:[in] how much time in nanoseconds between defender task runs\n\nReturns\n\nAWS_OP_SUCCESS when the property has been set properly. Returns an error code if the value was not able to be set.\n\nPrototype\n\nint aws_iotdevice_defender_config_set_task_period_ns( struct aws_iotdevice_defender_task_config *config, uint64_t task_period_ns);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_task_clean_up-Tuple{Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_task_clean_up","text":"aws_iotdevice_defender_task_clean_up(defender_task)\n\nCancels the running task reporting Device Defender metrics and cleans up. If the task is currently running, it will block until the task has been canceled and cleaned up successfully\n\nArguments\n\ndefender_task:[in] running task to stop and clean up\n\nPrototype\n\nvoid aws_iotdevice_defender_task_clean_up(struct aws_iotdevice_defender_task *defender_task);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_task_create-NTuple{4, Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_task_create","text":"aws_iotdevice_defender_task_create(task_out, config, connection, event_loop)\n\nCreates and starts a new Device Defender reporting task\n\nArguments\n\ntask_out:[out] output parameter to set to point to the defender task\nconfig:[in] defender task configuration to use to start the task\nconnection:[in] mqtt connection to use to publish reports to\nevent_loop:[in] IoT device thing name used to determine the MQTT topic to publish the report to and listen for accepted or rejected responses\n\nReturns\n\nAWS_OP_SUCCESS if the task has been created successfully and is scheduled to run\n\nPrototype\n\nint aws_iotdevice_defender_task_create( struct aws_iotdevice_defender_task **task_out, const struct aws_iotdevice_defender_task_config *config, struct aws_mqtt_client_connection *connection, struct aws_event_loop *event_loop);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_defender_task_create_ex-NTuple{4, Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_defender_task_create_ex","text":"aws_iotdevice_defender_task_create_ex(task_out, config, publish_fn, event_loop)\n\nCreates and starts a new Device Defender reporting task with the ability to define a function to accept/handle each report when the task needs to publish.\n\nArguments\n\ntask_out:[out] output parameter to set to point to the defender task\nconfig:[in] defender task configuration to use to start the task\npublish_fn:[in] callback to handle reports generated by the task. The userdata comes from the task config\nevent_loop:[in] IoT device thing name used to determine the MQTT topic to publish the report to and listen for accepted or rejected responses\n\nReturns\n\nAWS_OP_SUCCESS if the task has been created successfully and is scheduled to run\n\nPrototype\n\nint aws_iotdevice_defender_task_create_ex( struct aws_iotdevice_defender_task **task_out, const struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_publish_fn *publish_fn, struct aws_event_loop *event_loop);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_library_clean_up-Tuple{}","page":"Home","title":"LibAwsIot.aws_iotdevice_library_clean_up","text":"aws_iotdevice_library_clean_up()\n\nShuts down the internal datastructures used by aws-c-iot\n\nPrototype\n\nvoid aws_iotdevice_library_clean_up(void);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_iotdevice_library_init-Tuple{Any}","page":"Home","title":"LibAwsIot.aws_iotdevice_library_init","text":"aws_iotdevice_library_init(allocator)\n\nInitializes internal datastructures used by aws-c-iot. Must be called before using any functionality in aws-c-iot.\n\nPrototype\n\nvoid aws_iotdevice_library_init(struct aws_allocator *allocator);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_secure_tunnel_acquire-Tuple{Any}","page":"Home","title":"LibAwsIot.aws_secure_tunnel_acquire","text":"aws_secure_tunnel_acquire(secure_tunnel)\n\nAcquires a reference to a secure tunnel\n\nArguments\n\nsecure_tunnel: secure tunnel to acquire a reference to. May be NULL\n\nReturns\n\nwhat was passed in as the secure tunnel (a client or NULL)\n\nPrototype\n\nstruct aws_secure_tunnel *aws_secure_tunnel_acquire(struct aws_secure_tunnel *secure_tunnel);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_secure_tunnel_connection_reset-Tuple{Any, Any}","page":"Home","title":"LibAwsIot.aws_secure_tunnel_connection_reset","text":"aws_secure_tunnel_connection_reset(secure_tunnel, message_options)\n\nDocumentation not found.\n\nPrototype\n\nint aws_secure_tunnel_connection_reset( struct aws_secure_tunnel *secure_tunnel, const struct aws_secure_tunnel_message_view *message_options);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_secure_tunnel_connection_start-Tuple{Any, Any}","page":"Home","title":"LibAwsIot.aws_secure_tunnel_connection_start","text":"aws_secure_tunnel_connection_start(secure_tunnel, message_options)\n\nQueue a CONNECTION_START message in a secure tunnel\n\nnote: Note\nThis function should only be used from source mode.\n\nArguments\n\nsecure_tunnel: secure tunnel to queue a message for\nmessage_options: configuration options for the message operation\n\nReturns\n\nsuccess/failure in the synchronous logic that kicks off the message operation\n\nPrototype\n\nint aws_secure_tunnel_connection_start( struct aws_secure_tunnel *secure_tunnel, const struct aws_secure_tunnel_message_view *message_options);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_secure_tunnel_deserialize_message_from_cursor-Tuple{Any, Any, Any}","page":"Home","title":"LibAwsIot.aws_secure_tunnel_deserialize_message_from_cursor","text":"aws_secure_tunnel_deserialize_message_from_cursor(secure_tunnel, cursor, on_message_received)\n\nDocumentation not found.\n\nPrototype\n\nint aws_secure_tunnel_deserialize_message_from_cursor( struct aws_secure_tunnel *secure_tunnel, struct aws_byte_cursor *cursor, aws_secure_tunnel_on_message_received_fn *on_message_received);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_secure_tunnel_get_default_vtable-Tuple{}","page":"Home","title":"LibAwsIot.aws_secure_tunnel_get_default_vtable","text":"aws_secure_tunnel_get_default_vtable()\n\nDocumentation not found.\n\nPrototype\n\nconst struct aws_secure_tunnel_vtable *aws_secure_tunnel_get_default_vtable(void);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_secure_tunnel_message_type_to_c_string-Tuple{Any}","page":"Home","title":"LibAwsIot.aws_secure_tunnel_message_type_to_c_string","text":"aws_secure_tunnel_message_type_to_c_string(message_type)\n\nGet the const char description of a message type\n\nArguments\n\nmessage_type: message type used by a secure tunnel message\n\nReturns\n\nconst char translation of the message type\n\nPrototype\n\nconst char *aws_secure_tunnel_message_type_to_c_string(enum aws_secure_tunnel_message_type message_type);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_secure_tunnel_new-Tuple{Any, Any}","page":"Home","title":"LibAwsIot.aws_secure_tunnel_new","text":"aws_secure_tunnel_new(allocator, options)\n\nCreates a new secure tunnel\n\nArguments\n\noptions: secure tunnel configuration\n\nReturns\n\na new secure tunnel or NULL\n\nPrototype\n\nstruct aws_secure_tunnel *aws_secure_tunnel_new( struct aws_allocator *allocator, const struct aws_secure_tunnel_options *options);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_secure_tunnel_release-Tuple{Any}","page":"Home","title":"LibAwsIot.aws_secure_tunnel_release","text":"aws_secure_tunnel_release(secure_tunnel)\n\nRelease a reference to a secure tunnel. When the secure tunnel ref count drops to zero, the secure tunnel will automatically trigger a stop and once the stop completes, the secure tunnel will delete itself.\n\nArguments\n\nsecure_tunnel: secure tunnel to release a reference to. May be NULL\n\nReturns\n\nNULL\n\nPrototype\n\nstruct aws_secure_tunnel *aws_secure_tunnel_release(struct aws_secure_tunnel *secure_tunnel);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_secure_tunnel_send_message-Tuple{Any, Any}","page":"Home","title":"LibAwsIot.aws_secure_tunnel_send_message","text":"aws_secure_tunnel_send_message(secure_tunnel, message_options)\n\nQueues a message operation in a secure tunnel\n\nArguments\n\nsecure_tunnel: secure tunnel to queue a message for\nmessage_options: configuration options for the message operation\n\nReturns\n\nsuccess/failure in the synchronous logic that kicks off the message operation\n\nPrototype\n\nint aws_secure_tunnel_send_message( struct aws_secure_tunnel *secure_tunnel, const struct aws_secure_tunnel_message_view *message_options);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_secure_tunnel_set_vtable-Tuple{Any, Any}","page":"Home","title":"LibAwsIot.aws_secure_tunnel_set_vtable","text":"aws_secure_tunnel_set_vtable(secure_tunnel, vtable)\n\nDocumentation not found.\n\nPrototype\n\nvoid aws_secure_tunnel_set_vtable( struct aws_secure_tunnel *secure_tunnel, const struct aws_secure_tunnel_vtable *vtable);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_secure_tunnel_start-Tuple{Any}","page":"Home","title":"LibAwsIot.aws_secure_tunnel_start","text":"aws_secure_tunnel_start(secure_tunnel)\n\nAsynchronous notify to the secure tunnel that you want it to attempt to connect. The secure tunnel will attempt to stay connected.\n\nArguments\n\nsecure_tunnel: secure tunnel to start\n\nReturns\n\nsuccess/failure in the synchronous logic that kicks off the start process\n\nPrototype\n\nint aws_secure_tunnel_start(struct aws_secure_tunnel *secure_tunnel);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_secure_tunnel_stop-Tuple{Any}","page":"Home","title":"LibAwsIot.aws_secure_tunnel_stop","text":"aws_secure_tunnel_stop(secure_tunnel)\n\nAsynchronous notify to the secure tunnel that you want it to transition to the stopped state. When the secure tunnel reaches the stopped state, all session state is erased.\n\nArguments\n\nsecure_tunnel: secure tunnel to stop\n\nReturns\n\nsuccess/failure in the synchronous logic that kicks off the start process\n\nPrototype\n\nint aws_secure_tunnel_stop(struct aws_secure_tunnel *secure_tunnel);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_secure_tunnel_stream_reset-Tuple{Any, Any}","page":"Home","title":"LibAwsIot.aws_secure_tunnel_stream_reset","text":"aws_secure_tunnel_stream_reset(secure_tunnel, message_options)\n\nQueue a STREAM_RESET message in a secure tunnel\n\ncompat: Deprecated\nThis function should not be used.\n\nArguments\n\nsecure_tunnel: secure tunnel to queue a message for\nmessage_options: configuration options for the message operation\n\nReturns\n\nsuccess/failure in the synchronous logic that kicks off the message operation\n\nPrototype\n\nint aws_secure_tunnel_stream_reset( struct aws_secure_tunnel *secure_tunnel, const struct aws_secure_tunnel_message_view *message_options);\n\n\n\n\n\n","category":"method"},{"location":"#LibAwsIot.aws_secure_tunnel_stream_start-Tuple{Any, Any}","page":"Home","title":"LibAwsIot.aws_secure_tunnel_stream_start","text":"aws_secure_tunnel_stream_start(secure_tunnel, message_options)\n\nQueue a STREAM_START message in a secure tunnel\n\nnote: Note\nThis function should only be used from source mode.\n\nArguments\n\nsecure_tunnel: secure tunnel to queue a message for\nmessage_options: configuration options for the message operation\n\nReturns\n\nsuccess/failure in the synchronous logic that kicks off the message operation\n\nPrototype\n\nint aws_secure_tunnel_stream_start( struct aws_secure_tunnel *secure_tunnel, const struct aws_secure_tunnel_message_view *message_options);\n\n\n\n\n\n","category":"method"}]
}