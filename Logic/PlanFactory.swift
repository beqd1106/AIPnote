import Foundation

/// 8週間標準カリキュラムをベースに、選択プランの週数へスケールして
/// 週ごとの学習テーマ（ロードマップ）を生成する。
struct WeekGoal: Identifiable, Hashable {
    let id = UUID()
    let week: Int
    let title: String
    let detail: String
    let domains: [ExamDomain]
}

enum PlanFactory {

    /// 完全初心者向け 8週間の標準ロードマップ（生成AIパスポート公式シラバスの5章に沿う）
    private static let baseEightWeeks: [WeekGoal] = [
        .init(week: 1, title: "AIの基礎", detail: "AIの定義／機械学習・ディープラーニング／教師あり・なし学習・強化学習", domains: [.aiBasics]),
        .init(week: 2, title: "AIの種類と歴史", detail: "弱いAI(ANI)と強いAI(AGI)／AIの3度のブーム／シンギュラリティ", domains: [.aiBasics]),
        .init(week: 3, title: "生成AIの仕組み", detail: "GAN・VAE・Transformer／Attention／GPT・BERTの系譜", domains: [.genAI]),
        .init(week: 4, title: "ChatGPTと主要生成AI", detail: "GPTの変遷／RLHF・ハルシネーション／Gemini・Claude・Copilot", domains: [.genAI]),
        .init(week: 5, title: "生成AIの動向", detail: "画像・音声・動画生成／ディープフェイク／RAG／AIエージェント・MCP", domains: [.trends]),
        .init(week: 6, title: "リテラシー・法律・倫理", detail: "セキュリティ／個人情報保護法／著作権・知財／AI社会原則／AI新法", domains: [.ethics]),
        .init(week: 7, title: "プロンプト制作", detail: "LLM／Zero・Few-Shot／実践技法／ビジネス応用／不得意なこと", domains: [.prompt]),
        .init(week: 8, title: "模擬試験と直前対策", detail: "5章横断の模試→間違い集中復習→頻出用語の総仕上げ", domains: ExamDomain.allCases),
    ]

    /// プラン週数に合わせてロードマップを生成する。
    /// 8週以外は週数に応じて圧縮/伸長する（テーマの順序は保つ）。
    static func roadmap(for plan: StudyPlanType) -> [WeekGoal] {
        let weeks = plan.durationWeeks
        if weeks == 8 { return baseEightWeeks }

        var result: [WeekGoal] = []
        for w in 1...weeks {
            // 8週カリキュラム上の対応位置を比例で求める
            let srcIndex = min(baseEightWeeks.count - 1,
                               Int((Double(w - 1) / Double(weeks - 1)) * Double(baseEightWeeks.count - 1)))
            let base = baseEightWeeks[srcIndex]
            result.append(.init(week: w, title: base.title, detail: base.detail, domains: base.domains))
        }
        return result
    }

    /// 現在の経過日数から「今が何週目か」を返す（1始まり）。
    static func currentWeek(startedAt: Date, plan: StudyPlanType, now: Date = .now) -> Int {
        let days = Calendar.current.dateComponents([.day],
            from: Calendar.current.startOfDay(for: startedAt),
            to: Calendar.current.startOfDay(for: now)).day ?? 0
        let week = days / 7 + 1
        return min(max(week, 1), plan.durationWeeks)
    }
}
