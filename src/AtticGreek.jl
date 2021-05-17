module AtticGreek

using Unicode 

using Orthography
import Orthography: codepoints
import Orthography: tokentypes

using PolytonicGreek
import PolytonicGreek: syllabify
import PolytonicGreek: accentword
import PolytonicGreek: sortWords
import PolytonicGreek: vowels
import PolytonicGreek: consonants
import PolytonicGreek: rmaccents

using Documenter, DocStringExtensions

export AtticOrthography
export atticGreek, vowels, consonants
export tokenizeAtticGreek
export sortWords # Need to republish this in Polytonic Greek
export accentword

export rmaccents
export syllabify


include("ortho.jl")
include("constants.jl")
include("dictionaries.jl")
include("accents.jl")
include("syllabify.jl")
include("simplecategories.jl")

end # module