import scispacy
import spacy
import en_ner_bc5cdr_md
from scispacy.abbreviation import AbbreviationDetector
from scispacy.umls_linking import UmlsEntityLinker

nlp = en_ner_bc5cdr_md.load()

abbreviation_pipe = AbbreviationDetector(nlp)
nlp.add_pipe(abbreviation_pipe)
linker = UmlsEntityLinker(resolve_abbreviations=True,
                          max_entities_per_mention=1)
nlp.add_pipe(linker)

text = "Ibuprofen is good for all kinds of fever and pain."

res = nlp(text)

entity = res.ents
print(entity)

for i in range(len(entity)):
    for umls_ent in entity[i]._.umls_ents:
        # print(linker.umls.cui_to_entity[umls_ent[0]])
        print(linker.umls.cui_to_entity[umls_ent[0]][1],
              " - ", linker.umls.cui_to_entity[umls_ent[0]][2][-1])
        print(linker.umls.cui_to_entity[umls_ent[0]][4], "\n")
