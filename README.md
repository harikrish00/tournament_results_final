# Tournament Results
Project for reporting and conducting swiss style chess tournaments

# Set up vagrant environment

* Create a vagrant box and provision with necessary tool chains

```shell
$ vagrant up
```

* Login to the box

```shell
$ vagrant ssh
$ cd /vagrant
```

* Setup database and tables

```shell
$psql
vagrant> \i tournament.sql;
vagrant> \q
```

* Run the test to make sure everything is working

```shell
$python tournmanet_test.py
```

#### Files and its purpose:
- `tournament.py` # Contains the actual logic for tournament results
- `tournament.sql` # Contains the sql statement for creating database, tables and
  views
- `tournament_test.py` # Master test file contains all the test cases to test the
  logic
- `tournament_extra_credit_test.py` # Tests the extra credit requirements

