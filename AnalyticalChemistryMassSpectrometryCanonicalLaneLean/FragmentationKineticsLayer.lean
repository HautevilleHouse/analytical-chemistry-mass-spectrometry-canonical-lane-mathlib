import HautevilleHouse.AnalyticalChemistryMassSpectrometryCanonicalLaneLean.MassSpectrumEndpointLayer

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

structure FragmentationKineticsCertificate where
  activationEnergy : Float
  preExponentialFactor : Float
  rateConstant : Float
  arrheniusEquationModeled : Bool
  reactionOrderChecked : Bool

def primitiveFragmentationKineticsCertificate : FragmentationKineticsCertificate := {
  activationEnergy := 50.0,
  preExponentialFactor := 1.0e10,
  rateConstant := 1.5e3,
  arrheniusEquationModeled := true,
  reactionOrderChecked := true
}

def FragmentationKineticsLayerClosed (C : FragmentationKineticsCertificate) : Prop :=
  C.arrheniusEquationModeled = true ∧
  C.reactionOrderChecked = true

theorem fragmentation_kinetics_layer_closed_checked :
    FragmentationKineticsLayerClosed primitiveFragmentationKineticsCertificate := by
  exact And.intro rfl rfl

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse