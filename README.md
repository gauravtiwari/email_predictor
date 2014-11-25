Email Predictor Ruby Program
===========================

The requirements are outlined in [requirements.md](requirements.md). Please read.

### Prerequisites
Please make sure Git, ruby and rubygems are installed in your computer.

### Download
From the Terminal (wherever you want to keep), run:

```
$ git clone git@github.com:gauravtiwari/email_predictor.git && cd email_predictor/ && bundle
```
### Usage
Type below command to run the predictor, this will use data/data.rb dataset to output results:

```
$ ruby predict.rb
```
To add custom new clients open data/data.rb and modify CLIENTS hash to add data and add new test clients/customers data to TEST hash:

If you wish to use *irb*, please require the files using:

```
$ require './module.rb'
```
Start a new predictor:

```
predictor = Base.new(GIVEN_FORMATS)
```
You can seed as many emails/name as you want in Clients hash in the data/data.rb

Add the data to the base class:

```
predictor.context(CLIENTS)
```
Generate predictions:
```
predictor.predict('John Doe','alphasights.com')
predictor.predict('Sam Doe','google.com')
predictor.predict('Jony Ive','apple.com')
```

An array will be generated containing all the matched predictions.

Checkout predict.rb for more details.

### Testing
To run the specs:
```
$ rspec
```
The test results are available in HTML format in [rspec_results.html](rspec_results.html).
