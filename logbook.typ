#set page(
  paper: "a4",
  margin: (x: 3cm, y: 2.5cm),
  numbering: "1",
  header: context {
    if counter(page).get().first() > 1 {
      align(right)[
        #stack(
          dir: ttb,
          spacing: 2pt,
          align(center)[#image("favicon.png", width: 1cm)],
          align(center)[#text(font: "Libertinus Serif", style: "italic", weight: "bold", size: 12pt, fill: navy)[BSC]]
        )
      ]
    }
  },
  footer: context {
    let page_num = counter(page).get().first()
    if page_num > 1 {
      align(center)[#page_num]
    }
  },
  header-ascent: 20%,
)

#set text(
  font: "Libertinus Serif",
  size: 12pt,
)

#show heading: set text(navy)
#show heading.where(level: 1): set text(size: 16pt)
#show heading.where(level: 2): set text(size: 14pt)

// --- Configuration Variables ---
// You can quickly update all logbook details right here.
#let title = ""
#let yacht-model = ""
#let yacht-name = ""
#let mmsi = ""
#let call-sign = ""
#let home-port = ""
// Set to none to hide from cover page in blank template
#let start-date = none
#let end-date = ""
#let sailing-area = ""
#let charter-company = ""
#let version = "1.0.0"

#let captain = ""

#let crew = (
  "", "", "", "", "", "", "", "", "", "", "", "",
)

// Define Watch Assignments here for automatic filling
// Supports 3 members per officer (12 people total in rotation)
#let watch-assignments = (
  (officer: "", members: ("", "", "")),
  (officer: "", members: ("", "", "")),
  (officer: "", members: ("", "", "")),
)

// --- Cover Page ---
#v(-1em)
#align(center)[
  #text(size: 11pt, style: "italic")[The logbook of the project:] \
  #v(-1.2em)
  #text(size: 42pt, weight: "bold")[#if title == "" [Sailing Logbook] else [#title]]
]
  
#v(0.5em)
  
#grid(
  columns: (auto, 1fr), // Auto fits the longest label perfectly, 1fr takes the rest
  row-gutter: 0.6em,
  align: (right, left),
  column-gutter: 1.5em,
  [*Yacht:*], [#if yacht-model != "" or yacht-name != "" [#yacht-model #if yacht-name != "" ["#yacht-name"]] else [#box(width: 100%, repeat[#text(fill: luma(220))[.]])] ],
  [*MMSI:*], [#if mmsi != "" [#mmsi] else [#box(width: 100%, repeat[#text(fill: luma(220))[.]])] ],
  [*Call Sign:*], [#if call-sign != "" [#call-sign] else [#box(width: 100%, repeat[#text(fill: luma(220))[.]])] ],
  [*Home Port:*], [#if home-port != "" [#home-port] else [#box(width: 100%, repeat[#text(fill: luma(220))[.]])] ],
  [*Start Date:*], [#if start-date != none [#start-date.display("[month repr:long] [day], [year]")] else [#box(width: 100%, repeat[#text(fill: luma(220))[.]])] ],
  [*End Date:*], [#if end-date != "" [#end-date] else [#box(width: 100%, repeat[#text(fill: luma(220))[.]])] ],
  [*Sailing Area:*], [#if sailing-area != "" [#sailing-area] else [#box(width: 100%, repeat[#text(fill: luma(220))[.]])] ],
  [*Charter Company:*], [#if charter-company != "" [#charter-company] else [#box(width: 100%, repeat[#text(fill: luma(220))[.]])] ],
  [*Captain:*], [#if captain != "" [#captain] else [#box(width: 100%, repeat[#text(fill: luma(220))[.]])] ],
)
  
#v(0.5em)
  
#align(center)[
  #block(width: 80%, stroke: 0.5pt + gray, inset: 1em)[
    #align(left)[
      *Crew List:*
      #v(0.5em)
      #for (idx, person) in crew.enumerate() [
        #if person != "" [
          #(idx + 1). #person \
        ] else [
          #grid(
            columns: (auto, 1fr),
            [#(idx + 1). ], [#box(width: 100%, repeat[#text(fill: luma(220))[.]])]
          )
        ]
      ]
    ]
  ]
]

#v(1fr)
#align(center)[
  #block(breakable: false)[
    #image("favicon.png", width: 2.5cm)
    #v(0.2em)
    #text(size: 11pt, style: "italic")[Belgian Sailing Community]
    #v(0.1em)
    #text(size: 5pt, fill: luma(180))[v#version]
  ]
]


#pagebreak()

// --- Page 2: NATO Phonetic Alphabet ---
#heading(level: 1)[NATO Phonetic Alphabet]
#v(2em)

#align(center)[
  #table(
    columns: (1fr, 1fr),
    stroke: 0.5pt + gray,
    align: left + horizon,
    inset: 1.2em,
    [*A* - Alfa], [*N* - November],
    [*B* - Bravo], [*O* - Oscar],
    [*C* - Charlie], [*P* - Papa],
    [*D* - Delta], [*Q* - Quebec],
    [*E* - Echo], [*R* - Romeo],
    [*F* - Foxtrot], [*S* - Sierra],
    [*G* - Golf], [*T* - Tango],
    [*H* - Hotel], [*U* - Uniform],
    [*I* - India], [*V* - Victor],
    [*J* - Juliett], [*W* - Whiskey],
    [*K* - Kilo], [*X* - X-ray],
    [*L* - Lima], [*Y* - Yankee],
    [*M* - Mike], [*Z* - Zulu],
  )
]

#pagebreak()

// --- Emergency Radio Call ---
#heading(level: 1)[EMERGENCY RADIO CALL]
#v(1em)

#block(
  fill: rgb("#fff5f5"),
  stroke: 3pt + red,
  inset: 2em,
  width: 100%,
  height: 80%, 
)[
  #align(center)[
    #text(red, weight: "bold", size: 14pt)[USE ONLY IN CASE OF DANGER TO LIFE. SPEAK SLOWLY.]
  ]
  
  #v(1fr)
  
  *1. PRESS AND HOLD THE RED BUTTON ON THE RADIO UNTIL IT BEEPS.*
  
  #v(1fr)
  
  2. *SWITCH RADIO CHANNEL TO 16, PRESS "PUSH-TO-TALK" AND READ:*
  #pad(left: 1.5em, top: 0.5em)[
    #text(style: "italic", size: 14pt)[
      "MAYDAY, MAYDAY, MAYDAY \
      THIS IS YACHT #if yacht-name != "" [#upper(yacht-name), YACHT #upper(yacht-name), YACHT #upper(yacht-name)] else [............. , YACHT ............. , YACHT .............]"
    ]
  ]
  
  #v(1fr)
  
  *3. READ GPS POSITION AND REPORT IT:*
  #pad(left: 1.5em, top: 0.5em)[
    #text(style: "italic", size: 14pt)[
      "MY POSITION IS ... DEGREES ... MINUTES NORTH \
      ... DEGREES ... MINUTES EAST"
    ]
  ]
  
  #v(1fr)
  
  *4. SAY WHAT HAPPENED:*
  #pad(left: 1.5em, top: 0.5em)[
    #text(style: "italic", size: 14pt)[
      "WE HAVE ... [Fire / Sinking / Person Overboard / Medical Emergency]"
    ]
  ]
  
  #v(1fr)
  
  *5. WHAT DO YOU WANT?*
  #pad(left: 1.5em, top: 0.5em)[
    #text(style: "italic", size: 14pt)[
      "WE REQUIRE ... [Immediate Rescue / Towing / Medical Advice]" \
      "WE HAVE #(crew.len() + 1) PERSONS ON BOARD."
    ]
  ]
  
  #v(1fr)
  
  *6. SAY "OVER" AND RELEASE THE "PUSH-TO-TALK" BUTTON.*
  
  #v(1fr)
  #align(center)[
    #text(style: "italic", size: 11pt)[No answer? Repeat every 2 minutes. Stay on CH16.]
  ]
]

#pagebreak()

// --- Crew Briefing ---
#heading(level: 1)[Crew Briefing (1/2)]
#v(1em)

#block(width: 100%, stroke: 0.5pt + gray, inset: 1em, fill: luma(245))[
  #text(size: 10pt)[
    *Captain's Tip:* A full briefing can take a significant amount of time. To speed up the process, consider "Stations": Assign each Watch Officer a specific section to explain. The crew can rotate between stations (e.g., Life Saving, Emergency Proc, Yacht Basics) in small groups. This keeps everyone engaged and finishes the briefing much faster.
  ]
]
#v(1em)

#heading(level: 2)[#text(rgb("#8B0000"))[Critical Dangers]]
#v(0.5em)

⚠️ *What can kill YOU:* \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *The Boom:* The most dangerous object on deck—always keep your head down and stay aware during maneuvers. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Jumping:* NEVER jump onto or off the boat! You can easily slip or be crushed between the hull and the dock. Always step carefully. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Falling Overboard:* Stay on board! Use jacklines and harnesses at night or in heavy seas. If you fall in, we might not find you. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Hypothermia:* In 15°C water: 1 min to control breathing (cold shock), 10 mins before swim failure/incapacitation, ~1 hour until unconsciousness. You will die fast. Stay on the ship, do not fall out! \

#v(0.5em)

⚠️ *What can kill the BOAT (thus you):* \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Hitting rocks:* Always monitor the plotter and depth sounder. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Fire:* Be extremely careful with the gas stove. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Water Ingress:* Keep hatches closed underway. \

#v(2em)

#heading(level: 2)[Life Saving Equipment]
#v(0.5em)
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Life Jackets, Harnesses & Jacklines:* Always have it easily accessible, always wear at night and in bad weather. How to clip into jacklines; mandatory on deck at night and sea state ≥4. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Life Raft:* Location, how to release, and when to use. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Pyrotechnics:* Location of rockets/flares/smoke; fire with wind at back, gloves on, only after VHF coordination. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *VHF Radio (DSC):* CH16 monitoring; MAYDAY format. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *EPIRB / SART / PLB:* Check what you have and how to use it. \

#v(2em)

#heading(level: 2)[Emergency Procedures]
#v(0.5em)
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Water Ingress:* Taste test – salty (external leak) or fresh (plumbing). Close seacocks, cut unnecessary power, start bilge pumps, locate source. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *MOB (Man Overboard):* Shout "Man Overboard!", point, MOB button on plotter, throw lifebuoy/light. Approach maneuver – one person commands, others quiet. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Fire:* Alarm, cut source (gas/electric/engine), use correct extinguisher (powder/CO2), shut air supply. Everyone in cockpit in life jackets. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Evacuation:* 1st Officer (EPIRB/Raft), 2nd Officer (Grab-bag/Food/Docs), 3rd Officer (Pyrotechnics/Torches/VHF). Count crew. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Hypothermia:* Watch for shivering/confusion, especially after a MOB. Move below deck, remove wet clothes, warm *gradually* (blankets/sleeping bags/body heat). *No alcohol or hot baths!* \

#pagebreak()

#heading(level: 1)[Crew Briefing (2/2)]
#v(1em)

#heading(level: 2)[Life On Board – Rules]
#v(0.5em)
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Forgive minor faults:* It's a week together; speak directly and calmly. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Watches & Sleeping:* Shared cabins, quiet hours; ALWAYS wake the Captain if in doubt. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Water & Toilets:* Conserve water; follow yacht toilet rules (no paper in the bowl). \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Gas Stove:* Cut source (valve) first, then the burner. Fire extinguisher and blanket ready. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Damage:* Shared responsibility; insurance deposit, but report everything immediately (photos, time, circumstances). \

#v(2em)

#heading(level: 2)[Yacht Basics]
#v(0.5em)
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Docking Drill (Stern Cleat):* Practice two variants. 1: Throw line to helper on dock who catches and blocks. 2: Throw and immediately cleat yourself. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Knots:* Cleat hitch (mooring lines), Bowline (loop). Practice with eyes closed. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Winches:* Line from bottom, 3–4 wraps, "on top", fingers away. Commands: "taking/easing" – confirm loudly. \
#box(width: 1.2em, height: 1.2em, stroke: 1pt + navy, radius: 2pt) #h(0.5em) *Port Maneuvers:* No jokes. Short, loud reports ("stern 2m, drifting left"). Wait for Captain's confirmation. \

// --- Watch Setup & Schedule ---
#pagebreak(to: "even")
#heading(level: 1)[Watch Assignments & Schedule]
#v(1em)

#{
  let ranks = ("1st Officer", "2nd Officer", "3rd Officer")
  for (idx, watch) in watch-assignments.enumerate() [
    - *#watch.officer* (#ranks.at(idx)) #box(width: 1fr, repeat[#text(fill: luma(220))[.]])
    #for m in watch.members [
      #pad(left: 1.5em)[
        - #m #box(width: 1fr, repeat[#text(fill: luma(220))[.]])
      ]
    ]
    #v(0.5em)
  ]
}

#v(2em)

#heading(level: 2)[Watch Schedule]
#v(0.5em)
#{
  let hours = ("0000 → 0400", "0400 → 0800", "0800 → 1200", "1200 → 1400", "1400 → 1600", "1600 → 2000", "2000 → 2400")
  let watch-rotation = (1, 2, 3)
  
  table(
    columns: (65pt, ..(1fr,) * hours.len(), 55pt),
    stroke: 0.5pt + gray,
    align: center + horizon,
    inset: (y: 0.4em),
    table.header(
      [*Date*], ..hours.map(h => [#text(size: 9pt, weight: "bold", h)]), [*Galley*]
    ),
    ..for day in range(0, 8) {
      // Calculate dynamic date using duration if available, else empty string
      let label = if start-date != none {
        (start-date + duration(days: day)).display("[weekday repr:short] [day]/[month]")
      } else {
        ""
      }

      let cells = ()
      cells.push([#text(size: 8pt)[#label]])
      for i in range(hours.len()) {
        let watch-num = watch-rotation.at(calc.rem((day + 1) + i - 1, 3))
        let roman-num = if watch-num == 1 { "I" } else if watch-num == 2 { "II" } else { "III" }
        cells.push([#text(size: 9pt)[#roman-num]])
      }
      let galley-watch = calc.rem(day, 3) + 1
      let galley-roman = if galley-watch == 1 { "I" } else if galley-watch == 2 { "II" } else { "III" }
      cells.push([*#text(size: 9pt)[#galley-roman]*])
      cells
    }
  )
}

#v(0.5em)
#block(width: 100%, stroke: 0.5pt + gray, inset: 1em, fill: luma(250))[
  *Legend:*
  - *Hourly Columns:* Assigned watch takes care of all *Navigation Duties* and deck operations during these times.
  - *Galley Column:* Assigned watch is responsible for *Cooking and Cleaning* for the *entire day* (from breakfast until supper, assigned watch is in charge of the kitchen).
]

#pagebreak()

#heading(level: 1)[Log Entry Guidelines]
#v(1em)

This logbook is organized into two-page spreads to make recording our journey easy. The *left page* is where we keep all the technical data—think of it as the boat's "brain" where we track our speed, position, and engine status every hour. The *right page* is the heart of the log; use it like a journal to write down what happened during the day, tell funny stories, note down the weather, or sketch the coastline.

#v(1em)

#heading(level: 2)[How to Fill the Data Columns]
#v(0.5em)
- *Time:* 4-digit military time (e.g., 0830, 1415).
- *Pos (Position):* Use Latitude and Longitude with precision to minutes (e.g., N44°50' E13°48') or write the name of the marina or anchorage if we are stationary.
- *HDG (Current Heading):* Our current compass heading (e.g., 210).
- *Spd (Speed):* Our instantaneous Speed Over Ground (SOG) in knots at the moment of the entry. If surfing waves, estimate a steady average.
- *Log:* The total distance from the boat's log instrument.
- *Wind:* The direction the wind is blowing *from* and speed in knots (e.g., NW 15).
- *Sails:* Use *M* for Main and *J* for Jib. Note reefing like "M1, J1" or "-" if the sails are down.
- *Eng (Engine):* Record the current *RPM* (e.g., 1800) or simply write *OFF*.

#v(1em)

#heading(level: 2)[What MUST be recorded]
#v(0.5em)
- *Watch Change:* The time and initials of who is taking over.
- *Arrivals & Departures:* When we leave or enter a port or anchorage.
- *Changes:* Any time the sails go up/down or the engine RPM changes.
- *Refueling:* Any time we top up the diesel or the fresh water tanks.
- *Checks:* Equipment failures or routine inspections (like battery levels).

// --- Daily Log Pages ---
// Ensure the Day 0 Demo spread stays aligned.
#pagebreak(to: "even")
#heading(level: 1)[Day 0 - Demo Data Page]
#v(0.5em)

#block(height: 94%)[
  #table(
    columns: (45pt, 100pt, 45pt, 45pt, 45pt, 55pt, 60pt, 1fr),
    rows: (auto, ..(1fr,) * 24),
    stroke: 0.5pt + gray,
    align: center + horizon,
    inset: (x: 2pt, y: 0.2em),
    table.header(
      [*Time*], [*Pos*], [*HDG*], [*Spd*], [*Log*], [*Wind*], [*Sails*], [*Eng*],
    ),
    [0800], [Marina Pula], [-], [0.0], [120], [NW 10], [-], [OFF],
    [0830], [Marina Pula], [-], [0.0], [120], [NW 10], [-], [1200],
    [0915], [N44°50' E13°48'], [210], [6.5], [122], [NW 15], [M1, J1], [OFF],
    [1000], [N44°45' E13°45'], [215], [7.0], [127], [NW 18], [M1, J1], [OFF],
    [1130], [N44°38' E13°40'], [210], [5.5], [136], [N 8], [-], [1800],
    [1200], [N44°35' E13°38'], [210], [6.0], [139], [N 5], [-], [1800],
    ..for _ in range(18) { ([], [], [], [], [], [], [], []) }
  )
]

#pagebreak(to: "odd")
#heading(level: 1)[Day 0 - Demo Notes Page]
#v(1em)
#block(width: 100%, height: 85%, stroke: 0.5pt + luma(200), inset: 1.5em)[
  #set text(size: 11pt)
  #v(0.5em)
  09:30 - We tried training man overboard (MOB) maneuvers. Finished with great success on the second attempt! Everyone knows their role now. \
  #align(right)[*-- John Doe*]
  
  #v(0.5em)
  #line(length: 100%, stroke: 0.5pt + luma(200))
  #v(1em)
  
  13:00 - Something funny happened: an Italian fisherman offered us a massive bluefin tuna in exchange for two of our crew members. We considered it for a moment, but decided we needed the hands for the night watch! \
  #align(right)[*-- Captain Name*]
  
  #v(0.5em)
  #line(length: 100%, stroke: 0.5pt + luma(200))
  #v(1em)
  
  18:00 - Anchored in the bay. Crystal clear water. Making dinner now. \
  #align(right)[*-- Crew 1*]
]

#for i in range(1, 9) [
  // Left Page: Log Table (Even Page)
  #pagebreak(to: "even")
  #heading(level: 1)[Day #i - Log]
  #v(0.5em)
  
  // Stretch rows to fill the page (24 hourly slots + header)
  #block(height: 94%)[
    #table(
      columns: (45pt, 100pt, 45pt, 45pt, 45pt, 55pt, 60pt, 1fr),
      rows: (auto, ..(1fr,) * 24), // First row is auto (header), the rest stretch to fill the block
      stroke: 0.5pt + gray,
      align: center + horizon,
      table.header(
        [*Time*], [*Pos*], [*HDG*], [*Spd*], [*Log*], [*Wind*], [*Sails*], [*Eng*],
      ),
      ..for _ in range(24) { ([], [], [], [], [], [], [], []) }
    )
  ]

  // Right Page: Loose Notes (Odd Page)
  #pagebreak(to: "odd")
  #heading(level: 1)[Day #i - Notes]
  #v(1em)
  #block(width: 100%, height: 85%, stroke: 0.5pt + luma(200), inset: 1em)[]
]

#pagebreak(to: "odd")
#v(1fr)
#align(center)[
  #image("favicon.png", width: 2cm)
  #v(1em)
  #text(size: 14pt, weight: "bold")[Belgian Sailing Community] \
  #v(0.5em)
  This logbook template is an open-source community project. \
  If you have feedback, ideas, or want to contribute to future versions, please visit: \
  #v(0.5em)
  #link("https://github.com/nd-dew/sailing-logbook")[*github.com/nd-dew/sailing-logbook*]
]
#v(1fr)


