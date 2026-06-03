import re

file_path = r"c:\Users\신민석\dev\fm26-rte\fm26-rte-tauri\src-tauri\src\comparisons.rs"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

def add_players_to_block(pa, position, strength, players):
    global content
    pattern = r'(comparison_ref!\(\s*' + str(pa) + r',\s*\d+,\s*' + position + r',\s*' + strength + r',\s*\[)'
    
    # build replacement string
    # we just append them to the beginning of the list
    new_items = "".join([f'\n            ("{name}", "{nation}"),' for name, nation in players])
    replacement = r'\1' + new_items
    
    if re.search(pattern, content):
        content = re.sub(pattern, replacement, content)
    else:
        print(f"Warning: Block {pa} {position} {strength} not found!")

# 150-159 Defender additions
# Put them roughly into Technical/Mental/Physical
add_players_to_block(150, "Defender", "Technical", [
    ("나가토모 유토", "일본"),
    ("이영표", "대한민국"),
])
add_players_to_block(150, "Defender", "Mental", [
    ("마티아스 긴터", "독일"),
    ("벤 데이비스", "웨일스"),
])
add_players_to_block(150, "Defender", "Physical", [
    ("세르주 오리에", "코트디부아르"),
    ("엘세이드 히사이", "알바니아"),
])

# 150-159 Midfielder additions
add_players_to_block(150, "Midfielder", "Technical", [
    ("기성용", "대한민국"),
    ("이강인", "대한민국"),
    ("카마다 다이치", "일본"),
])
add_players_to_block(150, "Midfielder", "Mental", [
    ("주앙 무티뉴", "포르투갈"),
    ("엑토르 에레라", "멕시코"),
    ("하세베 마코토", "일본"),
])
add_players_to_block(150, "Midfielder", "Physical", [
    ("엔도 와타루", "일본"),
    ("그라니트 자카", "스위스"),
])

# 150-159 Forward additions
add_players_to_block(150, "Forward", "Technical", [
    ("이청용", "대한민국"),
    ("미나미노 타쿠미", "일본"),
])
add_players_to_block(150, "Forward", "Mental", [
    ("황의조", "대한민국"),
    ("티무 푸키", "핀란드"),
])
add_players_to_block(150, "Forward", "Physical", [
    ("라울 히메네스", "멕시코"),
    ("메흐디 타레미", "이란"),
    ("알렉산다르 미트로비치", "세르비아"),
])

# 160-169 additions
add_players_to_block(160, "Defender", "Physical", [
    ("도마고이 비다", "크로아티아"),
    ("니콜라스 오타멘디", "아르헨티나"),
])
add_players_to_block(160, "Defender", "Mental", [
    ("스테판 리히트슈타이너", "스위스"),
])
add_players_to_block(160, "Midfielder", "Technical", [
    ("카가와 신지", "일본"),
    ("클린트 뎀프시", "미국"),
])
add_players_to_block(160, "Forward", "Mental", [
    ("구자철", "대한민국"),
    ("하비에르 에르난데스", "멕시코"),
])

with open(file_path, "w", encoding="utf-8") as f:
    f.write(content)

print("Added diverse players successfully.")
