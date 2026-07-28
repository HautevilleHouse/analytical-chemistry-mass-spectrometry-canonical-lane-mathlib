import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

structure SourceImportDependency where
  file : String
  kind : String
  module : String
  name : String
  alias : String
  level : Nat

deriving Repr

structure SourcePathDependency where
  file : String
  name : String
  path : String
  role : String
  line : Nat

deriving Repr

def sourceImportDependencies : List SourceImportDependency := [
  { file := "scripts/process_mass_spectra.py", kind := "from_import", module := "__future__", name := "annotations", alias := "", level := 0 },
  { file := "scripts/process_mass_spectra.py", kind := "import", module := "numpy", name := "", alias := "np", level := 0 },
  { file := "scripts/process_mass_spectra.py", kind := "import", module := "pandas", name := "", alias := "pd", level := 0 },
  { file := "scripts/process_mass_spectra.py", kind := "from_import", module := "scipy.signal", name := "find_peaks", alias := "", level := 0 }
]

def sourceRuntimeModules : List String := [
  "__future__.annotations",
  "numpy",
  "pandas",
  "scipy.signal.find_peaks"
]

def sourcePathDependencies : List SourcePathDependency := [
  { file := "scripts/process_mass_spectra.py", name := "DEFAULT_INPUT", path := "data/raw_spectra.csv", role := "data", line := 10 },
  { file := "scripts/process_mass_spectra.py", name := "DEFAULT_OUTPUT", path := "data/processed_spectra.csv", role := "data", line := 11 }
]

def sourceImportDependencyCount : Nat := sourceImportDependencies.length

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse