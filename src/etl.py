from pathlib import Path
import pandas as pd

RAW_PATH = Path("data/raw/superstore.xls")
OUT_DIR = Path("data/processed")
OUT_DIR.mkdir(parents=True, exist_ok=True)

def main():
    # Läs in Excel
    df = pd.read_excel(RAW_PATH)

    # Standardisera kolumnnamn (bra för SQL senare)
    df.columns = (
        df.columns
        .str.strip()
        .str.lower()
        .str.replace(" ", "_")
        .str.replace("-", "_")
    )

    print("Rows:", len(df))
    print("Columns:", len(df.columns))
    print("Column names:", list(df.columns))

    # Spara en “raw-to-csv” version (ingen stor cleaning ännu)
    df.to_csv(OUT_DIR / "superstore_raw_export.csv", index=False)
    print("Saved:", OUT_DIR / "superstore_raw_export.csv")

if __name__ == "__main__":
    main()
