import AnalyticalChemistryMassSpectrometryCanonicalLaneLean.MassSpectrometryCore

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

inductive InstrumentType
| Quadrupole
| TimeOfFlight
| IonTrap
| Orbitrap

structure InstrumentParameters where
  massRangeMin : Float
  massRangeMax : Float
  resolution : Nat
  massAccuracyPpm : Float
  scanRate : Float

structure InstrumentModel where
  name : String
  instrumentType : InstrumentType
  parameters : InstrumentParameters
  calibrated : Bool

def instrumentReady (instr : InstrumentModel) : Prop :=
  instr.calibrated = true ∧
  instr.parameters.resolution ≥ 500 ∧
  instr.parameters.massAccuracyPpm ≤ 5.0

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse