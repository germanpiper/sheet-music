barLength = #(define-music-function (parser location x y) (number? number?) #{
    \set Score.measureLength = #(ly:make-moment x y)
#})
% Used when substituting a single bar or just a few notes to show alternative.
altBracket = #(define-music-function (parser location tag) (string?) #{
    \once \override Score.VoltaBracket.shorten-pair = #'(0.3 . 0.3)
    \set Score.repeatCommands = #(list (list 'volta (markup #:number tag)))
#})
altBracketText = #(define-music-function (parser location tag) (string?) #{
    \once \override Score.VoltaBracket.shorten-pair = #'(0.3 . 0.3)
    \set Score.repeatCommands = #(list (list 'volta (markup #:text tag)))
#})

% End previous altBracket thingy.
altBracketEnd = { \set Score.repeatCommands = #'((volta #f)) }

markMark = #(define-music-function (parser location text) (markup?) #{
    \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
    \mark $text
#})
%hier oben kommen Zusatzdefinitionen von svenax hin!!!

% Tipps&Tricks:

%bei unvollständigen Takten (wiederholungen etc) cadenzaOff am betreffenden Taktanfang!!!
%manual repeats:     \bar ".|:"   


\paper {
  line-width = 26\cm
  ragged-right = ##f
  
}
#(set-default-paper-size "a4landscape")
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
         "The Smith of Chillichassie"
     }
  meter = \markup {
         \override #'(font-name . "Calibri")
         ""
     }
  arranger = \markup {
         \override #'(font-name . "Calibri")
         "arr. Scots Guards"
     }
  tagline = ""
}

ge = { \pgrace { g32[ e] } }	% custom gracenote definitions - aufrufen mit: \ge
dc = { \pgrace { d32[ c] } }
gf = { \pgrace { g32[ f] } }

{
 \halfBeaming
  \hideKeySignature
  
  % Part 1
\time 2/2

\repeat volta 2 {
  {\grg a8.[ \grd a16 \gre a8. \grd b16]	\dble e4 \grg a8. e16	
    \thrwd d4 \gre G8. d16	\grg b16[ \grd b8. \grg b16 \grd G8.]
    \grg a8.[ \grd a16 \gre a8. \grd b16]	\dble e4}
}
\alternative {
  {\grg a8. e16	
    \thrwd d4 \gre G8. \grd b16 \grg a16[ \grd a8. \grg a16 \grd G8.]}
  {\grg a8. \grd b16
    \dblg g4 \grA d8. b16 \grg a16[ \grd a8. \grg a16 \grd G8.]}
} \break

%................................

\repeat volta 2 {
  {\dblg g4 \grA f8. g16 A8.[ e16 \grg f8. d16] 
    \dblg g4 \grA f16 g8. \grA b16[ \grd b8. \grg b16 \grd G8.]
    \dblg g4 \grA f8. g16 A8.[ e16 \grg f8. d16] }
}
\alternative {
  {
    \dblg g4 \grA d8. b16 \grg a16[ \grd a8. \grg a16 \grd G8.]}
  {
    \grg e16[g8. \grA d8. b16] \grg a16[ \grd a8. \grg a16 \grd G8.]}
}

%................................

    \repeat volta 2 {
      {\grg a16[ \grd a8. d16 \gre a8.] \grg b16[ \grd a8. d16 \gre a8.]
      \grg a16[ \grd a8. d16 \gre a8.] \grg b16[ \grd b8. \grg b16 \grd G8.]
      \grg a16[ \grd a8. d16 \gre a8.] \grg b16[ \grd a8. d16 \gre a8.]
      \grg b16[ e8. \grg d8. b16] \grg a16[ \grd a8. \grg a16 \grd G8.]}
    } \break

\repeat volta 2 {
  {\dblg g4 \grA f8. e16 \grg e8.[ A16 \grg A8. e16]
    \dblg g4 \grA f16 g8. \grA b16[ \grd b8. \grg b16 \grd G8.]
    \dblg g4 \grA f8. e16}
}
\alternative {
  {\grg e8.[ A16 \grg A8. e16]
    \grA g8.[e16 \grg d8. b16] \grg a16[ \grd a8. \grg a16 \grd G8.]}
  {\grg f8.[ g16 A8. f16]
    \grg e16[g8. \grA d8. b16] \grg a16[ \grd a8. \grg a16 \grd G8.]}
} \break

%................................

    \grg a8.[ \grd a16 \gre a8. \grd b16] \gbirl a4 \dble e
    \grg a8.[ \grd a16 \gre a8. d16] \grg b16[ \grd b8. \grg b16 \grd G8.]
     \grg a8.[ \grd a16 \gre a8. \grd b16] \gbirl a4 \dble e8. a16
     \grg b16[ e8. \grg d8. b16] \grg a16[ \grd a8. \grg a16 \grd G8.]
     \break
    
    %------------------------------------------------------------------------------------------------
    
    \grg a8.[ \grd a16 \gre a8. \grd b16] \gbirl a4 \dble e8. a16
    \grg d8.[b16 \grG b8. d16] \grg b16[ \grd b8. \grg b16 \grd G8.]
    \dblg g4 \grA e16 A8. \hdble e4 \grg a8. d16
    \dblb b4 \gre G8. \grd b16 \grg a16[ \grd a8. \grg a16 \grd G8.]
    \bar "||" \break
%................................

   \dblg g4 \grA f8. e16 A4 \grip A8. g16  
   \grA e16[ g8. \grA d16 g8.] \grA b16[ \grd b8. \grg b16 \grd G8.]
   \dblg g4 \grA f8. e16 A4 \grip A8. g16 
   \grA e16[g8. \grA d8. b16] \grg a16[ \grd a8. \grg a16 \grd G8.] \break
   
   \dblg g4 \grA f8. e16 A4 \grip A8. g16  
   \grA e16[ g8. \grA d16 g8.] \grg b16[ \grd b8. \grg b16 \grd G8.]
   \dble e4 \grg a8. \grd b16 \gbirl a4 \dble e8. a16
   \grg e16[g8. \grA d8. b16] \grg a16[ \grd a8. \grg a16 \grd G8.]
    \bar "|." \break






}
  		
  
  



