import pandas as pd
import numpy as np

# Load large CSV efficiently
df = pd.read_csv(
    "digital_attention_raw.csv",
    parse_dates=["date"],
    low_memory=False
)

print("Raw shape:", df.shape)
print(df.head())
# Remove duplicates (if any)
df = df.drop_duplicates()

# Handle impossible values
df = df[df["minutes_used"] >= 0]
df = df[df["focus_minutes"] >= 0]

# Cap extreme values (outlier control)
df["minutes_used"] = df["minutes_used"].clip(upper=600)
df["notifications"] = df["notifications"].clip(upper=200)
df["context_switches"] = df["context_switches"].clip(upper=100)

print("After cleaning:", df.shape)
# Feature engineering
df["focus_efficiency"] = df["focus_minutes"] / (df["minutes_used"] + 1)
df["distraction_intensity"] = df["context_switches"] / (df["focus_minutes"] + 1)

# Normalize focus rating
df["focus_rating_norm"] = df["focus_rating"] / 5
# Sort for rolling calculations
df = df.sort_values(["user_id", "date"])

# Rolling 7-day averages per user
df["rolling_focus_7d"] = (
    df.groupby("user_id")["focus_minutes"]
      .rolling(7, min_periods=1)
      .mean()
      .reset_index(level=0, drop=True)
)
df.to_csv("digital_attention_cleaned.csv", index=False)

print("Cleaned file saved:", df.shape)
