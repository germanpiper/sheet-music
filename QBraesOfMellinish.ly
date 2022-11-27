\paper {
  line-width = 26\cm
  
}
#(set-default-paper-size "a4" 'landscape)
#(set-global-staff-size 20)
\include "bagpipe.ly"
\layout {
  
  indent = 0.0\cm
  \context { \Score 
             \with{
        $(add-grace-property 'Voice 'NoteHead 'font-size '-4)
        $(add-grace-property 'Voice 'Slur 'height-limit '1)
        $(add-grace-property 'Voice 'Flag 'font-size '-5)
        $(add-grace-property 'Voice 'Stem 'length '6)
        $(add-grace-property 'Voice 'Beam 'beam-thickness '0.3)
        $(add-grace-property 'Voice 'Beam 'length-fraction '0.5)
        $(add-grace-property 'Voice 'Beam 'shorten '1)
      }
             \remove "Bar_number_engraver" }
}

\header {
  title = \markup {
         \override #'(font-name . "Trajan Pro")
         "The Braes of Mellinish"
     }
  meter = \markup {
         \override #'(font-name . "Calibri")
         "Jig"
     }
  arranger = \markup {
         \override #'(font-name . "Calibri")
         "traditional"
     }
  tagline = ""
}


{
    \hideKeySignature
    \time 6/8

    % Part 1

    \partial 8 e8
    \repeat volta 2 {
      \grg a8 \grd a \gre a \grg a8 \grd a \gre a
      \thrwd d4 c8 \grg b8 \grd G \grd b
      \grg a8 \grd a \gre a \grg a8 \grd a \gre a
      \dblg g4 f8 \dble e4 A8
      \break
      \grg a8 \grd a \gre a \grg a8 \grd a \gre a
      \thrwd d4 c8 \grg b8 \grd G \grd b
      \gbirl a4 A8 e8 \grg a e
      d8 \gre G \grd b \gbirl a4
    }
    \break

    % Part 2

    \repeat volta 2 {
      \grd b8
      \dble e4 d8 \grg c8 \grd a \grd c
      \thrwd d4 c8 \grg b8 \grd G \grd b
      \dble e4 d8 \grg c8 \grd a \grd c
      \grg c8 A e \grg c8 \grd a \grd c
      \break
      \dble e4 d8 \grg c8 \grd a \grd c
      \thrwd d4 c8 \grg b8 \grd G \grd b
      \gbirl a4 A8 e8 \grg a e
      d8 \gre G \grd b \gbirl a4
    }
    \break

    % Part 3

    \repeat volta 2 {
      \grd b8
      \gbirl a4 e8 \grg e4 \grip e8
      d8 \gre G d \grg b8 \grd G \grd b
      \gbirl a4 e8 \grg e4 \grip e8
      \grg f4 \grip f8 \grg e4 \grip e8
      \break
      \grg f4 \grip f8 \grg e4 \grip e8
      d8 \gre G d \grg b8 \grd G \grd b
      \gbirl a4 A8 e8 \grg a e
      d8 \gre G \grd b \gbirl a4
    }
    \break

    % Part 4

    \repeat volta 2 {
      \grd b8
      \gbirl a4 A8 ~ A4 \grip A8
      g4 \grip g8 \grA b8 \grd G \grd b
      \gbirl a4 A8 ~ A4 \grip A8
      g4 \grip A8 ~ A4 \grip A8
      \break
      g4 \grip A8 ~ A4 \grip A8
      g4 \grip g8 \grA  b8 \grd G \grd b
      \gbirl a4 A8 e8 \grg a e
      d8 \gre G \grd b \gbirl a4
    }
  }