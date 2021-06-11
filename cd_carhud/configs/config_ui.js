// These are the default values for carhud
// Make sure you save a copy of this file in case you mess something up.
// Do not edit things you aren't sure about, instead ask a question on Codesign Discord and someone will respond.
let settings = {
  gauges:{
    elements:{    // Identifiers of elements
      fuel:"#fuel",
      fuel_bg:"#fuelFill",
      speed:"#speed",
      speed_bg:"#speedFill",
      rpm:"#rpm",
      rpm_bg:"#rpmFill"
    },
    units:"MPH", // Default units
    display:{ // Default display values for gauges
      fuel:true,
      speed:true,
      rpm:true,
    },
    color:{ // Default colors of bars
      speed:["#ffba08", "#faa307", "#f48c06", "#f48c06", "#e85d04", "#dc2f02", "#d00000","#9d0208", "#6a040f", "#370617"],
      rpm:["#d3d3d3", "#b1a7a6", "#e5383b", "#ba181b", "#660708"],
      fuel:["#ffba08", "#ffba08"]
    }
  },
  dashboard:{
    elements:{ // Identifiers of dashboard elements
      main:"#infoCluster",
      left:"#leftIndicatorDisplay",
      right:"#rightIndicatorDisplay",
      seatbelt:"#seatbeltDisplay",
      engine:"#engineDisplay",
      fuel:"#fuelDisplay",
      cruisecontrol:"#ccDisplay",
      lowbeam:"#lowBeamDisplay",
      highbeam:"#highBeamDisplay"
    },
    engineAlert:10, // Default engine alert
    fuelAlert:20, // Default fuel alert
    display:true, // Display of gauges
    individual:{
      left:true,
      engine:true,
      seatbelt:true,
      fuel:true,
      cruisecontrol:true,
      lowbeam:true,
      highbeam:true,
      right:true
    }
  },
  streetCompass:{ 
    elements:{
      street:"#streetName",
      compass:"#compass",
      heading:"#compass-current-number",
      caret:"#compass-current-caret"
    },
    display:{ // Display of street
      street:true,
      compass:true,
      heading:true,
      caret:true
    }
  },
  size:{
    fuel:{
      base:150, // Base size of fuel gauge
      scale:1, // Do not change
    },
    speed:{
      base:150, // Base size of speed gauge
      scale:1, // Do not change
      font:[32, 16] // Base sizes of speed font, first is speed, second is unit (MPH/KMH)
    },
    rpm:{
      base:100, // Base size of rpm gauge
      scale:1, // Do not change
      font:[16, 13.2] // Base sizes of rpm font, first is rpm value, second is rpm text (RPM)
    },
    dashboard:{
      base:48,
      scale:1,
      padding:10
    },
    street:"20px", // Default street size, make sure you also change it in html
    compass:{
      scale:1 // Scale, 1 = 100%, 0.5 = 50%, 1.5 = 150%
    },
  },
  position:{ // Default positions of elements
    fuel:{
      top:"0px",
      left:"0px"
    },
    speed:{
      top:"0px",
      left:"0px"
    },
    rpm:{
      top:"0px",
      left:"0px"
    },
    dashboard:{
      top:"0px",
      left:"0px"
    },
    street:{
      top:"0px",
      left:"0px"
    },
    compass:{
      top:"0px",
      left:"0px"
    }
  },
  refresh:500, // Default refresh rate, make sure you also change it in html (IN MILLISECONDS)
  compass: {
    display:true,
    movement_scale: 2.66666666667, // 2.66666666667px = 1 heading [DO NOT CHANGE IF YOU DON'T KNOW WHAT YOU ARE DOING, IT WILL BREAK THE ACCURACY OF COMPASS]
    background_position:1225, // N center
  }
};
let default_settings = JSON.parse(JSON.stringify(settings));