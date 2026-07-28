import AnalyticalChemistryMassSpectrometryCanonicalLaneLean.BridgeLemmas
import AnalyticalChemistryMassSpectrometryCanonicalLaneLean.InstrumentModel

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

structure CalibrationCertificate where
  instrument : InstrumentModel
  calibrationStandardMasses : List Float
  measuredMasses : List Float
  residuals : List Float
  passed : Bool

def calibrationClosed (C : CalibrationCertificate) : Prop :=
  C.passed = true ∧
  C.residuals.all (fun r => r.abs ≤ 0.5)

theorem calibration_bridge_lemma (C : CalibrationCertificate) (h : C.instrument.calibrated) : calibrationClosed C := by
  have hpass : C.passed = true := BridgeLemmas.calibrated_implies_passed h
  have hres : C.residuals.all (fun r => r.abs ≤ 0.5) := BridgeLemmas.calibrated_implies_residuals h
  exact And.intro hpass hres

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse