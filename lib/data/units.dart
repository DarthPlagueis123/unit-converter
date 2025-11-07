// ===========================================================
// data/units.dart
// - Categories + unit lists
// - Linear category factors relative to a canonical base unit
// - Temperature is non-linear (handled with formulas)
// ===========================================================

const Map<String, List<String>> kUnits = {
  'Length': ['meter','kilometer','centimeter','millimeter','mile','yard','foot','inch'],
  'Weight': ['kilogram','gram','pound','ounce'],
  'Temperature': ['celsius','fahrenheit','kelvin'],
  'Time': ['second','minute','hour','day'],
  'Area': ['square meter','square kilometer','square centimeter','square millimeter','square mile','square yard','square foot','square inch','hectare','acre'],
  'Volume': ['cubic meter','liter','milliliter','cubic centimeter','cubic millimeter','cubic foot','cubic inch','gallon (US)','quart (US)','pint (US)','cup (US)','tablespoon (US)','teaspoon (US)'],
  'Speed': ['meter/second','kilometer/hour','mile/hour','knot','foot/second'],
  'Data': ['bit','byte','kibibyte (KiB)','mebibyte (MiB)','gibibyte (GiB)','tebibyte (TiB)'],
  'Angle': ['radian','degree','gradian','turn'],
};

const Map<String, Map<String,double>> kLinearFactors = {
  'Length': {
    'meter':1.0,'kilometer':1000.0,'centimeter':0.01,'millimeter':0.001,'mile':1609.344,'yard':0.9144,'foot':0.3048,'inch':0.0254,
  },
  'Weight': {
    'kilogram':1.0,'gram':0.001,'pound':0.45359237,'ounce':0.028349523125,
  },
  'Time': {
    'second':1.0,'minute':60.0,'hour':3600.0,'day':86400.0,
  },
  'Area': {
    'square meter':1.0,'square kilometer':1e6,'square centimeter':1e-4,'square millimeter':1e-6,'square mile':2589988.110336,'square yard':0.83612736,'square foot':0.09290304,'square inch':0.00064516,'hectare':10000.0,'acre':4046.8564224,
  },
  'Volume': {
    'cubic meter':1.0,'liter':0.001,'milliliter':1e-6,'cubic centimeter':1e-6,'cubic millimeter':1e-9,'cubic foot':0.028316846592,'cubic inch':0.000016387064,'gallon (US)':0.003785411784,'quart (US)':0.000946352946,'pint (US)':0.000473176473,'cup (US)':0.0002365882365,'tablespoon (US)':0.00001478676478125,'teaspoon (US)':0.00000492892159375,
  },
  'Speed': {
    'meter/second':1.0,'kilometer/hour':1000.0/3600.0,'mile/hour':1609.344/3600.0,'knot':1852.0/3600.0,'foot/second':0.3048,
  },
  'Data': {
    // Base is byte
    'bit':1.0/8.0,'byte':1.0,'kibibyte (KiB)':1024.0,'mebibyte (MiB)':1024.0*1024.0,'gibibyte (GiB)':1024.0*1024.0*1024.0,'tebibyte (TiB)':1024.0*1024.0*1024.0*1024.0,
  },
  'Angle': {
    'radian':1.0,'degree':3.14159265358979323846/180.0,'gradian':3.14159265358979323846/200.0,'turn':6.28318530717958647692,
  },
};
