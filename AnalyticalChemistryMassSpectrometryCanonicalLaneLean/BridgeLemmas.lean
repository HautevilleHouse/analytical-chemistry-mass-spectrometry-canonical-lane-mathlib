import AnalyticalChemistryMassSpectrometryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.resolution ≥ 1000 ∧ A.object.massAccuracy ≤ 5.0

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact ⟨by
    have h := A.object.resolution
    exact Nat.le_of_lt (by omega),
    by
    have h := A.object.massAccuracy
    linarith⟩

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse