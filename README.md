Monkeyking
===============

### About

Monkeyking is a custom built payslip CSV generator, its purpose is to help accountant get employee's payslip in a much faster, easier and accurate way

![](monkeyking.jpeg)

### Custodian(s)

Edward Chou(Edward_mjz@hotmail.com)

### Disclaimer

Git is only used for version control in this project, this project was never been published to any code hosting service or shared to any individuals and organisations.

### Getting Started

Extract the monkeyking package using `unzip` into a directory of your choosing:

```shell
$ unzip monkeyking.zip
```

Before using Monkeyking, you should already have [ruby](https://www.ruby-lang.org/en/downloads) 2.5.0 or [docker](https://www.docker.com/) installed for your chosen OS.

if ruby 2.5.0 has been installed, install the bundler gem:

``` shell
$ gem install bundler
```

then in the extracted directory, install the prerequisite gems:
```shell
$ bundle install
```

or without ruby on your local environment

``` shell
$ docker build -t monkeyking .
```

### Running Monkeyking

Finally, you’re ready to run Monkeyking. before running finnal command, the input CSV file must be named as `employees_salary.csv` in root directory, CSV header must be as below

``` csv
first name,last name,annual salary,super rate,payment start date
```

data in CSV must be valid, such as super rate must be a percentage, but don't worry Monkeying has a comprehensive csv validator to check input file. below is an example of valid input CSV.

``` csv
first name,last name,annual salary,super rate,payment start date
David,Rudd,60050,9%,01 March - 31 March
Ryan,Chen,120000,10%,01 March - 31 March
```

In order to make this simple, I have also provided an example file, so you can just run the following command from the extracted directory:

```shell
bundle exec rake monkeyking:output_payslip_csv
```

or

``` shell
docker run -v ${PWD}/output:/app/output monkeyking
```

then the output payslip CSV file could be found in output directory named `payslips.csv`

### Development

#### Testing(style check/quality threshold check/Unit Test)

```
$ bundle exec rake
```

### Could be improved
1. Add a tax rule checker to check if tax rule configuration file is valid
2. Check Input CSV file existance before parsing
3. Logs
