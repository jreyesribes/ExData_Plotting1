dataset.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
zip.dest <- 'data/power.zip'


if (!file.exists(zip.dest)) {
  print("Zip file not present, downloading...")
  download.file(dataset.url, dest = zip.dest)
  print("Done downloading zip file.")
}


if (!file.exists('data/household_power_consumption.txt')) {
  print("Unzipping dataset...")
  unzip(zip.dest, exdir = 'data/')
  print("Done unzipping.")
}

print("Dataset ready.")
