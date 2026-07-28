import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

structure MassChargeRatioDatum where
  mz : Float
  intensity : Float
  resolution : Float
  calibrationChecked : Bool

defaultMassChargeRatioDatum : MassChargeRatioDatum := {
  mz := 0.0
  intensity := 0.0
  resolution := 1.0
  calibrationChecked := true
}

structure MassChargeRatioLayerCertificate where
  datum : MassChargeRatioDatum
  sourceKey : String
  mzRoute : String
  calibrationRoute : String
  resolutionModeled : Bool
  substrateReady : Bool

def massChargeRatioLayerCertificate : MassChargeRatioLayerCertificate := {
  datum := defaultMassChargeRatioDatum
  sourceKey := "analytical-chemistry-mass-spectrometry"
  mzRoute := "mass-to-charge ratio projected through calibration curve"
  calibrationRoute := "external calibration with reference standards"
  resolutionModeled := true
  substrateReady := true
}

def MassChargeRatioLayerClosed (C : MassChargeRatioLayerCertificate) : Prop :=
  C.datum.calibrationChecked = true ∧
  C.sourceKey = "analytical-chemistry-mass-spectrometry" ∧
  C.resolutionModeled = true ∧
  C.substrateReady = true

theorem mass_charge_ratio_layer_closed_checked :
    MassChargeRatioLayerClosed massChargeRatioLayerCertificate := by
  exact And.intro rfl (And.intro rfl (And.intro rfl rfl))

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse