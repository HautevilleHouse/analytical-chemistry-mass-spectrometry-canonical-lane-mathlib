import AnalyticalChemistryMassSpectrometryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

structure Peak where
  mz : Float
  intensity : Float
  charge : Int

def peakMass (p : Peak) : Float :=
  p.mz * p.charge.toFloat

structure MassSpectrum where
  id : String
  peaks : List Peak
  totalIonCurrent : Float
  acquisitionTime : Float

def totalIntensity (s : MassSpectrum) : Float :=
  s.peaks.foldl (fun acc p => acc + p.intensity) 0.0

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse