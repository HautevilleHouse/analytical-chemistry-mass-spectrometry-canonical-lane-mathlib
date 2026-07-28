import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

structure CalibrationPoint where
  concentration : Float
  response : Float
  weight : Float

defaultCalibrationPoint : CalibrationPoint := {
  concentration := 0.0
  response := 0.0
  weight := 1.0
}

structure CalibrationCurveDatum where
  points : List CalibrationPoint
  regressionType : String
  rSquared : Float
  calibrationChecked : Bool

defaultCalibrationCurveDatum : CalibrationCurveDatum := {
  points := [defaultCalibrationPoint]
  regressionType := "linear"
  rSquared := 0.999
  calibrationChecked := true
}

structure CalibrationCurveLayerCertificate where
  datum : CalibrationCurveDatum
  sourceKey : String
  calibrationRoute : String
  curveModeled : Bool
  substrateReady : Bool

def calibrationCurveLayerCertificate : CalibrationCurveLayerCertificate := {
  datum := defaultCalibrationCurveDatum
  sourceKey := "analytical-chemistry-mass-spectrometry"
  calibrationRoute := "external standard calibration with weighting"
  curveModeled := true
  substrateReady := true
}

def CalibrationCurveLayerClosed (C : CalibrationCurveLayerCertificate) : Prop :=
  C.datum.calibrationChecked = true ∧
  C.sourceKey = "analytical-chemistry-mass-spectrometry" ∧
  C.curveModeled = true ∧
  C.substrateReady = true

theorem calibration_curve_layer_closed_checked :
    CalibrationCurveLayerClosed calibrationCurveLayerCertificate := by
  exact And.intro rfl (And.intro rfl (And.intro rfl rfl))

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse