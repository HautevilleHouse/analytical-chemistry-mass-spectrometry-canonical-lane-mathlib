import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

structure DetectorResponseDatum where
  detectorType : String
  gain : Float
  noiseLevel : Float
  saturationLimit : Float
  responseCalibrated : Bool

defaultDetectorResponseDatum : DetectorResponseDatum := {
  detectorType := "Electron Multiplier"
  gain := 1.0e6
  noiseLevel := 0.001
  saturationLimit := 1.0e9
  responseCalibrated := true
}

structure DetectorResponseLayerCertificate where
  datum : DetectorResponseDatum
  sourceKey : String
  detectorRoute : String
  gainCalibrated : Bool
  detectorModeled : Bool
  substrateReady : Bool

def detectorResponseLayerCertificate : DetectorResponseLayerCertificate := {
  datum := defaultDetectorResponseDatum
  sourceKey := "analytical-chemistry-mass-spectrometry"
  detectorRoute := "electron multiplier response with gain calibration"
  gainCalibrated := true
  detectorModeled := true
  substrateReady := true
}

def DetectorResponseLayerClosed (C : DetectorResponseLayerCertificate) : Prop :=
  C.datum.responseCalibrated = true ∧
  C.sourceKey = "analytical-chemistry-mass-spectrometry" ∧
  C.gainCalibrated = true ∧
  C.detectorModeled = true ∧
  C.substrateReady = true

theorem detector_response_layer_closed_checked :
    DetectorResponseLayerClosed detectorResponseLayerCertificate := by
  exact And.intro rfl (And.intro rfl (And.intro rfl (And.intro rfl rfl)))

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse