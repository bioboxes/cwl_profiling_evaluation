cwlVersion: cwl:v1.0

class: CommandLineTool

hints:
 DockerRequirement:
   dockerPull: karoshi/bbx-profiling-evaluation-krona


inputs:
 profile:
   type: File
   label: result of profiling tool
   inputBinding:
     prefix: -input


baseCommand: /usr/local/bin/krona.pl

arguments:
 - prefix: -alias
   valueFrom: input
 - prefix: --output
   valueFrom: $(runtime.outdir)/krona_result.html

outputs:
 chart:
   type: File
   outputBinding:
     glob: krona_result.html
 stdout: stdout
