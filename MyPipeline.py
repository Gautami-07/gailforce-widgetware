import argparse
import time
import logging
import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions
# ### main

def run():
  # Command line arguments
  parser = argparse.ArgumentParser(description='Read text file from GCS and write to another')
  parser.add_argument('--project', required=True, help='Specify Google Cloud project')
  parser.add_argument('--runner', required=True, help='Specify Apache Beam Runner')
  parser.add_argument('--bucket1', required=True, help='Specify GCS bucket to read from')
  parser.add_argument('--bucket2', required=True, help='Specify GCS bucket to write to')
  parser.add_argument('--region', required=True, help='Specify Google Cloud region')
  parser.add_argument('--stagingLocation', required=True, help='Specify Cloud Storage bucket for staging')
  parser.add_argument('--tempLocation', required=True, help='Specify Cloud Storage bucket for temp')

  opts = parser.parse_args()

  # Setting up the Beam pipeline options
  options = PipelineOptions()
#   options.view_as(PipelineOptions).runner = opts.runner

  # Input and output filenames
  input_file = f'gs://{opts.bucket1}/WidgetwareSample.txt'
  print(input_file)
  output_file = f'gs://{opts.bucket2}/output.txt'
  print(output_file)

  p = beam.Pipeline(options=options)

  lines = (
      p
      | 'ReadFromGCS' >> beam.io.ReadFromText(input_file)
      | 'WriteToGCS' >> beam.io.WriteToText(output_file)
  )

  logging.getLogger().setLevel(logging.INFO)
  logging.info("Building pipeline ...")
  p.run()

if __name__ == '__main__':
  run()
