from setuptools import setup, find_packages

setup(
       name='load-csv-to-postgres',
       version='1.0.0',
       packages=find_packages(),
       install_requires=[
           'apache-beam[gcp]',
           'SQLAlchemy',
           'cloud-sql-python-connector[pg8000]',
       ],
)
