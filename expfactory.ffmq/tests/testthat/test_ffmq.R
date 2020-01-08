library(tidyverse)
library(expfactory)
context('FFMQ')

df <- process_expfactory_survey(token='1', survey='../fixtures/1_ffmq.json') %>%
  rename(p = Token)
test_that("process_expfactory_survey() can process JSON", {
  expect_is(df, 'data.frame')
})

test_that('FFMQ correctly parsed', {
  expect_equal(df[6,4], 'When I take a shower or bath, I stay alert to the sensations of water on my body. ')
})

library(expfactory.ffmq)
ffmq <- ffmq(df)
test_that('FFMQ observe value is correct', {
  expect_equal(ffmq$observe, 34)
})

test_that('FFMQ describe value is correct', {
  expect_equal(ffmq$describe, 23)
})

test_that('FFMQ actaware value is correct', {
  expect_equal(ffmq$actaware, 19)
})

test_that('FFMQ nonjudge value is correct', {
  expect_equal(ffmq$nonjudge, 21)
})

test_that('FFMQ nonreact value is correct', {
  expect_equal(ffmq$nonreact, 25)
})
