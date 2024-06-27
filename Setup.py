from setuptools import setup, find_packages

setup(
       name='load-csv-to-postgres',
       packages=find_packages(),
       install_requires=[
           'apache-beam[gcp]',
           'google-cloud-sql',
           'sqlalchemy',
       ],
)
