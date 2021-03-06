# German German Aortic Valve Score
# K�tting, J., Schiller, W., ..., Welz, A. (2013).
# German Aortic Valve Score: a new scoring system for prediction of mortality
# related to aortic valve procedures in adults.
# European Journal of Cardio-Thoracic Surgery 43(5), 971�7.
# http://doi.org/10.1093/ejcts/ezt114

#' Implements the GAVS model -- CURRENTLY IN DEVELOPMENT!!!!!!!!!!
#'
#' @param age_grp Age groups (NULL=ref,ref="18_65", "66_70", "71_75", "76_80", "81_85", ">85")
#' @param female boolean string
#' @param bmi_grp BMI groups (NULL=ref, ref="22_35", "<22", ">35")
#' @param mi_within_3w boolean string
#' @param critical boolean string
#' @param pht boolean string
#' @param no_sinus_rhythm boolean string
#' @param lvef_grp LVEF groups (NULL=ref, ref="good_or_>50", "medium_or_30-50", "poor_<30"
#' @param endocarditis boolean string
#' @param redo boolean string
#' @param aterial_vessel_diseae boolean string
#' @param copd boolean string
#' @param preop_dialysis_or_rf boolean string
#' @param emergency boolean string
#'
#' @return the German aortic valve score expected probability of in-hospital-mortality
#' @export
gavs <- function(age_grp = NULL,
                 female = NULL,
                 bmi_grp = NULL,
                 nyhaIV = NULL,
                 mi_within_3w = NULL,
                 critical = NULL,
                 pht = NULL,
                 no_sinus_rhythm = NULL,
                 lvef_grp = NULL,
                 endocarditis = NULL,
                 redo = NULL,
                 aterial_vessel_diseae = NULL,
                 copd = NULL,
                 preop_dialysis_or_rf = NULL,
                 emergency = NULL
                 ) {
  const <- -5.504
  logOdds <- const

  if (!is.null(NYHA)) {
    if (NYHA == 'II') {
      logOdds <- logOdds + 0.1070545
    } else if (NYHA == 'III') {
      logOdds <- logOdds + 0.2958358
    } else if (NYHA == 'IV') {
      logOdds <- logOdds + 0.5597929
    }
  }

  pred_mort <- exp(logOdds) / (1 + exp(logOdds))
  return(round(pred_mort, digits = 4))
}


#' Calculates the GAVS
#'
#' currently in development
#'
#' @param age TODO
#' @param sex TODO
#' @param weight_kg TODO
#' @param height_cm TODO
#' @param bmi TODO
#' @param nyhaIV TODO
#' @param mi_within_3w TODO
#' @param pht TODO
#' @param no_sr TODO
#' @param lvef TODO
#' @param lvef_grp TODO
#' @param endocarditis TODO
#' @param redo TODO
#' @param aterial_vessel_diseae TODO
#' @param copd TODO
#' @param preop_dialysis_or_rf TODO
#'
#' @return TODO
#
#  Plumber decoration
#* @get /calc_gavs
#* @post /calc_gavs
calc_gavs <- function(age = NULL,
                      sex = NULL,
                      weight_kg = NULL,
                      height_cm = NULL,
                      bmi = weight_kg/((height_cm/100)^2),
                      nyhaIV = NULL,
                      mi_within_3w = NULL,
                      pht = NULL,
                      no_sr = NULL,
                      lvef = NULL,
                      lvef_grp = NULL,
                      endocarditis = NULL,
                      redo = NULL,
                      aterial_vessel_diseae = NULL,
                      copd = NULL,
                      preop_dialysis_or_rf = NULL,
                      emergency = NULL
                      ) {
  NULL
}
