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
#(set-default-paper-size "a4landscape" )
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
         "Donald MacLean"
     }
  meter = \markup {
         \override #'(font-name . "Calibri")
         "Reel"
     }
  arranger = \markup {
         \override #'(font-name . "Calibri")
         "PM Peter R. MacLeod"
     }
  tagline = ""
}

ge = { \pgrace { g32[ e] } }
dc = { \pgrace { d32[ c] } }
gf = { \pgrace { g32[ f] } }

{
 \quarterBeaming
  \hideKeySignature
  
  % Part 1
\time 2/2

\repeat volta 2 {
  

    \partial 8 \grg e8
    \gra e8. a16 \grg d8. b16	\grg a16 \grd a8. \gre G8. \grg b16
    \grd b8. d16 \grc d8. e16	\grg b8. \grd G16 \gre G8. e16
    \gra e8. a16 \grg d8. b16	\grg a16 \grd a8. \gre G8. A16
    \grg A8. G16 \grA g8. G16 	\grg a8.[ \grd a16 \gre a8]
    
    \break
}

    % Part 2
    
    \grd b8
    \grg a8.[ A16 \birl a8. A16]	\grg A8. g16 \grA a8. \grg b16
    \grd b8. d16 \grc d8. e16	\grg b8. \grd G16 \gre G8. \grd b16	
    \grg a8.[ A16 \birl a8. A16]	\grg A8. g16 \grA a8. A16
    \grg A8. G16 \grA g8. G16 	\grg a8. \grd a16 \gre a8. \grd b16 \break
    
    \grg a8.[ A16 \birl a8. A16]	\grg A8. g16 \grA a8. \grg b16
    \grd b8. d16 \grc d8. e16	\grg b8. \grd G16 \gre G8. e16
    \gra e8. a16 \grg d8. b16	\grg a16 \grd a8. \gre G8. A16
    \grg A8. G16 \grA g8. G16 	\grg a8.[ \grd a16 \gre a8]
    \bar "||" \break
    
    
    
    
    

    

    % Part 3

    

    % Part 4

    






}
  		
  
  



