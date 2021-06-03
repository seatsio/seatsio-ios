public struct ReportBySelectability: Codable {
    struct ReportContents: Codable {
        let count: Int
        let byCategoryLabel: Dictionary<String, Int>
        let byCategoryKey: Dictionary<String, Int>
    }
    let selectable: ReportContents
    let not_selectable: ReportContents
}