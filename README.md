### Question: How to enrich data using logstash?
e.g. Enrich HR information using employee number as a lookup key or enrich internal IP information with internal info such as data center, rack etc...

###### How can this be implemented?

1) Install translate plugin for Logstash -  https://www.elastic.co/guide/en/logstash/current/plugins-filters-translate.html

2) Create JSON (or hash or YAML) file

3) Create logstash config to include location of lookup file

```
input {
	stdin {}
}

filter {
#####################
#   Preprocessing   #
#####################
  ## Parsing raw json from stdin
  json {
    source => "message"
  }

  ## Removing fields to clean up response (demo only)
  mutate {
    remove_field => [ "message", "host", "@version"]
  }
#####################
#   Preprocessing   #
#####################

  ## Logic starts here
  translate {
    field => "ip" # field used as key in loopup
    dictionary_path => "{{absolute_path}}/{{to}}/{{lookup-file}}.json" # absolute path to lookup json file
    destination => "{{new_field_here}}" # new field to add lookup data
    refresh_interval => 10 # refresh file every 10 seconds
  }

}

output {
	stdout {codec => rubydebug}
}
```

4) Run logstash

```
echo '{"ip":"1.1.1.1"}' | ./bin/logstash -f ./config/ip-address.conf
```

5) The output should look something like:

```
{
    "@timestamp" => "2016-04-25T13:23:43.762Z",
            "ip" => "1.1.1.1",
         "geoip" => {
                      "ip" => "1.1.1.1",
           "country_code2" => "GB",
           "country_code3" => "GBR",
            "country_name" => "United Kingdom",
          "continent_code" => "EU",
             "region_name" => "H9",
               "city_name" => "London",
             "postal_code" => "EC4N",
                "latitude" => 51.514399999999995,
               "longitude" => -0.09409999999999741,
                "timezone" => "Europe/London",
        "real_region_name" => "London, City of",
                "location" => [
            [0] -0.09409999999999741,
            [1] 51.514399999999995
        ]
    }
}
```

###### Additional topics

* How to read from DB table and create enrichment JSON file

###### Additional Considerations

* When Logstash injects the object from the JSON file into the Logstash pipeline, this is currently implemented as a pointer and not a copy. This means that any manipulation of that object further on down the pipeline will change the original instance for everyone.

### Before Use:
- Change path to lookup files in both config examples.

### Execute the following when completed:

##### Internal IP Address enrichment
```
echo '{"ip":"1.1.1.1"}' | ./bin/logstash -f ./config/ip-address.conf
```

##### Employee enrichment
```
echo '{"employee_number":"123456"}' | ./bin/logstash -f ./config/employee.conf
```

```
echo '{"employee_number":"654321"}' | ./bin/logstash -f ./config/employee.conf
```
