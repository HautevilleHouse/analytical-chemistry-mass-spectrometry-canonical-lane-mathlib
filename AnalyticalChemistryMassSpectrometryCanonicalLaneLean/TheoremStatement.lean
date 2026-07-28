import HautevilleHouse.AnalyticalChemistryMassSpectrometryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := sourceRepository,
  theoremName := sourceRepository,
  theoremObject := sourceDescription,
  classicalBoundary := "Mass spectrometry theorem boundary remains open",
  carriedRemainder := "Classical mass spectrometry results carried outside admitted class"
}

def ClassicalSourceBoundaryCarried : Prop :=
  sourceTheoremStatement.sourceKey = sourceRepository ∧
  sourceTheoremStatement.theoremObject = sourceDescription

theorem classical_source_boundary_carried_checked :
    ClassicalSourceBoundaryCarried := by
  exact And.intro rfl rfl

def TheoremLayerInternalized : Prop :=
  sourceTheoremStatement.sourceKey = sourceRepository ∧
  ClassicalSourceBoundaryCarried

theorem theorem_layer_internalized_checked :
    TheoremLayerInternalized := by
  exact And.intro rfl classical_source_boundary_carried_checked

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse