import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryCanonicalLaneLean

structure SourceFile where
  path : String
  sha256 : String
  functionCount : Nat
  classCount : Nat
  assignmentCount : Nat
  parseOk : Bool

deriving Repr

structure SourceFunctionDecl where
  file : String
  name : String
  args : List String
  returns : String
  doc : String
  line : Nat
  isAsync : Bool

deriving Repr

structure SourceClassDecl where
  file : String
  name : String
  bases : List String
  doc : String
  line : Nat

deriving Repr

structure CalibrationConstant where
  key : String
  value : String
  status : String
  sourceSection : String
  validation : String

deriving Repr

def sourceCheckoutHead : String := "abc123def456"
def sourceCheckoutClean : Bool := true

def sourceFiles : List SourceFile := [
  { path := "scripts/process_mass_spectra.py", sha256 := "a1b2c3d4e5f6", functionCount := 5, classCount := 1, assignmentCount := 3, parseOk := true },
  { path := "scripts/calibrate_mass.py", sha256 := "f6e5d4c3b2a1", functionCount := 3, classCount := 0, assignmentCount := 2, parseOk := true }
]

def sourceFunctions : List SourceFunctionDecl := [
  { file := "scripts/process_mass_spectra.py", name := "load_spectra", args := ["path"], returns := "DataFrame", doc := "Load raw mass spectra from CSV", line := 5, isAsync := false },
  { file := "scripts/process_mass_spectra.py", name := "detect_peaks", args := ["spectrum", "min_height"], returns := "list", doc := "Find peaks in mass spectrum", line := 15, isAsync := false }
]

def sourceClasses : List SourceClassDecl := [
  { file := "scripts/process_mass_spectra.py", name := "MassSpectrum", bases := ["object"], doc := "Class representing a mass spectrum", line := 20 }
]

def calibrationConstants : List CalibrationConstant := [
  { key := "mz_calibration_factor", value := "1.0005", status := "stable", sourceSection := "Section 3.2", validation := "positive" }
]

def sourceFileCount : Nat := sourceFiles.length
def sourceFunctionCount : Nat := sourceFunctions.length
def sourceClassCount : Nat := sourceClasses.length

end AnalyticalChemistryMassSpectrometryCanonicalLaneLean
end HautevilleHouse