import scispacy
import spacy
import en_ner_bc5cdr_md
from scispacy.abbreviation import AbbreviationDetector
from scispacy.umls_linking import UmlsEntityLinker


class MedicalNER:
    def __init__(self):
        self.tagger = en_ner_bc5cdr_md.load()
        self.abbreviation_pipe = AbbreviationDetector(self.tagger)
        self.tagger.add_pipe(self.abbreviation_pipe)
        self.linker = UmlsEntityLinker(resolve_abbreviations=True,
                                       max_entities_per_mention=1)
        self.tagger.add_pipe(self.linker)
        print('NER Module Ready')

    def getTags(self, text):
        res = self.tagger(text)
        entity = res.ents
        tags = []
        for i in range(len(entity)):
            for umls_ent in entity[i]._.umls_ents:
                tags.append(self.linker.umls.cui_to_entity[umls_ent[0]])
                # print(linker.umls.cui_to_entity[umls_ent[0]][1],
                #       " - ", linker.umls.cui_to_entity[umls_ent[0]][2][-1])
                # print(linker.umls.cui_to_entity[umls_ent[0]][4], "\n")
        return tags
