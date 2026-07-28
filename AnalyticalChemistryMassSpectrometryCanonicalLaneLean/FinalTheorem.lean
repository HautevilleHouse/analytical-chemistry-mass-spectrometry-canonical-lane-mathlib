import HautevilleHouse.AnalyticalChemistryMassSpectrometryCanonicalLaneLean.FragmentationKineticsLayer

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact ⟨A.object.sourceKey, A.object.theoremObject, A.object.claimBoundary, rfl, rfl, rfl⟩

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

def MassSpectrometryAdmissibleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem mass_spectrometry_admissible_endgame (A : AdmissibleClass) :
    MassSpectrometryAdmissibleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse