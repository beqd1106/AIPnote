import SwiftUI

/// 生成AIパスポート試験（GUGA）のシラバス5章に対応する出題分野。
/// シラバス：2026年2月試験より適用版（design/syllabus_genai_passport_2026.txt）。
///   第1章 AI（人工知能） / 第2章 生成AI / 第3章 現在の生成AIの動向 /
///   第4章 情報リテラシー・基本理念とAI社会原則 / 第5章 テキスト生成AIのプロンプト制作と実例
/// ※各章の配点比率は公式に非公表のため、学習項目の分量からの近似値。
///   最新情報・出題範囲は必ず公式サイト（guga.or.jp）で確認すること。
enum ExamDomain: String, CaseIterable, Codable, Identifiable {
    case aiBasics   // 第1章 AI（人工知能）
    case genAI      // 第2章 生成AI
    case trends     // 第3章 現在の生成AIの動向
    case ethics     // 第4章 情報リテラシー・法律・倫理
    case prompt     // 第5章 プロンプト制作と実例

    var id: String { rawValue }

    /// 出題比率の近似値（模試の出題配分・合格可能性スコアに使用）。合計1.0。
    var weight: Double {
        switch self {
        case .aiBasics: return 0.20
        case .genAI:    return 0.22
        case .trends:   return 0.16
        case .ethics:   return 0.22
        case .prompt:   return 0.20
        }
    }

    var title: String {
        switch self {
        case .aiBasics: return "AI（人工知能）"
        case .genAI:    return "生成AI"
        case .trends:   return "生成AIの動向"
        case .ethics:   return "情報リテラシー・法律・倫理"
        case .prompt:   return "プロンプト制作"
        }
    }

    var shortTitle: String {
        switch self {
        case .aiBasics: return "AI基礎"
        case .genAI:    return "生成AI"
        case .trends:   return "動向"
        case .ethics:   return "倫理・法律"
        case .prompt:   return "プロンプト"
        }
    }

    /// 章番号（1〜5）。UI表示・並び順に使用。
    var chapterNumber: Int {
        switch self {
        case .aiBasics: return 1
        case .genAI:    return 2
        case .trends:   return 3
        case .ethics:   return 4
        case .prompt:   return 5
        }
    }

    /// 配点を百分率の整数で（UI表示用）
    var weightPercent: Int { Int((weight * 100).rounded()) }

    var color: Color {
        switch self {
        case .aiBasics: return Theme.navy
        case .genAI:    return Theme.blue
        case .trends:   return Theme.teal
        case .ethics:   return Theme.orange
        case .prompt:   return Theme.purple
        }
    }

    var systemIcon: String {
        switch self {
        case .aiBasics: return "brain.head.profile"
        case .genAI:    return "sparkles"
        case .trends:   return "chart.line.uptrend.xyaxis"
        case .ethics:   return "checkmark.shield.fill"
        case .prompt:   return "keyboard.fill"
        }
    }
}
