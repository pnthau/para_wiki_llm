import json
from lunar_python import Solar

dates = {}
for month in range(1, 13):
    for day in range(1, 32):
        try:
            solar = Solar.fromYmd(2026, month, day)
            lunar = solar.getLunar()
            solar_str = f"2026-{month:02d}-{day:02d}"
            
            dates[solar_str] = {
                "lunar_date": f"{lunar.getDay()}/{abs(lunar.getMonth())}/{lunar.getYear()}",
                "lunar_year": lunar.getYear(),
                "lunar_month": lunar.getMonth(),
                "lunar_day": lunar.getDay(),
                "lunar_year_ganzhi": lunar.getYearInGanZhi(),
                "lunar_month_ganzhi": lunar.getMonthInGanZhi(),
                "lunar_day_ganzhi": lunar.getDayInGanZhi()
            }
        except Exception:
            pass

with open(r'D:\data\para_wiki_llm\02_Areas\Kinh_Dich\Lunar_Calendar_2026.json', 'w', encoding='utf-8') as f:
    json.dump(dates, f, ensure_ascii=False, indent=4)

print("Lunar calendar 2026 generated successfully.")
