using CEnum

"""
    __JL_Ctag_80

Documentation not found.
"""
struct __JL_Ctag_80
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_80}, f::Symbol)
    f === :scheduled && return Ptr{Bool}(x + 0)
    f === :reserved && return Ptr{Csize_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_80, f::Symbol)
    r = Ref{__JL_Ctag_80}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_80}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_80}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# typedef int ( aws_iotdevice_defender_publish_fn ) ( struct aws_byte_cursor report , void * userdata )
"""
Callback to invoke when the defender task needs to "publish" a report. Useful to override default MQTT publish behavior, for testing report outputs

Notes: * This function should not perform blocking IO. * This function should copy the report if it needs to hold on to the memory for an IO operation

returns: AWS\\_OP\\_SUCCESS if the user callback wants to consider the publish failed.
"""
const aws_iotdevice_defender_publish_fn = Cvoid

# typedef void ( aws_iotdevice_defender_task_failure_fn ) ( bool is_task_stopped , int error_code , void * userdata )
"""
General callback handler for the task to report that an error occurred while running the DeviceDefender task. Error codes can only go so far in describing where/when and how the failure occur so the errors here may best communicate where/when and the how of the underlying call should be found in log output

# Arguments
* `is_task_stopped`:\\[in\\] flag indicating whether or not the task is unable to continue running
* `error_code`:\\[in\\] error code describing the nature of the failure
"""
const aws_iotdevice_defender_task_failure_fn = Cvoid

# typedef void ( aws_iotdevice_defender_task_canceled_fn ) ( void * userdata )
"""
User callback type invoked when DeviceDefender task has completed cancellation. After a request to stop the task, this signals the completion of the cancellation and no further user callbacks will be invoked.

# Arguments
* `userdata`:\\[in\\] callback userdata
"""
const aws_iotdevice_defender_task_canceled_fn = Cvoid

# typedef void ( aws_iotdevice_defender_report_rejected_fn ) ( const struct aws_byte_cursor * rejected_message_payload , void * userdata )
"""
User callback type invoked when a report fails to submit.

There are two possibilities for failed submission: 1. The MQTT client fails to publish the message and returns an error code. In this scenario, the client\\_error\\_code will be a value other than AWS\\_ERROR\\_SUCCESS. The rejected\\_message\\_payload parameter will be NULL. 2. After a successful publish, a reply is received on the respective MQTT rejected topic with a message. In this scenario, the client\\_error\\_code will be AWS\\_ERROR\\_SUCCESS, and rejected\\_message\\_payload will contain the payload of the rejected message received.

# Arguments
* `rejected_message_payload`:\\[in\\] response payload recieved from rejection topic
* `userdata`:\\[in\\] callback userdata
"""
const aws_iotdevice_defender_report_rejected_fn = Cvoid

# typedef void ( aws_iotdevice_defender_report_accepted_fn ) ( const struct aws_byte_cursor * accepted_message_payload , void * userdata )
"""
User callback type invoked when the subscribed device defender topic for accepted reports receives a message.
"""
const aws_iotdevice_defender_report_accepted_fn = Cvoid

# typedef int ( aws_iotdevice_defender_get_number_fn ) ( double * value , void * userdata )
"""
User callback type invoked to retrieve a number type custom metric.

returns: AWS\\_OP\\_SUCCESS if the custom metric was successfully added to the task config
"""
const aws_iotdevice_defender_get_number_fn = Cvoid

# typedef int ( aws_iotdevice_defender_get_number_list_fn ) ( struct aws_array_list * number_list , void * userdata )
"""
User callback type invoked to retrieve a number list custom metric

List provided will already be initialized and caller must push items into the list of type double.

returns: AWS\\_OP\\_SUCCESS if the custom metric was successfully added to the task config
"""
const aws_iotdevice_defender_get_number_list_fn = Cvoid

# typedef int ( aws_iotdevice_defender_get_string_list_fn ) ( struct aws_array_list * string_list , void * userdata )
"""
User callback type invoked to retrieve a string list custom metric

List provided will already be initialized and caller must push items into the list of type (`struct aws_string *`). String allocated that are placed into the list are destroyed by the defender task after it is done with the list.

returns: AWS\\_OP\\_SUCCESS if the custom metric was successfully added to the task config
"""
const aws_iotdevice_defender_get_string_list_fn = Cvoid

# typedef int ( aws_iotdevice_defender_get_ip_list_fn ) ( struct aws_array_list * ip_list , void * userdata )
"""
User callback type invoked to retrieve an ip list custom metric

List provided will already be initialized and caller must push items into the list of type (`struct aws_string *`). String allocated that are placed into the list are destroyed by the defender task after it is done with the list.

returns: AWS\\_OP\\_SUCCESS if the custom metric was successfully added to the task config
"""
const aws_iotdevice_defender_get_ip_list_fn = Cvoid

"""
    aws_iotdevice_defender_report_format

Documentation not found.
"""
@cenum aws_iotdevice_defender_report_format::UInt32 begin
    AWS_IDDRF_JSON = 0
    AWS_IDDRF_SHORT_JSON = 1
    AWS_IDDRF_CBOR = 2
end

"""
    defender_custom_metric_type

Change name if this needs external exposure. Needed to keep track of how to interpret instantiated metrics, and cast the supplier\\_fn correctly.
"""
@cenum defender_custom_metric_type::UInt32 begin
    DD_METRIC_UNKNOWN = 0
    DD_METRIC_NUMBER = 1
    DD_METRIC_NUMBER_LIST = 2
    DD_METRIC_STRING_LIST = 3
    DD_METRIC_IP_LIST = 4
end

"""
Documentation not found.
"""
mutable struct aws_iotdevice_defender_task end

"""
Documentation not found.
"""
mutable struct aws_iotdevice_defender_task_config end

"""
    aws_iotdevice_defender_config_create(config_out, allocator, thing_name, report_format)

Creates a new reporting task config for Device Defender metrics collection

# Arguments
* `config_out`:\\[in\\] output to write a pointer to a task configuration. Will write non-NULL if successful in creating the the task configuration. Will write NULL if there is an error during creation
* `allocator`:\\[in\\] allocator to use for the task configuration's internal data, and the task itself when started
* `thing_name`:\\[in\\] thing name the task config is reporting for
* `report_format`:\\[in\\] report format to produce when publishing to IoT
# Returns
AWS\\_OP\\_SUCCESS and config\\_out will be non-NULL. Returns an error code otherwise
### Prototype
```c
int aws_iotdevice_defender_config_create( struct aws_iotdevice_defender_task_config **config_out, struct aws_allocator *allocator, const struct aws_byte_cursor *thing_name, enum aws_iotdevice_defender_report_format report_format);
```
"""
function aws_iotdevice_defender_config_create(config_out, allocator, thing_name, report_format)
    ccall((:aws_iotdevice_defender_config_create, libaws_c_iot), Cint, (Ptr{Ptr{aws_iotdevice_defender_task_config}}, Ptr{aws_allocator}, Ptr{aws_byte_cursor}, aws_iotdevice_defender_report_format), config_out, allocator, thing_name, report_format)
end

"""
    aws_iotdevice_defender_config_clean_up(config)

Destroys a new reporting task for Device Defender metrics

# Arguments
* `config`:\\[in\\] defender task configuration
### Prototype
```c
void aws_iotdevice_defender_config_clean_up(struct aws_iotdevice_defender_task_config *config);
```
"""
function aws_iotdevice_defender_config_clean_up(config)
    ccall((:aws_iotdevice_defender_config_clean_up, libaws_c_iot), Cvoid, (Ptr{aws_iotdevice_defender_task_config},), config)
end

"""
    aws_iotdevice_defender_config_set_task_failure_fn(config, failure_fn)

Sets the task failure callback function to invoke when the running of the task encounters a failure. Though this is optional to specify, it is important to register a handler to at least monitor failure that stops the task from running

The most likely scenario for task not being able to continue is failure to reschedule the task

# Arguments
* `config`:\\[in\\] defender task configuration
* `failure_fn`:\\[in\\] failure callback function
# Returns
AWS\\_OP\\_SUCCESS when the task failure callback has been set. Returns an error if the callback was not set
### Prototype
```c
int aws_iotdevice_defender_config_set_task_failure_fn( struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_task_failure_fn *failure_fn);
```
"""
function aws_iotdevice_defender_config_set_task_failure_fn(config, failure_fn)
    ccall((:aws_iotdevice_defender_config_set_task_failure_fn, libaws_c_iot), Cint, (Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_iotdevice_defender_task_failure_fn}), config, failure_fn)
end

"""
    aws_iotdevice_defender_config_set_task_cancelation_fn(config, cancel_fn)

Sets the task cancelation callback function to invoke when the task is canceled and not going to be scheduled to run. This is a suggestion of when it is OK to close or free resources kept around while the task is running.

# Arguments
* `config`:\\[in\\] defender task configuration
* `cancel_fn`:\\[in\\] cancelation callback function
# Returns
AWS\\_OP\\_SUCCESS when the task cancelation callback has been set. Returns an error if the callback was not set
### Prototype
```c
int aws_iotdevice_defender_config_set_task_cancelation_fn( struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_task_canceled_fn *cancel_fn);
```
"""
function aws_iotdevice_defender_config_set_task_cancelation_fn(config, cancel_fn)
    ccall((:aws_iotdevice_defender_config_set_task_cancelation_fn, libaws_c_iot), Cint, (Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_iotdevice_defender_task_canceled_fn}), config, cancel_fn)
end

"""
    aws_iotdevice_defender_config_set_report_accepted_fn(config, accepted_fn)

Sets the report rejected callback function to invoke when is canceled and not going to be scheduled to run. This is a suggestion of when it is OK to close or free resources kept around while the task is running.

# Arguments
* `config`:\\[in\\] defender task configuration
* `accepted_fn`:\\[in\\] accepted report callback function
# Returns
AWS\\_OP\\_SUCCESS when the report accepted callback has been set. Returns an error if the callback was not set
### Prototype
```c
int aws_iotdevice_defender_config_set_report_accepted_fn( struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_report_accepted_fn *accepted_fn);
```
"""
function aws_iotdevice_defender_config_set_report_accepted_fn(config, accepted_fn)
    ccall((:aws_iotdevice_defender_config_set_report_accepted_fn, libaws_c_iot), Cint, (Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_iotdevice_defender_report_accepted_fn}), config, accepted_fn)
end

"""
    aws_iotdevice_defender_config_set_report_rejected_fn(config, rejected_fn)

Sets the report rejected callback function to invoke when is canceled and not going to be scheduled to run. This is a suggestion of when it is OK to close or free resources kept around while the task is running.

# Arguments
* `config`:\\[in\\] defender task configuration
* `rejected_fn`:\\[in\\] rejected report callback function
# Returns
AWS\\_OP\\_SUCCESS when the report rejected callback has been set. Returns an error if the callback was not set
### Prototype
```c
int aws_iotdevice_defender_config_set_report_rejected_fn( struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_report_rejected_fn *rejected_fn);
```
"""
function aws_iotdevice_defender_config_set_report_rejected_fn(config, rejected_fn)
    ccall((:aws_iotdevice_defender_config_set_report_rejected_fn, libaws_c_iot), Cint, (Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_iotdevice_defender_report_rejected_fn}), config, rejected_fn)
end

"""
    aws_iotdevice_defender_config_set_task_period_ns(config, task_period_ns)

Sets the period of the device defender task

# Arguments
* `config`:\\[in\\] defender task configuration
* `task_period_ns`:\\[in\\] how much time in nanoseconds between defender task runs
# Returns
AWS\\_OP\\_SUCCESS when the property has been set properly. Returns an error code if the value was not able to be set.
### Prototype
```c
int aws_iotdevice_defender_config_set_task_period_ns( struct aws_iotdevice_defender_task_config *config, uint64_t task_period_ns);
```
"""
function aws_iotdevice_defender_config_set_task_period_ns(config, task_period_ns)
    ccall((:aws_iotdevice_defender_config_set_task_period_ns, libaws_c_iot), Cint, (Ptr{aws_iotdevice_defender_task_config}, UInt64), config, task_period_ns)
end

"""
    aws_iotdevice_defender_config_set_callback_userdata(config, userdata)

Sets the userdata for the device defender task's callback functions

# Arguments
* `config`:\\[in\\] defender task configuration
* `userdata`:\\[in\\] how much time in nanoseconds between defender task runs
# Returns
AWS\\_OP\\_SUCCESS when the property has been set properly. Returns an error code if the value was not able to be set
### Prototype
```c
int aws_iotdevice_defender_config_set_callback_userdata( struct aws_iotdevice_defender_task_config *config, void *userdata);
```
"""
function aws_iotdevice_defender_config_set_callback_userdata(config, userdata)
    ccall((:aws_iotdevice_defender_config_set_callback_userdata, libaws_c_iot), Cint, (Ptr{aws_iotdevice_defender_task_config}, Ptr{Cvoid}), config, userdata)
end

"""
    aws_iotdevice_defender_config_register_number_metric(task_config, metric_name, supplier, userdata)

Adds number custom metric to the Device Defender task configuration. Has no impact on a defender task already started using the configuration.

# Arguments
* `task_config`:\\[in\\] the defender task configuration to register the metric to
* `metric_name`:\\[in\\] UTF8 byte string of the metric name
* `supplier`:\\[in\\] callback function to produce the metric value when requested at report generation time
* `userdata`:\\[in\\] specific callback data for the supplier callback function
### Prototype
```c
void aws_iotdevice_defender_config_register_number_metric( struct aws_iotdevice_defender_task_config *task_config, const struct aws_byte_cursor *metric_name, aws_iotdevice_defender_get_number_fn *supplier, void *userdata);
```
"""
function aws_iotdevice_defender_config_register_number_metric(task_config, metric_name, supplier, userdata)
    ccall((:aws_iotdevice_defender_config_register_number_metric, libaws_c_iot), Cvoid, (Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_byte_cursor}, Ptr{aws_iotdevice_defender_get_number_fn}, Ptr{Cvoid}), task_config, metric_name, supplier, userdata)
end

"""
    aws_iotdevice_defender_config_register_number_list_metric(task_config, metric_name, supplier, userdata)

Adds number list custom metric to the Device Defender task configuration. Has no impact on a defender task already started using the configuration.

# Arguments
* `task_config`:\\[in\\] the defender task configuration to register the metric to
* `metric_name`:\\[in\\] UTF8 byte string of the metric name
* `supplier`:\\[in\\] callback function to produce the metric value when requested at report generation time
* `userdata`:\\[in\\] specific callback data for the supplier callback function
### Prototype
```c
void aws_iotdevice_defender_config_register_number_list_metric( struct aws_iotdevice_defender_task_config *task_config, const struct aws_byte_cursor *metric_name, aws_iotdevice_defender_get_number_list_fn *supplier, void *userdata);
```
"""
function aws_iotdevice_defender_config_register_number_list_metric(task_config, metric_name, supplier, userdata)
    ccall((:aws_iotdevice_defender_config_register_number_list_metric, libaws_c_iot), Cvoid, (Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_byte_cursor}, Ptr{aws_iotdevice_defender_get_number_list_fn}, Ptr{Cvoid}), task_config, metric_name, supplier, userdata)
end

"""
    aws_iotdevice_defender_config_register_string_list_metric(task_config, metric_name, supplier, userdata)

Adds string list custom metric to the Device Defender task configuration. Has no impact on a defender task already started using the configuration.

# Arguments
* `task_config`:\\[in\\] the defender task configuration to register the metric to
* `metric_name`:\\[in\\] UTF8 byte string of the metric name
* `supplier`:\\[in\\] callback function to produce the metric value when requested at report generation time
* `userdata`:\\[in\\] specific callback data for the supplier callback function
### Prototype
```c
void aws_iotdevice_defender_config_register_string_list_metric( struct aws_iotdevice_defender_task_config *task_config, const struct aws_byte_cursor *metric_name, aws_iotdevice_defender_get_string_list_fn *supplier, void *userdata);
```
"""
function aws_iotdevice_defender_config_register_string_list_metric(task_config, metric_name, supplier, userdata)
    ccall((:aws_iotdevice_defender_config_register_string_list_metric, libaws_c_iot), Cvoid, (Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_byte_cursor}, Ptr{aws_iotdevice_defender_get_string_list_fn}, Ptr{Cvoid}), task_config, metric_name, supplier, userdata)
end

"""
    aws_iotdevice_defender_config_register_ip_list_metric(task_config, metric_name, supplier, userdata)

Adds IP list custom metric to the Device Defender task configuration. Has no impact on a defender task already started using the configuration.

# Arguments
* `task_config`:\\[in\\] the defender task configuration to register the metric to
* `metric_name`:\\[in\\] UTF8 byte string of the metric name
* `supplier`:\\[in\\] callback function to produce the metric value when requested at report generation time
* `userdata`:\\[in\\] specific callback data for the supplier callback function
### Prototype
```c
void aws_iotdevice_defender_config_register_ip_list_metric( struct aws_iotdevice_defender_task_config *task_config, const struct aws_byte_cursor *metric_name, aws_iotdevice_defender_get_ip_list_fn *supplier, void *userdata);
```
"""
function aws_iotdevice_defender_config_register_ip_list_metric(task_config, metric_name, supplier, userdata)
    ccall((:aws_iotdevice_defender_config_register_ip_list_metric, libaws_c_iot), Cvoid, (Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_byte_cursor}, Ptr{aws_iotdevice_defender_get_ip_list_fn}, Ptr{Cvoid}), task_config, metric_name, supplier, userdata)
end

"""
    aws_iotdevice_defender_task_create(task_out, config, connection, event_loop)

Creates and starts a new Device Defender reporting task

# Arguments
* `task_out`:\\[out\\] output parameter to set to point to the defender task
* `config`:\\[in\\] defender task configuration to use to start the task
* `connection`:\\[in\\] mqtt connection to use to publish reports to
* `event_loop`:\\[in\\] IoT device thing name used to determine the MQTT topic to publish the report to and listen for accepted or rejected responses
# Returns
AWS\\_OP\\_SUCCESS if the task has been created successfully and is scheduled to run
### Prototype
```c
int aws_iotdevice_defender_task_create( struct aws_iotdevice_defender_task **task_out, const struct aws_iotdevice_defender_task_config *config, struct aws_mqtt_client_connection *connection, struct aws_event_loop *event_loop);
```
"""
function aws_iotdevice_defender_task_create(task_out, config, connection, event_loop)
    ccall((:aws_iotdevice_defender_task_create, libaws_c_iot), Cint, (Ptr{Ptr{aws_iotdevice_defender_task}}, Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_mqtt_client_connection}, Ptr{aws_event_loop}), task_out, config, connection, event_loop)
end

"""
    aws_iotdevice_defender_task_create_ex(task_out, config, publish_fn, event_loop)

Creates and starts a new Device Defender reporting task with the ability to define a function to accept/handle each report when the task needs to publish.

# Arguments
* `task_out`:\\[out\\] output parameter to set to point to the defender task
* `config`:\\[in\\] defender task configuration to use to start the task
* `publish_fn`:\\[in\\] callback to handle reports generated by the task. The userdata comes from the task config
* `event_loop`:\\[in\\] IoT device thing name used to determine the MQTT topic to publish the report to and listen for accepted or rejected responses
# Returns
AWS\\_OP\\_SUCCESS if the task has been created successfully and is scheduled to run
### Prototype
```c
int aws_iotdevice_defender_task_create_ex( struct aws_iotdevice_defender_task **task_out, const struct aws_iotdevice_defender_task_config *config, aws_iotdevice_defender_publish_fn *publish_fn, struct aws_event_loop *event_loop);
```
"""
function aws_iotdevice_defender_task_create_ex(task_out, config, publish_fn, event_loop)
    ccall((:aws_iotdevice_defender_task_create_ex, libaws_c_iot), Cint, (Ptr{Ptr{aws_iotdevice_defender_task}}, Ptr{aws_iotdevice_defender_task_config}, Ptr{aws_iotdevice_defender_publish_fn}, Ptr{aws_event_loop}), task_out, config, publish_fn, event_loop)
end

"""
    aws_iotdevice_defender_task_clean_up(defender_task)

Cancels the running task reporting Device Defender metrics and cleans up. If the task is currently running, it will block until the task has been canceled and cleaned up successfully

# Arguments
* `defender_task`:\\[in\\] running task to stop and clean up
### Prototype
```c
void aws_iotdevice_defender_task_clean_up(struct aws_iotdevice_defender_task *defender_task);
```
"""
function aws_iotdevice_defender_task_clean_up(defender_task)
    ccall((:aws_iotdevice_defender_task_clean_up, libaws_c_iot), Cvoid, (Ptr{aws_iotdevice_defender_task},), defender_task)
end

"""
    aws_iotdevice_error

Documentation not found.
"""
@cenum aws_iotdevice_error::UInt32 begin
    AWS_ERROR_IOTDEVICE_INVALID_RESERVED_BITS = 13312
    AWS_ERROR_IOTDEVICE_DEFENDER_INVALID_REPORT_INTERVAL = 13313
    AWS_ERROR_IOTDEVICE_DEFENDER_UNSUPPORTED_REPORT_FORMAT = 13314
    AWS_ERROR_IOTDEVICE_DEFENDER_REPORT_SERIALIZATION_FAILURE = 13315
    AWS_ERROR_IOTDEVICE_DEFENDER_UNKNOWN_CUSTOM_METRIC_TYPE = 13316
    AWS_ERROR_IOTDEVICE_DEFENDER_INVALID_TASK_CONFIG = 13317
    AWS_ERROR_IOTDEVICE_DEFENDER_PUBLISH_FAILURE = 13318
    AWS_ERROR_IOTDEVICE_DEFENDER_UNKNOWN_TASK_STATUS = 13319
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_INVALID_STREAM_ID = 13320
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_INVALID_CONNECTION_ID = 13321
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_INVALID_SERVICE_ID = 13322
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_INCORRECT_MODE = 13323
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_BAD_SERVICE_ID = 13324
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_DATA_OPTIONS_VALIDATION = 13325
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_STREAM_OPTIONS_VALIDATION = 13326
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_SECURE_TUNNEL_TERMINATED = 13327
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_WEBSOCKET_TIMEOUT = 13328
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_PING_RESPONSE_TIMEOUT = 13329
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_OPERATION_FAILED_DUE_TO_DISCONNECTION = 13330
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_OPERATION_PROCESSING_FAILURE = 13331
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_OPERATION_FAILED_DUE_TO_OFFLINE_QUEUE_POLICY = 13332
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_UNEXPECTED_HANGUP = 13333
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_USER_REQUESTED_STOP = 13334
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_PROTOCOL_VERSION_MISSMATCH = 13335
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_PROTOCOL_VERSION_MISMATCH = 13335
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_TERMINATED = 13336
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_DECODE_FAILURE = 13337
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_DATA_NO_ACTIVE_CONNECTION = 13338
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_DATA_PROTOCOL_VERSION_MISMATCH = 13339
    AWS_ERROR_IOTDEVICE_SECURE_TUNNELING_INACTIVE_SERVICE_ID = 13340
    AWS_ERROR_END_IOTDEVICE_RANGE = 14335
end

"""
    aws_iotdevice_log_subject

Documentation not found.
"""
@cenum aws_iotdevice_log_subject::UInt32 begin
    AWS_LS_IOTDEVICE_DEFENDER_TASK = 13312
    AWS_LS_IOTDEVICE_DEFENDER_TASK_CONFIG = 13313
    AWS_LS_IOTDEVICE_NETWORK_CONFIG = 13314
    AWS_LS_IOTDEVICE_SECURE_TUNNELING = 13315
end

"""
    aws_iotdevice_library_init(allocator)

Initializes internal datastructures used by aws-c-iot. Must be called before using any functionality in aws-c-iot.

### Prototype
```c
void aws_iotdevice_library_init(struct aws_allocator *allocator);
```
"""
function aws_iotdevice_library_init(allocator)
    ccall((:aws_iotdevice_library_init, libaws_c_iot), Cvoid, (Ptr{aws_allocator},), allocator)
end

"""
    aws_iotdevice_library_clean_up()

Shuts down the internal datastructures used by aws-c-iot

### Prototype
```c
void aws_iotdevice_library_clean_up(void);
```
"""
function aws_iotdevice_library_clean_up()
    ccall((:aws_iotdevice_library_clean_up, libaws_c_iot), Cvoid, ())
end

"""
    aws_secure_tunneling_local_proxy_mode

Documentation not found.
"""
@cenum aws_secure_tunneling_local_proxy_mode::UInt32 begin
    AWS_SECURE_TUNNELING_SOURCE_MODE = 0
    AWS_SECURE_TUNNELING_DESTINATION_MODE = 1
end

"""
    aws_secure_tunnel_message_type

Type of IoT Secure Tunnel message. Enum values match IoT Secure Tunneling Local Proxy V3 Websocket Protocol Guide values.

https://github.com/aws-samples/aws-iot-securetunneling-localproxy/blob/main/V3WebSocketProtocolGuide.md
"""
@cenum aws_secure_tunnel_message_type::UInt32 begin
    AWS_SECURE_TUNNEL_MT_UNKNOWN = 0
    AWS_SECURE_TUNNEL_MT_DATA = 1
    AWS_SECURE_TUNNEL_MT_STREAM_START = 2
    AWS_SECURE_TUNNEL_MT_STREAM_RESET = 3
    AWS_SECURE_TUNNEL_MT_SESSION_RESET = 4
    AWS_SECURE_TUNNEL_MT_SERVICE_IDS = 5
    AWS_SECURE_TUNNEL_MT_CONNECTION_START = 6
    AWS_SECURE_TUNNEL_MT_CONNECTION_RESET = 7
end

"""
    aws_secure_tunnel_message_view

Read-only snapshot of a Secure Tunnel Message
"""
struct aws_secure_tunnel_message_view
    type::aws_secure_tunnel_message_type
    ignorable::Bool
    stream_id::Int32
    connection_id::UInt32
    service_id::Ptr{aws_byte_cursor}
    service_id_2::Ptr{aws_byte_cursor}
    service_id_3::Ptr{aws_byte_cursor}
    payload::Ptr{aws_byte_cursor}
end

"""
    aws_secure_tunnel_connection_view

Read-only snapshot of a Secure Tunnel Connection Completion Data
"""
struct aws_secure_tunnel_connection_view
    service_id_1::Ptr{aws_byte_cursor}
    service_id_2::Ptr{aws_byte_cursor}
    service_id_3::Ptr{aws_byte_cursor}
end

# typedef void ( aws_secure_tunnel_message_received_fn ) ( const struct aws_secure_tunnel_message_view * message , void * user_data )
"""
Signature of callback to invoke on received messages
"""
const aws_secure_tunnel_message_received_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_connection_complete_fn ) ( const struct aws_secure_tunnel_connection_view * connection_view , int error_code , void * user_data )
"""
Signature of callback to invoke on fully established connection to Secure Tunnel Service
"""
const aws_secure_tunneling_on_connection_complete_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_connection_shutdown_fn ) ( int error_code , void * user_data )
"""
Signature of callback to invoke on shutdown of connection to Secure Tunnel Service
"""
const aws_secure_tunneling_on_connection_shutdown_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_send_message_complete_fn ( enum aws_secure_tunnel_message_type type , int error_code , void * user_data ) )
"""
Signature of callback to invoke on completion of an outbound message
"""
const aws_secure_tunneling_on_send_message_complete_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_stream_start_fn ) ( const struct aws_secure_tunnel_message_view * message , int error_code , void * user_data )
"""
Signature of callback to invoke on the start of a stream
"""
const aws_secure_tunneling_on_stream_start_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_stream_reset_fn ) ( const struct aws_secure_tunnel_message_view * message , int error_code , void * user_data )
"""
Signature of callback to invoke on a stream being reset
"""
const aws_secure_tunneling_on_stream_reset_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_connection_start_fn ) ( const struct aws_secure_tunnel_message_view * message , int error_code , void * user_data )
"""
Signature of callback to invoke on start of a connection id stream
"""
const aws_secure_tunneling_on_connection_start_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_connection_reset_fn ) ( const struct aws_secure_tunnel_message_view * message , int error_code , void * user_data )
"""
Signature of callback to invoke on a connection id stream being reset
"""
const aws_secure_tunneling_on_connection_reset_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_session_reset_fn ) ( void * user_data )
"""
Signature of callback to invoke on session reset recieved from the Secure Tunnel Service
"""
const aws_secure_tunneling_on_session_reset_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_stopped_fn ) ( void * user_data )
"""
Signature of callback to invoke on Secure Tunnel reaching a STOPPED state
"""
const aws_secure_tunneling_on_stopped_fn = Cvoid

# typedef void ( aws_secure_tunneling_on_termination_complete_fn ) ( void * user_data )
"""
Signature of callback to invoke on termination completion of the Native Secure Tunnel Client
"""
const aws_secure_tunneling_on_termination_complete_fn = Cvoid

"""
    aws_secure_tunnel_options

Basic Secure Tunnel configuration struct.

Contains connection properties for the creation of a Secure Tunnel
"""
struct aws_secure_tunnel_options
    endpoint_host::aws_byte_cursor
    bootstrap::Ptr{aws_client_bootstrap}
    socket_options::Ptr{aws_socket_options}
    tls_options::Ptr{aws_tls_connection_options}
    http_proxy_options::Ptr{aws_http_proxy_options}
    access_token::aws_byte_cursor
    client_token::aws_byte_cursor
    root_ca::Ptr{Cchar}
    on_message_received::Ptr{aws_secure_tunnel_message_received_fn}
    user_data::Ptr{Cvoid}
    local_proxy_mode::aws_secure_tunneling_local_proxy_mode
    on_connection_complete::Ptr{aws_secure_tunneling_on_connection_complete_fn}
    on_connection_shutdown::Ptr{aws_secure_tunneling_on_connection_shutdown_fn}
    on_send_message_complete::Ptr{aws_secure_tunneling_on_send_message_complete_fn}
    on_stream_start::Ptr{aws_secure_tunneling_on_stream_start_fn}
    on_stream_reset::Ptr{aws_secure_tunneling_on_stream_reset_fn}
    on_connection_start::Ptr{aws_secure_tunneling_on_connection_start_fn}
    on_connection_reset::Ptr{aws_secure_tunneling_on_connection_reset_fn}
    on_session_reset::Ptr{aws_secure_tunneling_on_session_reset_fn}
    on_stopped::Ptr{aws_secure_tunneling_on_stopped_fn}
    on_termination_complete::Ptr{aws_secure_tunneling_on_termination_complete_fn}
    secure_tunnel_on_termination_user_data::Ptr{Cvoid}
end

"""
    aws_secure_tunnel_vtable

Documentation not found.
"""
struct aws_secure_tunnel_vtable
    get_current_time_fn::Ptr{Cvoid}
    aws_websocket_client_connect_fn::Ptr{Cvoid}
    aws_websocket_send_frame_fn::Ptr{Cvoid}
    aws_websocket_release_fn::Ptr{Cvoid}
    aws_websocket_close_fn::Ptr{Cvoid}
    vtable_user_data::Ptr{Cvoid}
end

"""
    aws_secure_tunnel_options_storage

Documentation not found.
"""
struct aws_secure_tunnel_options_storage
    allocator::Ptr{aws_allocator}
    bootstrap::Ptr{aws_client_bootstrap}
    socket_options::aws_socket_options
    http_proxy_options::aws_http_proxy_options
    http_proxy_config::Ptr{aws_http_proxy_config}
    access_token::Ptr{aws_string}
    client_token::Ptr{aws_string}
    endpoint_host::Ptr{aws_string}
    on_message_received::Ptr{aws_secure_tunnel_message_received_fn}
    on_connection_complete::Ptr{aws_secure_tunneling_on_connection_complete_fn}
    on_connection_shutdown::Ptr{aws_secure_tunneling_on_connection_shutdown_fn}
    on_stream_start::Ptr{aws_secure_tunneling_on_stream_start_fn}
    on_stream_reset::Ptr{aws_secure_tunneling_on_stream_reset_fn}
    on_connection_start::Ptr{aws_secure_tunneling_on_connection_start_fn}
    on_connection_reset::Ptr{aws_secure_tunneling_on_connection_reset_fn}
    on_session_reset::Ptr{aws_secure_tunneling_on_session_reset_fn}
    on_stopped::Ptr{aws_secure_tunneling_on_stopped_fn}
    on_send_message_complete::Ptr{aws_secure_tunneling_on_send_message_complete_fn}
    on_termination_complete::Ptr{aws_secure_tunneling_on_termination_complete_fn}
    secure_tunnel_on_termination_user_data::Ptr{Cvoid}
    user_data::Ptr{Cvoid}
    local_proxy_mode::aws_secure_tunneling_local_proxy_mode
end

"""
    aws_secure_tunnel_message_storage

Documentation not found.
"""
struct aws_secure_tunnel_message_storage
    allocator::Ptr{aws_allocator}
    storage_view::aws_secure_tunnel_message_view
    service_id::aws_byte_cursor
    payload::aws_byte_cursor
    storage::aws_byte_buf
end

"""
    aws_secure_tunnel_connections

Documentation not found.
"""
struct aws_secure_tunnel_connections
    allocator::Ptr{aws_allocator}
    protocol_version::UInt8
    stream_id::Int32
    connection_ids::aws_hash_table
    service_ids::aws_hash_table
    restore_stream_message_view::Ptr{aws_secure_tunnel_message_storage}
    restore_stream_message::aws_secure_tunnel_message_storage
end

"""
    aws_secure_tunnel_state

The various states that the secure tunnel can be in. A secure tunnel has both a current state and a desired state. Desired state is only allowed to be one of {STOPPED, CONNECTED, TERMINATED}. The secure tunnel transitions states based on either (1) changes in desired state, or (2) external events.

Most states are interruptible (in the sense of a change in desired state causing an immediate change in state) but CONNECTING cannot be interrupted due to waiting for an asynchronous callback (that has no cancel) to complete.
"""
@cenum aws_secure_tunnel_state::UInt32 begin
    AWS_STS_STOPPED = 0
    AWS_STS_CONNECTING = 1
    AWS_STS_CONNECTED = 2
    AWS_STS_CLEAN_DISCONNECT = 3
    AWS_STS_WEBSOCKET_SHUTDOWN = 4
    AWS_STS_PENDING_RECONNECT = 5
    AWS_STS_TERMINATED = 6
end

"""
Documentation not found.
"""
mutable struct aws_secure_tunnel_operation end

"""
    aws_secure_tunnel

Documentation not found.
"""
struct aws_secure_tunnel
    data::NTuple{376, UInt8}
end

function Base.getproperty(x::Ptr{aws_secure_tunnel}, f::Symbol)
    f === :allocator && return Ptr{Ptr{aws_allocator}}(x + 0)
    f === :ref_count && return Ptr{aws_ref_count}(x + 8)
    f === :vtable && return Ptr{Ptr{aws_secure_tunnel_vtable}}(x + 32)
    f === :config && return Ptr{Ptr{aws_secure_tunnel_options_storage}}(x + 40)
    f === :connections && return Ptr{Ptr{aws_secure_tunnel_connections}}(x + 48)
    f === :tls_ctx && return Ptr{Ptr{aws_tls_ctx}}(x + 56)
    f === :tls_con_opt && return Ptr{aws_tls_connection_options}(x + 64)
    f === :host_resolution_config && return Ptr{aws_host_resolution_config}(x + 128)
    f === :service_task && return Ptr{aws_task}(x + 160)
    f === :next_service_task_run_time && return Ptr{UInt64}(x + 224)
    f === :in_service && return Ptr{Bool}(x + 232)
    f === :loop && return Ptr{Ptr{aws_event_loop}}(x + 240)
    f === :desired_state && return Ptr{aws_secure_tunnel_state}(x + 248)
    f === :current_state && return Ptr{aws_secure_tunnel_state}(x + 252)
    f === :handshake_request && return Ptr{Ptr{aws_http_message}}(x + 256)
    f === :websocket && return Ptr{Ptr{aws_websocket}}(x + 264)
    f === :received_data && return Ptr{aws_byte_buf}(x + 272)
    f === :next_reconnect_time_ns && return Ptr{UInt64}(x + 304)
    f === :reconnect_count && return Ptr{UInt64}(x + 312)
    f === :queued_operations && return Ptr{aws_linked_list}(x + 320)
    f === :current_operation && return Ptr{Ptr{aws_secure_tunnel_operation}}(x + 352)
    f === :pending_write_completion && return Ptr{Bool}(x + 360)
    f === :next_ping_time && return Ptr{UInt64}(x + 368)
    return getfield(x, f)
end

function Base.getproperty(x::aws_secure_tunnel, f::Symbol)
    r = Ref{aws_secure_tunnel}(x)
    ptr = Base.unsafe_convert(Ptr{aws_secure_tunnel}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{aws_secure_tunnel}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    aws_secure_tunnel_new(allocator, options)

Creates a new secure tunnel

# Arguments
* `options`: secure tunnel configuration
# Returns
a new secure tunnel or NULL
### Prototype
```c
struct aws_secure_tunnel *aws_secure_tunnel_new( struct aws_allocator *allocator, const struct aws_secure_tunnel_options *options);
```
"""
function aws_secure_tunnel_new(allocator, options)
    ccall((:aws_secure_tunnel_new, libaws_c_iot), Ptr{aws_secure_tunnel}, (Ptr{aws_allocator}, Ptr{aws_secure_tunnel_options}), allocator, options)
end

"""
    aws_secure_tunnel_acquire(secure_tunnel)

Acquires a reference to a secure tunnel

# Arguments
* `secure_tunnel`: secure tunnel to acquire a reference to. May be NULL
# Returns
what was passed in as the secure tunnel (a client or NULL)
### Prototype
```c
struct aws_secure_tunnel *aws_secure_tunnel_acquire(struct aws_secure_tunnel *secure_tunnel);
```
"""
function aws_secure_tunnel_acquire(secure_tunnel)
    ccall((:aws_secure_tunnel_acquire, libaws_c_iot), Ptr{aws_secure_tunnel}, (Ptr{aws_secure_tunnel},), secure_tunnel)
end

"""
    aws_secure_tunnel_release(secure_tunnel)

Release a reference to a secure tunnel. When the secure tunnel ref count drops to zero, the secure tunnel will automatically trigger a stop and once the stop completes, the secure tunnel will delete itself.

# Arguments
* `secure_tunnel`: secure tunnel to release a reference to. May be NULL
# Returns
NULL
### Prototype
```c
struct aws_secure_tunnel *aws_secure_tunnel_release(struct aws_secure_tunnel *secure_tunnel);
```
"""
function aws_secure_tunnel_release(secure_tunnel)
    ccall((:aws_secure_tunnel_release, libaws_c_iot), Ptr{aws_secure_tunnel}, (Ptr{aws_secure_tunnel},), secure_tunnel)
end

"""
    aws_secure_tunnel_start(secure_tunnel)

Asynchronous notify to the secure tunnel that you want it to attempt to connect. The secure tunnel will attempt to stay connected.

# Arguments
* `secure_tunnel`: secure tunnel to start
# Returns
success/failure in the synchronous logic that kicks off the start process
### Prototype
```c
int aws_secure_tunnel_start(struct aws_secure_tunnel *secure_tunnel);
```
"""
function aws_secure_tunnel_start(secure_tunnel)
    ccall((:aws_secure_tunnel_start, libaws_c_iot), Cint, (Ptr{aws_secure_tunnel},), secure_tunnel)
end

"""
    aws_secure_tunnel_stop(secure_tunnel)

Asynchronous notify to the secure tunnel that you want it to transition to the stopped state. When the secure tunnel reaches the stopped state, all session state is erased.

# Arguments
* `secure_tunnel`: secure tunnel to stop
# Returns
success/failure in the synchronous logic that kicks off the start process
### Prototype
```c
int aws_secure_tunnel_stop(struct aws_secure_tunnel *secure_tunnel);
```
"""
function aws_secure_tunnel_stop(secure_tunnel)
    ccall((:aws_secure_tunnel_stop, libaws_c_iot), Cint, (Ptr{aws_secure_tunnel},), secure_tunnel)
end

"""
    aws_secure_tunnel_send_message(secure_tunnel, message_options)

Queues a message operation in a secure tunnel

# Arguments
* `secure_tunnel`: secure tunnel to queue a message for
* `message_options`: configuration options for the message operation
# Returns
success/failure in the synchronous logic that kicks off the message operation
### Prototype
```c
int aws_secure_tunnel_send_message( struct aws_secure_tunnel *secure_tunnel, const struct aws_secure_tunnel_message_view *message_options);
```
"""
function aws_secure_tunnel_send_message(secure_tunnel, message_options)
    ccall((:aws_secure_tunnel_send_message, libaws_c_iot), Cint, (Ptr{aws_secure_tunnel}, Ptr{aws_secure_tunnel_message_view}), secure_tunnel, message_options)
end

"""
    aws_secure_tunnel_message_type_to_c_string(message_type)

Get the const char description of a message type

# Arguments
* `message_type`: message type used by a secure tunnel message
# Returns
const char translation of the message type
### Prototype
```c
const char *aws_secure_tunnel_message_type_to_c_string(enum aws_secure_tunnel_message_type message_type);
```
"""
function aws_secure_tunnel_message_type_to_c_string(message_type)
    ccall((:aws_secure_tunnel_message_type_to_c_string, libaws_c_iot), Ptr{Cchar}, (aws_secure_tunnel_message_type,), message_type)
end

"""
    aws_secure_tunnel_stream_start(secure_tunnel, message_options)

Queue a STREAM\\_START message in a secure tunnel

!!! note

    This function should only be used from source mode.

# Arguments
* `secure_tunnel`: secure tunnel to queue a message for
* `message_options`: configuration options for the message operation
# Returns
success/failure in the synchronous logic that kicks off the message operation
### Prototype
```c
int aws_secure_tunnel_stream_start( struct aws_secure_tunnel *secure_tunnel, const struct aws_secure_tunnel_message_view *message_options);
```
"""
function aws_secure_tunnel_stream_start(secure_tunnel, message_options)
    ccall((:aws_secure_tunnel_stream_start, libaws_c_iot), Cint, (Ptr{aws_secure_tunnel}, Ptr{aws_secure_tunnel_message_view}), secure_tunnel, message_options)
end

"""
    aws_secure_tunnel_connection_start(secure_tunnel, message_options)

Queue a CONNECTION\\_START message in a secure tunnel

!!! note

    This function should only be used from source mode.

# Arguments
* `secure_tunnel`: secure tunnel to queue a message for
* `message_options`: configuration options for the message operation
# Returns
success/failure in the synchronous logic that kicks off the message operation
### Prototype
```c
int aws_secure_tunnel_connection_start( struct aws_secure_tunnel *secure_tunnel, const struct aws_secure_tunnel_message_view *message_options);
```
"""
function aws_secure_tunnel_connection_start(secure_tunnel, message_options)
    ccall((:aws_secure_tunnel_connection_start, libaws_c_iot), Cint, (Ptr{aws_secure_tunnel}, Ptr{aws_secure_tunnel_message_view}), secure_tunnel, message_options)
end

"""
    aws_secure_tunnel_stream_reset(secure_tunnel, message_options)

Queue a STREAM\\_RESET message in a secure tunnel

!!! compat "Deprecated"

    This function should not be used.

# Arguments
* `secure_tunnel`: secure tunnel to queue a message for
* `message_options`: configuration options for the message operation
# Returns
success/failure in the synchronous logic that kicks off the message operation
### Prototype
```c
int aws_secure_tunnel_stream_reset( struct aws_secure_tunnel *secure_tunnel, const struct aws_secure_tunnel_message_view *message_options);
```
"""
function aws_secure_tunnel_stream_reset(secure_tunnel, message_options)
    ccall((:aws_secure_tunnel_stream_reset, libaws_c_iot), Cint, (Ptr{aws_secure_tunnel}, Ptr{aws_secure_tunnel_message_view}), secure_tunnel, message_options)
end

"""
    data_tunnel_pair

Documentation not found.
"""
struct data_tunnel_pair
    allocator::Ptr{aws_allocator}
    buf::aws_byte_buf
    cur::aws_byte_cursor
    type::aws_secure_tunnel_message_type
    secure_tunnel::Ptr{aws_secure_tunnel}
    length_prefix_written::Bool
end

"""
    aws_secure_tunnel_set_vtable(secure_tunnel, vtable)

Documentation not found.
### Prototype
```c
void aws_secure_tunnel_set_vtable( struct aws_secure_tunnel *secure_tunnel, const struct aws_secure_tunnel_vtable *vtable);
```
"""
function aws_secure_tunnel_set_vtable(secure_tunnel, vtable)
    ccall((:aws_secure_tunnel_set_vtable, libaws_c_iot), Cvoid, (Ptr{aws_secure_tunnel}, Ptr{aws_secure_tunnel_vtable}), secure_tunnel, vtable)
end

"""
    aws_secure_tunnel_get_default_vtable()

Documentation not found.
### Prototype
```c
const struct aws_secure_tunnel_vtable *aws_secure_tunnel_get_default_vtable(void);
```
"""
function aws_secure_tunnel_get_default_vtable()
    ccall((:aws_secure_tunnel_get_default_vtable, libaws_c_iot), Ptr{aws_secure_tunnel_vtable}, ())
end

"""
    aws_secure_tunnel_connection_reset(secure_tunnel, message_options)

Documentation not found.
### Prototype
```c
int aws_secure_tunnel_connection_reset( struct aws_secure_tunnel *secure_tunnel, const struct aws_secure_tunnel_message_view *message_options);
```
"""
function aws_secure_tunnel_connection_reset(secure_tunnel, message_options)
    ccall((:aws_secure_tunnel_connection_reset, libaws_c_iot), Cint, (Ptr{aws_secure_tunnel}, Ptr{aws_secure_tunnel_message_view}), secure_tunnel, message_options)
end

"""
    aws_secure_tunnel_field_number

Documentation not found.
"""
@cenum aws_secure_tunnel_field_number::UInt32 begin
    AWS_SECURE_TUNNEL_FN_TYPE = 1
    AWS_SECURE_TUNNEL_FN_STREAM_ID = 2
    AWS_SECURE_TUNNEL_FN_IGNORABLE = 3
    AWS_SECURE_TUNNEL_FN_PAYLOAD = 4
    AWS_SECURE_TUNNEL_FN_SERVICE_ID = 5
    AWS_SECURE_TUNNEL_FN_AVAILABLE_SERVICE_IDS = 6
    AWS_SECURE_TUNNEL_FN_CONNECTION_ID = 7
end

"""
    aws_secure_tunnel_protocol_buffer_wire_type

Documentation not found.
"""
@cenum aws_secure_tunnel_protocol_buffer_wire_type::UInt32 begin
    AWS_SECURE_TUNNEL_PBWT_VARINT = 0
    AWS_SECURE_TUNNEL_PBWT_64_BIT = 1
    AWS_SECURE_TUNNEL_PBWT_LENGTH_DELIMITED = 2
    AWS_SECURE_TUNNEL_PBWT_START_GROUP = 3
    AWS_SECURE_TUNNEL_PBWT_END_GROUP = 4
    AWS_SECURE_TUNNEL_PBWT_32_BIT = 5
end

# typedef void ( aws_secure_tunnel_on_message_received_fn ) ( struct aws_secure_tunnel * secure_tunnel , struct aws_secure_tunnel_message_view * message_view )
"""
Documentation not found.
"""
const aws_secure_tunnel_on_message_received_fn = Cvoid

"""
    aws_iot_st_msg_serialize_from_view(buffer, allocator, message_view)

Documentation not found.
### Prototype
```c
int aws_iot_st_msg_serialize_from_view( struct aws_byte_buf *buffer, struct aws_allocator *allocator, const struct aws_secure_tunnel_message_view *message_view);
```
"""
function aws_iot_st_msg_serialize_from_view(buffer, allocator, message_view)
    ccall((:aws_iot_st_msg_serialize_from_view, libaws_c_iot), Cint, (Ptr{aws_byte_buf}, Ptr{aws_allocator}, Ptr{aws_secure_tunnel_message_view}), buffer, allocator, message_view)
end

"""
    aws_secure_tunnel_deserialize_message_from_cursor(secure_tunnel, cursor, on_message_received)

Documentation not found.
### Prototype
```c
int aws_secure_tunnel_deserialize_message_from_cursor( struct aws_secure_tunnel *secure_tunnel, struct aws_byte_cursor *cursor, aws_secure_tunnel_on_message_received_fn *on_message_received);
```
"""
function aws_secure_tunnel_deserialize_message_from_cursor(secure_tunnel, cursor, on_message_received)
    ccall((:aws_secure_tunnel_deserialize_message_from_cursor, libaws_c_iot), Cint, (Ptr{aws_secure_tunnel}, Ptr{aws_byte_cursor}, Ptr{aws_secure_tunnel_on_message_received_fn}), secure_tunnel, cursor, on_message_received)
end

"""
Documentation not found.
"""
const AWS_C_IOTDEVICE_PACKAGE_ID = 13

"""
Documentation not found.
"""
const AWS_IOT_ST_SPLIT_MESSAGE_SIZE = 15000

"""
Documentation not found.
"""
const AWS_IOT_ST_FIELD_NUMBER_SHIFT = 3

"""
Documentation not found.
"""
const AWS_IOT_ST_MAXIMUM_VARINT = 268435455

"""
Documentation not found.
"""
const AWS_IOT_ST_MAXIMUM_1_BYTE_VARINT_VALUE = 128

"""
Documentation not found.
"""
const AWS_IOT_ST_MAXIMUM_2_BYTE_VARINT_VALUE = 16384

"""
Documentation not found.
"""
const AWS_IOT_ST_MAXIMUM_3_BYTE_VARINT_VALUE = 2097152

"""
Documentation not found.
"""
const AWS_IOT_ST_MAX_PAYLOAD_SIZE = 63 * 1024

