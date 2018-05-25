cwlVersion: cwl:v1.0
class: Workflow
requirements:
  - class: StepInputExpressionRequirement

inputs:
  profile:
    type: File

outputs:
  result:
    type: File
    outputSource: rename/out

steps:
  krona:
    run: krona_core.cwl

    in:
      profile: profile
    out:
      - chart
      - stdout

  rename:
    run: move.cwl
    
    in:
      infile: krona/chart
      outfile:
        valueFrom: "krona_result.html"
    out:
      - out
