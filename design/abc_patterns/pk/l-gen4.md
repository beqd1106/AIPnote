# パケット l-gen4「Transformerの仕組み」 domain=genAI

## 今回作る問題
- 基礎問題 15問: id b-gen4-01, b-gen4-02, b-gen4-03, b-gen4-04, b-gen4-05, b-gen4-06, b-gen4-07, b-gen4-08, b-gen4-09, b-gen4-10, b-gen4-11, b-gen4-12, b-gen4-13, b-gen4-14, b-gen4-15
- 確認問題 0問: id なし

## レッスン本文
2017年に登場し生成AIの基盤となったTransformerと、その中核であるSelf-Attentionを理解します。
### Transformerとは
2017年の論文『Attention Is All You Need』でGoogleの研究者らが提案したモデルで、再帰（RNN）や畳み込み（CNN）を使わず、Attention機構のみで系列内の要素間の関連度を計算します。入力を処理するエンコーダと出力を生成するデコーダから構成され、GPTやBERTの基盤になりました。
### Self-Attentionと位置エンコーディング
Self-Attention（自己注意機構）は、系列内の各単語について同じ系列内の他の全単語との関連度を計算し、文脈を踏まえた表現を得ます。ただし単語の並び順は考慮しないため、位置情報を別途埋め込む位置エンコーディングが必要になります。

## 既存の基礎問題（重複禁止・形式と難易度の手本）

## 既存の確認問題（重複禁止・確認問題の難易度の手本）
- [Transformer] 2017年にGoogleの研究者らが発表した論文「Attention Is All You Need」で提案された「Transformer」の最大の特徴として、最も適切なものはどれか。 → 再帰や畳み込みを使わず、Attention機構のみで要素間の関連度を計算する
- [Transformer] ChatGPTやGPTモデルの中核であり、「Attention（注意機構）」を用いる基盤アーキテクチャはどれですか。 → Transformer
- [Self-Attention] Transformerの中核をなす「自己注意機構（Self-Attention）」の役割として、最も適切なものはどれか。 → ある単語と同じ系列内の他の全単語との関連度を計算し、文脈を踏まえた表現を得る
- [位置エンコーディング] Transformerに「位置エンコーディング（Positional Encoding）」が必要とされる理由として、最も適切なものはどれか。 → Self-Attentionは単語の並び順を考慮しないため、位置情報を別途埋め込むから
- [Transformer] Transformerというアーキテクチャを提案した論文「Attention Is All You Need」について、正しい説明はどれか。 → 2017年にGoogleの研究者らが発表し、Attention機構のみで系列変換を行う手法を提案した
- [Attention] Attention（注意機構）の役割として、最も適切なものはどれですか。 → 入力のどこをどの程度重視するかを計算し、重みを置いて処理する
- [Transformerのアーキテクチャ] オリジナルのTransformerモデルの構造に関する記述として、最も適切なものはどれか。 → 入力を処理するエンコーダと出力を生成するデコーダからなり、各層にSelf-Attentionを持つ
- [Self-Attention] Self-Attention（自己注意機構）の働きに関する説明として、最も適切なものはどれか。 → 各単語について同じ系列内の他の全単語との関連度を計算し、重み付けして表現を更新する
- [位置エンコーディング] Transformerにおいて位置エンコーディング（Positional Encoding）が必要とされる理由として、最も適切なものはどれか。 → Self-Attentionには単語の並び順の情報が含まれず、位置情報を別途与える必要があるから
- [Self-Attention] Self-Attention（自己注意機構）が「それ」「これ」などの指示語を正しく解釈できる理由として、最も適切なものはどれですか。 → 文中の他のすべての語との関連度を計算し、結び付きを捉えるから
- [Transformer] Transformerを提案した2017年の論文の題名として、正しいものはどれですか。 → Attention Is All You Need
- [Transformer] Transformerが従来のRNNに対して持つ利点として、最も適切なものはどれですか。 → 系列を順番に処理する必要がなく並列に計算できるため、大規模な学習を効率よく行える
- [位置エンコーディング] Transformerに位置エンコーディングが必要な理由として、最も適切なものはどれですか。 → Attentionだけでは語の並び順の情報が失われてしまうから
- [Transformer] オリジナルのTransformerの構造に関する説明として、最も適切なものはどれですか。 → エンコーダとデコーダで構成され、翻訳のような変換を行える
- [Self-Attention] 翻訳AIが「その犬はボールを追いかけた。それは疲れていた。」という文を処理する際、「それ」が「犬」を指すことを文中の単語同士の関連度から計算する仕組みを何と呼ぶか。 → Self-Attention（自己注意機構）

## 既存のランダム問題・腕試し（重複禁止）
- [Transformer] Transformerの仕組みに関する説明として、誤っているものはどれか。 → 文章を処理する際、RNNのように必ず1単語ずつ順番に処理しなければならない