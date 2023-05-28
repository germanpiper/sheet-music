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
         "Title"
     }
  meter = \markup {
         \override #'(font-name . "Calibri")
         ""
     }
  arranger = \markup {
         \override #'(font-name . "Calibri")
         "Composer"
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
\time 4/4

    \partial 8 e8
    
    \break
    
    \bar "||" \break

    % Part 2

    

    % Part 3

    

    % Part 4

    






}
  		
  
  



