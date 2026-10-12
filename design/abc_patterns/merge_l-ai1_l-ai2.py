import json
b='C:/Users/user/AppData/Local/Temp/claude/C--Users-user/89bdd44c-0765-4ffb-b2ac-f1791b55fc74/scratchpad/'
for k,n in (('ai1','l-ai1'),('ai2','l-ai2')):
    d=json.load(open(b+'ws_AIPnote/out/%s.json'%n,encoding='utf8'))[:5]
    d+=json.load(open(b+k+'_p2.json',encoding='utf8'))+json.load(open(b+k+'_p3.json',encoding='utf8'))
    json.dump(d,open(b+'ws_AIPnote/out/%s.json'%n,'w',encoding='utf8'),ensure_ascii=False,indent=0)
    pos=[q['correctAnswers'][0] for q in d]
    L=0;S=0;mn=999;bad=[]
    for q in d:
        c=q['choices'];a=q['correctAnswers'][0];ls=[len(x) for x in c]
        if ls[a]==max(ls) and ls.count(max(ls))==1:L+=1
        if ls[a]==min(ls) and ls.count(min(ls))==1:S+=1
        mn=min(mn,len(q['explanation']))
        if len(q['explanation'])<100:bad.append(q['id'])
        if max(ls)-min(ls)>10:bad.append(q['id']+' spread')
    print(n,len(d),pos,'longest',L,'shortest',S,'minexp',mn,bad)
