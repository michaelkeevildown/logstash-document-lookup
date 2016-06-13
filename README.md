# Before Use:
- Change path to lookup files in both config examples.

# Execute the following when completed:

### Internal IP Address enrichment
`echo '{"ip":"1.1.1.1"}' | ./bin/logstash -f ./config/ip-address.conf`

### Employee enrichment
`echo '{"employee_number":"123456"}' | ./bin/logstash -f ./config/employee.conf`

`echo '{"employee_number":"654321"}' | ./bin/logstash -f ./config/employee.conf`
