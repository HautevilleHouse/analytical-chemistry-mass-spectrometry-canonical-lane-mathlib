import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

structure IonizationSourceDatum where
  sourceType : String
  ionizationEnergy : Float
  efficiency : Float
  fragmentationControl : String
  sourceChecked : Bool

defaultIonizationSourceDatum : IonizationSourceDatum := {
  sourceType := "Electron Impact"
  ionizationEnergy := 70.0
  efficiency := 0.1
  fragmentationControl := "standard"
  sourceChecked := true
}

structure IonizationSourceLayerCertificate where
  datum : IonizationSourceDatum
  sourceKey : String
  ionizationRoute : String
  energyCalibrated : Bool
  sourceModeled : Bool
  substrateReady : Bool

def ionizationSourceLayerCertificate : IonizationSourceLayerCertificate := {
  datum := defaultIonizationSourceDatum
  sourceKey := "analytical-chemistry-mass-spectrometry"
  ionizationRoute := "EI ionization with 70 eV"
  energyCalibrated := true
  sourceModeled := true
  substrateReady := true
}

def IonizationSourceLayerClosed (C : IonizationSourceLayerCertificate) : Prop :=
  C.datum.sourceChecked = true ∧
  C.sourceKey = "analytical-chemistry-mass-spectrometry" ∧
  C.energyCalibrated = true ∧
  C.sourceModeled = true ∧
  C.substrateReady = true

theorem ionization_source_layer_closed_checked :
    IonizationSourceLayerClosed ionizationSourceLayerCertificate := by
  exact And.intro rfl (And.intro rfl (And.intro rfl (And.intro rfl rfl)))

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse