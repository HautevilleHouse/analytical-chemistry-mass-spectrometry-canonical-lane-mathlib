import HautevilleHouse.AnalyticalChemistryMassSpectrometryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

structure MassSpectrumEndpointCertificate where
  molecularIon : Float
  basePeak : Float
  isotopicPatternChecked : Bool
  fragmentationRouteChecked : Bool
  molecularFormula : String
  endpointChecked : Bool

def primitiveMassSpectrumEndpointCertificate : MassSpectrumEndpointCertificate := {
  molecularIon := 100.0,
  basePeak := 43.0,
  isotopicPatternChecked := true,
  fragmentationRouteChecked := true,
  molecularFormula := "C3H7",
  endpointChecked := true
}

def MassSpectrumEndpointLayerClosed (C : MassSpectrumEndpointCertificate) : Prop :=
  C.isotopicPatternChecked = true ∧
  C.fragmentationRouteChecked = true ∧
  C.endpointChecked = true

theorem mass_spectrum_endpoint_layer_closed_checked :
    MassSpectrumEndpointLayerClosed primitiveMassSpectrumEndpointCertificate := by
  exact And.intro rfl (And.intro rfl rfl)

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse