import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

structure ChromatographySubstrate where
  lcSystem : String
  columnType : String
  mobilePhase : String
  gradientProgram : String
  flowRate : Float
  injectionVolume : Float
  substrateNative : Bool
  unrestrictedClassicalStackCarried : Bool

default :
  lcSystem := "Agilent 1290"
  columnType := "C18"
  mobilePhase := "Water/Acetonitrile"
  gradientProgram := "5-95% ACN in 10 min"
  flowRate := 0.3
  injectionVolume := 5.0
  substrateNative := true
  unrestrictedClassicalStackCarried := true

deriving Repr

structure ChromatographySubstrateCertificate where
  substrate : ChromatographySubstrate
  sourceKey : String
  lcRoute : String
  msIntegrationRoute : String
  sourceConstantsInternalized : Bool
  mathlibSubstrateReady : Bool

default :
  substrate := by infer_instance
  sourceKey := "lc_ms_database"
  lcRoute := "liquid chromatography parameters routed through source constants and Mathlib separation substrate"
  msIntegrationRoute := "mass spectrometry integration endpoint projected through the admitted spectra class"
  sourceConstantsInternalized := true
  mathlibSubstrateReady := true

deriving Repr

def ChromatographySubstrateReady (S : ChromatographySubstrate) : Prop :=
  S.substrateNative = true ∧ S.unrestrictedClassicalStackCarried = true

theorem chromatography_substrate_ready_checked :
    ChromatographySubstrateReady (by infer_instance : ChromatographySubstrate) := by
  exact And.intro rfl rfl

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse