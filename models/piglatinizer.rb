class PigLatinizer

attr_accessor :phrase

def piglatinize(phrase)
  words = phrase.split(" ")
  vowels = ["a", "e", "i", "o", "u"]
  two_clusters = "bl, br, ch, ck, cl, cr, dr, fl, fr, gh, gl, gr, ng, ph, pl, pr, qu, sc, sh, sk, sl, sm, sn, sp, st, sw, th, tr, tw, wh, wr".split(", ")
  three_clusters = "squ, spr, str".split(", ")
  results = []

  words.collect do |word|
    if vowels.include?(word[0].downcase)
      result = word + "way"
    elsif three_clusters.include?(word[0..2].downcase)
      result = word[3..] + word[0..2] + "ay"
    elsif two_clusters.include?(word[0..1].downcase)
      result = word[2..] + word[0..1] + "ay"
    else
      result = word[1..] + word[0] + "ay"
    end
    results << result
  end
  results.join(" ")
end


end
