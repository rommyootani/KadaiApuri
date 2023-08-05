//
//  DateFormatter.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 4/08/23.
//

import Foundation

let itemFormatter: DateFormatter = {
    /// DateFomatterクラスのインスタンス生成
    let formatter = DateFormatter()
    /// カレンダー、ロケール、タイムゾーンの設定（未指定時は端末の設定が採用される）
    formatter.calendar = Calendar(identifier: .gregorian)
    formatter.locale = .japan
    formatter.timeZone = .japan
    /// 変換フォーマット定義（未設定の場合は自動フォーマットが採用される）
    formatter.dateFormat = Constants.DateFormat.japanStandard
    return formatter
}()
