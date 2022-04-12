test_that("returns correct existing percentile 50", {
  expect_true(generate_weight_percentile("Male", 180.5/12, weight = 56.5)-50 < .5)
})

test_that("returns correct existing percentile 5", {
  expect_true(generate_weight_percentile("Male", 180.5/12, weight = 43)-5 < .5)
})

test_that("returns correct existing percentile 25", {
  expect_true(generate_weight_percentile("Female", 2, weight = 11.2)-25 < .5)
})


test_that("returns correct existing percentile 90", {
  expect_true(generate_weight_percentile("Female", 30.5/12, weight = 15.2)-90 < .5)
})

test_that("match single letter sex", {
  expect_true(generate_weight_percentile("F", 30.5/12, weight = 15.2)-90 < .5)
})




test_that("Returns out of range (high)", {
  v  <- suppressWarnings(generate_weight_percentile("F", 30.5/12, weight = 200, verbose=FALSE))
  expect_true(v - 99.9 < 1e-3)
})


test_that("Returns out of range (low)", {
  v <-suppressWarnings(generate_weight_percentile("F", 30.5/12, weight = .1, verbose = FALSE))
  expect_equal(v, NA_real_)
})
