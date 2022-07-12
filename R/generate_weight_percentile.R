#' Generate Weight Percentile
#'
#' @param sex a string indicating the biological sex of the individual
#' @param age a numeric indicating the age in years of the individual
#' @param weight a numeric indicating the weight in kilograms of the individual
#' @param verbose a logical indicating if messages should be printed
#' @importFrom tools toTitleCase
#' @examples
#' generate_weight_percentile("M", 12, 50)
#' generate_weight_percentile("F", 12, 50)
#' generate_weight_percentile("Female", 12, 50)
#' generate_weight_percentile("female", 12, 50)
#' @export

generate_weight_percentile <- function(sex = c("Male", "Female"), age = 15, weight = 50, verbose = TRUE){

  sex_use <- match.arg(tools::toTitleCase(sex), c("Male", "Female"), several.ok = FALSE)

  bmi_data <- subset(x = bmicalc::weight_percentiles, sex_dsc == sex_use)

  age_dif <- (bmi_data$age_in_years-age)

  age_dif[age_dif<0] <- 100


  bmi_data$age_dif <- age_dif

  dat_fit <- head(bmi_data[order(bmi_data$age_dif),],9)

  fit_fun <- approxfun(x = dat_fit[["value"]], y = dat_fit[["percentile"]], yright = 99.9, yleft = NA, method = "linear")


  val <- fit_fun(v = weight)

  if(is.na(val)){
    cli::cli_warn("The weight, age, and sex you have entered is below the threshold for calculation and is left NA")
  } else if (val == 99.9){
    cli::cli_warn("The weight, age, and sex you have entered is above the threshold for calculation and is left as 99.9")
  }

  return(val)

}
