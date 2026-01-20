import pandas as pd
import numpy as np
from datetime import datetime, timedelta

np.random.seed(42)

num_users = 2000
num_days = 365

apps = [
    ("Instagram", "Social"),
    ("YouTube", "Entertainment"),
    ("WhatsApp", "Social"),
    ("Chrome", "Productivity"),
    ("Spotify", "Entertainment"),
    ("Gmail", "Productivity")
]

start_date = datetime(2025, 1, 1)
records = []

for user in range(1, num_users + 1):
    user_id = f"U{str(user).zfill(4)}"

    for day in range(num_days):
        date = start_date + timedelta(days=day)
        focus_minutes = np.random.randint(30, 300)

        for app, category in apps:
            minutes_used = round(np.random.gamma(2.5, 20), 1)
            notifications = np.random.poisson(5 if category == "Social" else 2)
            context_switches = np.random.poisson(3)
            focus_rating = round(
                max(1, min(5, 5 - context_switches * 0.4 + np.random.normal(0, 0.5))),
                1
            )

            records.append([
                user_id,
                date,
                app,
                category,
                minutes_used,
                notifications,
                context_switches,
                focus_minutes,
                focus_rating
            ])

df = pd.DataFrame(records, columns=[
    "user_id",
    "date",
    "app_name",
    "app_category",
    "minutes_used",
    "notifications",
    "context_switches",
    "focus_minutes",
    "focus_rating"
])

df = df.sample(frac=1).reset_index(drop=True)

df.to_csv("digital_attention_raw.csv", index=False)


print("Excel file created with shape:", df.shape)
