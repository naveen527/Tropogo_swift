//
//  File.swift
//  Tropogo
//
//  Created by NAVEEN on 17/01/21.
//


import Foundation

// MARK: - ForecastDailyRequestModel

struct ForecastDailyRequestModel:Codable {
    
    let lati,longi:Float?
    
}
// MARK: - forecastDailyBody

struct ForecastDailyBody:Codable {
    
}


// MARK: - ForecastDailyResponseModel
struct ForecastDailyResponseModel: Codable {
   // struct ForecastDailyModel: Codable {
        let cloudCover: [Int]?
        let dayOfWeek: [DayOfWeek]?
        let dayOrNight: [DayOrNight]?
        let expirationTimeUTC, iconCode, iconCodeExtend, precipChance: [Int]?
        let precipType: [PrecipType]?
        let pressureMeanSeaLevel: [Double]?
        let qpf, qpfSnow, relativeHumidity, temperature: [Int]?
        let temperatureDewPoint, temperatureFeelsLike, temperatureHeatIndex, temperatureWindChill: [Int]?
        let uvDescription: [UvDescription]?
        let uvIndex: [Int]?
        let validTimeLocal: [String]?
        let validTimeUTC: [Int]?
        let visibility: [Double]?
        let windDirection: [Int]?
        let windDirectionCardinal: [String]?
        let windGust: [JSONNull?]?
        let windSpeed: [Int]?
        let wxPhraseLong: [WxPhraseLong]?
        let wxPhraseShort: [WxPhraseShort]?
        let wxSeverity: [Int]?

        enum CodingKeys: String, CodingKey {
            case cloudCover, dayOfWeek, dayOrNight
            case expirationTimeUTC = "expirationTimeUtc"
            case iconCode, iconCodeExtend, precipChance, precipType, pressureMeanSeaLevel, qpf, qpfSnow, relativeHumidity, temperature, temperatureDewPoint, temperatureFeelsLike, temperatureHeatIndex, temperatureWindChill, uvDescription, uvIndex, validTimeLocal
            case validTimeUTC = "validTimeUtc"
            case visibility, windDirection, windDirectionCardinal, windGust, windSpeed, wxPhraseLong, wxPhraseShort, wxSeverity
        }
    }

    enum DayOfWeek: String, Codable {
        case monday = "Monday"
        case tuesday = "Tuesday"
        case wednesday = "Wednesday"
    }

    enum DayOrNight: String, Codable {
        case d = "D"
        case n = "N"
    }

    enum PrecipType: String, Codable {
        case rain = "rain"
    }

    enum UvDescription: String, Codable {
        case high = "High"
        case low = "Low"
        case moderate = "Moderate"
        case veryHigh = "Very High"
    }

    enum WxPhraseLong: String, Codable {
        case clear = "Clear"
        case mostlyClear = "Mostly Clear"
        case mostlySunny = "Mostly Sunny"
        case partlyCloudy = "Partly Cloudy"
        case sunny = "Sunny"
    }

    enum WxPhraseShort: String, Codable {
        case clear = "Clear"
        case mClear = "M Clear"
        case mSunny = "M Sunny"
        case pCloudy = "P Cloudy"
        case sunny = "Sunny"
    }

    // MARK: - Encode/decode helpers

    class JSONNull: Codable, Hashable {

        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }

        public var hashValue: Int {
            return 0
        }

        public init() {}

        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }


// MARK: - ForecastDailyCurrentModel
struct ForecastDailyCurrentModel: Codable {
   // let cloudCeiling: JSONNull?
    let cloudCoverPhrase, dayOfWeek, dayOrNight: String?
    let expirationTimeUTC, iconCode, iconCodeExtend: Int?
   // let obsQualifierCode, obsQualifierSeverity: JSONNull?
    let precip1Hour, precip6Hour, precip24Hour: Int?
    let pressureAltimeter, pressureChange: Double?
    let pressureMeanSeaLevel, pressureTendencyCode: Float?
    let pressureTendencyTrend: String?
    let relativeHumidity, snow1Hour, snow6Hour, snow24Hour: Int?
    let sunriseTimeLocal: String?
    let sunriseTimeUTC: Int?
    let sunsetTimeLocal: String?
    let sunsetTimeUTC, temperature, temperatureChange24Hour, temperatureDewPoint: Int?
    let temperatureFeelsLike, temperatureHeatIndex, temperatureMax24Hour, temperatureMaxSince7Am: Int?
    let temperatureMin24Hour, temperatureWindChill: Int?
    let uvDescription: String?
    let uvIndex: Int?
    let validTimeLocal: String?
    let validTimeUTC, visibility, windDirection: Int?
    let windDirectionCardinal: String?
   // let windGust: JSONNull?
    let windSpeed: Int?
    let wxPhraseLong, wxPhraseMedium, wxPhraseShort: String?

    enum CodingKeys: String, CodingKey {
        case  cloudCoverPhrase, dayOfWeek, dayOrNight
        case expirationTimeUTC = "expirationTimeUtc"
        case iconCode, iconCodeExtend,precip1Hour, precip6Hour, precip24Hour, pressureAltimeter, pressureChange, pressureMeanSeaLevel, pressureTendencyCode, pressureTendencyTrend, relativeHumidity, snow1Hour, snow6Hour, snow24Hour, sunriseTimeLocal
        case sunriseTimeUTC = "sunriseTimeUtc"
        case sunsetTimeLocal
        case sunsetTimeUTC = "sunsetTimeUtc"
        case temperature, temperatureChange24Hour, temperatureDewPoint, temperatureFeelsLike, temperatureHeatIndex, temperatureMax24Hour, temperatureMaxSince7Am, temperatureMin24Hour, temperatureWindChill, uvDescription, uvIndex, validTimeLocal
        case validTimeUTC = "validTimeUtc"
        case visibility, windDirection, windDirectionCardinal, windSpeed, wxPhraseLong, wxPhraseMedium, wxPhraseShort
        
       // case cloudCeiling,windGust,obsQualifierCode,obsQualifierSeverity
    }
}


// MARK: - ForecastDaily3DaysModel
struct ForecastDaily3DaysModel: Codable {
    let dayOfWeek: [String]?
    let expirationTimeUTC: [Int]?
    let moonPhase, moonPhaseCode: [String]?
    let moonPhaseDay: [Int]?
    let moonriseTimeLocal: [Date]?
    let moonriseTimeUTC: [Int]?
    let moonsetTimeLocal: [String]?
    let moonsetTimeUTC: [Int?]?
    let narrative: [String]?
    let qpf, qpfSnow: [Int]?
    let sunriseTimeLocal: [Date]?
    let sunriseTimeUTC: [Int]?
    let sunsetTimeLocal: [Date]?
    let sunsetTimeUTC: [Int]?
    let temperatureMax: [Int?]?
    let temperatureMin: [Int]?
    let validTimeLocal: [Date]?
    let validTimeUTC: [Int]?
    let daypart: [Daypart]?

    enum CodingKeys: String, CodingKey {
        case dayOfWeek
        case expirationTimeUTC = "expirationTimeUtc"
        case moonPhase, moonPhaseCode, moonPhaseDay, moonriseTimeLocal
        case moonriseTimeUTC = "moonriseTimeUtc"
        case moonsetTimeLocal
        case moonsetTimeUTC = "moonsetTimeUtc"
        case narrative, qpf, qpfSnow, sunriseTimeLocal
        case sunriseTimeUTC = "sunriseTimeUtc"
        case sunsetTimeLocal
        case sunsetTimeUTC = "sunsetTimeUtc"
        case temperatureMax, temperatureMin, validTimeLocal
        case validTimeUTC = "validTimeUtc"
        case daypart
    }
}

// MARK: - Daypart
struct Daypart: Codable {
    let cloudCover: [Int?]?
    let dayOrNight: [String?]?
    let daypartName: [String?]?
    let iconCode, iconCodeExtend: [Int?]?
    let narrative: [String?]?
    let precipChance: [Int?]?
    let precipType: [String?]?
    let qpf, qpfSnow: [Int?]?
    let qualifierCode, qualifierPhrase: [JSONNull?]?
    let relativeHumidity: [Int?]?
    let snowRange: [String?]?
    let temperature, temperatureHeatIndex, temperatureWindChill: [Int?]?
    let thunderCategory: [String?]?
    let thunderIndex: [Int?]?
    let uvDescription: [String?]?
    let uvIndex, windDirection: [Int?]?
    let windDirectionCardinal: [String?]?
    let windPhrase: [String?]?
    let windSpeed: [Int?]?
    let wxPhraseLong: [String?]?
    let wxPhraseShort: [String?]?
}


