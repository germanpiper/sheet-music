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
#(set-global-staff-size 19)
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
         "The Sheepwife"
     }
  meter = \markup {
         \override #'(font-name . "Calibri")
         ""
     }
  arranger = \markup {
         \override #'(font-name . "Calibri")
         "trad. arr. Scots Guards"
     }
  tagline = ""
}

ge = { \pgrace { g32[ e] } }	% custom gracenote definitions - aufrufen mit: \ge
dc = { \pgrace { d32[ c] } }
gf = { \pgrace { g32[ f] } }

{
 \quarterBeaming
  \hideKeySignature
  
  % Part 1
\time 4/4

    \partial 8 A8
    \repeat volta 2 {{b16[ d8. \gre G8. \grd b16] \dble e4 \dblg g4
    \hdbld d8.[ b16 \grG b8. g16] \tdblb b4 \grg b16[ \grd G8.]
    \grg b16[ d8. \gre G8. \grd b16] \dble e4 \dblg g4
    \grA b16[ \grd G8. \grg d8. b16] \dbla a4}}
    \alternative { {\grg a16 \grd G8.} {\dblA A4} } \break
    


    % Part 2
    
    c16[ \grd a8. \grg a16 \grd a8.] \grg c16[ \grd a8. \grg a16 \grd a8.]
    \grg c8.[ \grd a16 \gre a8. \grd c16] \dblb b4 \grg b16 \grd G8.
    \grg c16[ \grd a8. \grg a16 \grd a8.] \grg a16[ \grd a8. \grg c16 \grd a8.]
    \grg b8.[ \grd G16 \gre G8. \grd b16] \dbla a4 \grg a16 \grd G8.
    \break
    \grg c16[ \grd a8. \grg a16 \grd a8.] \grg c16[ \grd a8. \grg a16 \grd a8.]
    \grg c16[ \grd a8. \dble e8. c16] \dblb b4 \grg b16 \grd G8.
    \dblc c4 \gre a8. \grd c16 \grg f8.[ e16 \grg c16 \grd a8.]
    \grA b16[ \grd G8. \grg d8. b16] \dbla a4 \grg a16 \grd G8.
    \section \break

    

    % Part 3
    
    \repeat volta 2 {{\grg b8.[ \grd G16 \gre G8. \grd b16] \dblg g4 \grA f8. e16
    \dbld d8.[ b16 \grG b8. g16] \tdblb b4 \grg b16 \grd G8.
    \grg b8.[ \grd G16 \gre G8. \grd b16] \dblg g4 \grA f8. e16
    \dbld d8.[ G16 \grg b16 \grd G8.] \dbla a4}}
    \alternative { {\grg a16 \grd G8.} {\dblA A4} } \break

    

    % Part 4
    
    c16[ \grd a8. \grg a16 \grd a8.] \grg a16[ \grd a8. \grg c16 \grd a8.]
    \grg a16[ \grd a8. \grg c16 \grd a8.] \dblb b4 \grg b16 \grd G8.
    \grg c16[ \grd a8. \grg a16 \grd a8.] \grg a16[ \grd a8. \grg c16 \grd a8.]
    \dblb b4 \grg b16 \grd G8. \dbla a4 \grg a16 \grd G8.
    \break
    \grg c16[ \grd a8. \grg a16 \grd a8.] \grg a16[ \grd a8. \grg c16 \grd a8.]
    \grg a16[ \grd a8. \grg c16 \grd a8.] \dblb b4 \grg b16 \grd G8.
    \grg c16[ \grd a8. \grg a16 \grd a8.] \dblc c4 \grg c16 \grd a8.
    \dblb b4 \grg b16 \grd G8. \dbla a4 \grg a16 \grd G8.
    \section \break
    
    % Part 5
    
    \repeat volta 2 {{\dblg g4 \grA f8. e16 \thrwd d4 \gre G8. \grd b16
    \dble e4 \dblg g4 \tdblb b4 \grg b16 \grd G8.
    \dblg g4 \grA f8. e16 \thrwd d4 \gre G8. \grd b16
    \grg e16[ g8. \grA d8. b16] \dbla a4}}
    \alternative { {\grg a16 \grd G8.} {\dblA A4} } \break
    
    % Part 6 
    
    \hdblc c4 \grg c16 \grd a8. \dbla a4 \grg c16 \grd a8.
    \dblc c4 \grg c16 \grd a8. \dblb b4 \grg b16 \grd G8.
    \dblc c4 \grg c16 \grd a8. \dbla a4 \grg c16 \grd a8.
    \dblb b4 \grg b16 \grd G8. \dbla a4 \grg a16 \grd G8.
    \break
    \dblc c4 \grg a8. \grd c16 \grg f8.[ e16 \grg c16 \grd a8.]
    \grg c16[ e8. \grg a8. \grd c16] \dblb b4 \grg b16 \grd G8.
   \dblc c4 \grg a8. \grd c16 \grg f8.[ e16 \grg c16 \grd a8.]
    \grg b16[ \grd G8. \grg d8. b16] \dbla a4 \grg a16 \grd G8.
    \fine
    
    
    

    






}
  		
  
  



