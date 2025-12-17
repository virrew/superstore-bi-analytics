import pandas as pd
from sqlalchemy import create_engine

from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
DATA_PATH = BASE_DIR / "data" / "processed" / "superstore_clean.csv"


engine = create_engine(
    "postgresql://username:password@localhost:5432/superstore"
)

df = pd.read_csv(DATA_PATH)

print("Rows:", len(df))
print("Columns:", df.shape[1])



