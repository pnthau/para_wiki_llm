import json

# Read Lunar Date
with open(r'D:\data\para_wiki_llm\02_Areas\Kinh_Dich\Lunar_Calendar_2026.json', 'r', encoding='utf-8') as f:
    lunar_cal = json.load(f)

today = lunar_cal['2026-07-12']
year_val = 7 # Bính Ngọ (Ngọ = 7)
month_val = today['lunar_month']
day_val = today['lunar_day']
hour_val = 1 # Tý

upper_bagua = (year_val + month_val + day_val) % 8 or 8
lower_bagua = (year_val + month_val + day_val + hour_val) % 8 or 8
moving_line = (year_val + month_val + day_val + hour_val) % 6 or 6

print(f"Lunar Date: {today['lunar_date']}")
print(f"Upper Bagua: {upper_bagua}, Lower Bagua: {lower_bagua}, Moving Line: {moving_line}")
