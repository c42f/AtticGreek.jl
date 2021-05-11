function splitdiphthongvowel(s)
    re = Regex("($ATTIC_DIPHTHONGS)([$ATTIC_VOWELS])")
    replace(s, re => s"\1 \2")
end

function splitvoweldiphthong(s)
    re = Regex("([$ATTIC_VOWELS])($ATTIC_DIPHTHONGS)")
    replace(s, re => s"\1 \2")
    
end



"""Split between upsilon and a following vowel other than iota.

$(SIGNATURES)

θύειν splits as "θυ ειν"
"""
function splitupsilonvowel(s)
    upsilonbreakers = "αεου"
    re = Regex("υ([$upsilonbreakers])")
    replace(s, re => s"υ \1")
end




function splitconsonantcluster(s)
    re = Regex("([$ATTIC_VOWELS])([βγδζθκπστφχ][μνβγδζθκλπρστφχ])")
    replace(s, re => s"\1 \2")
end

"""Consonant between two vowels goes with second vowel."""
function splitvcv(s)
    re = Regex("([$ATTIC_VOWELS])([$ATTIC_CONSONANTS])([$ATTIC_VOWELS])")
    replace(s, re => s"\1 \2\3")
end




"""
"""
function syllabify(s, ortho::AtticOrthography)
    nfkc(s) |>
    AtticGreek.rmaccents  |>
    PolytonicGreek.splitmorphemeboundary |>
    PolytonicGreek.splitdiaeresis |> 
    PolytonicGreek.splitmunu  |> 
    PolytonicGreek.splitliqcons |> 
    splitdiphthongvowel |> 
    splitvoweldiphthong |>  
    #=
    splitshortvowelvowel |> 
    splitlongvowelvowel |> 
    =#
    splitupsilonvowel |> 
    PolytonicGreek.splitdoubleconsonants |> 
    splitconsonantcluster |>
    splitvcv |>   splitvcv |> # catch overlap
    split
end