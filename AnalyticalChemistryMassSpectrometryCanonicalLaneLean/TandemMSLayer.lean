import AnalyticalChemistryMassSpectrometryCanonicalLaneLean.MassSpectrometryCore

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

inductive FragmentationType
| CollisionInducedDissociation
| ElectronTransferDissociation
| HigherEnergyCollisionalDissociation

structure ProductIon where
  mz : Float
  intensity : Float
  type : FragmentationType

structure TandemMassSpectrum where
  precursorMz : Float
  precursorCharge : Int
  productIons : List ProductIon
  collisionEnergy : Float

def fragmentSeries (spectrum : TandemMassSpectrum) (series : String) : List ProductIon :=
  spectrum.productIons.filter (fun ion =>
    match ion.type with
    | FragmentationType.CollisionInducedDissociation => true
    | _ => false)

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse