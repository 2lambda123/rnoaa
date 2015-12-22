context("coops")

test_that("coops works", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  
  aa <- coops_search(station_name = 8723970, begin_date = 20140927, end_date = 20140928, product = "water_temperature")
  
  # class
  expect_is(aa$data, "data.frame")
  expect_is(aa$metadata$name, "character")
  
  # dimensions
  expect_equal(NCOL(aa$data), 3)
})

test_that("coops fails well", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  
  expect_error(coops_search(), "argument \"product\" is missing, with no default")
})

test_that("coops fails well", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  
  expect_error(coops_search(), "argument \"product\" is missing, with no default")
  expect_error(coops_search(station_name = 8775244, begin_date = 20140927, end_date = 20140928, product = "air_temperature"), "No data was found")
  
})