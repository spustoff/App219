//
//  AnalystsViewModel.swift
//  App219
//
//  Created by IGOR on 16/10/2023.
//

import SwiftUI

final class AnalystsViewModel: ObservableObject {
    
    @AppStorage("SF") var SF: Int = 0
    @AppStorage("UF") var UF: Int = 0
    @AppStorage("TF") var TF: Int = 0
    @AppStorage("NR") var NR: Int = 0
    @AppStorage("RA") var RA: Int = 0
    
    @Published var analysts_list: [AnalystsModel] = [
    
        AnalystsModel(name: "Igor Ivanov", time_ago: "20 min ago", title: "The dollar is stormy!", text: """

I present to your attention the trading plan drawn up within the framework of the BTrade trading system

"BTrade" is a trading system with proven efficiency, which is based on the use of objective market data, such as volumes and margin requirements.

All data for analysis is taken from the largest North American financial derivatives market CME Group (Chicago Commodity Exchange Group).

Analysis of the current situation in the forex market, preparation of forecasts and trading recommendations for the next trading session on instruments: EUR/USD;GBP/USD; AUD/USD; NZD/USD; USD/CHF; USD/CAD; USD/JPY

* comprehensive analysis of 7 trading instruments traded on CME GROUP;
* practical trading recommendations for opening transactions;
* definition of movement targets for each tool.

"""),
        AnalystsModel(name: "Lesha Svik", time_ago: "30 min ago", title: "We are waiting for the development of the dollar rollback to the area of 95 rubles in the coming days", text: """

On Friday, the ruble switched to consolidation to key currencies, and volatility, as well as trade activity, sharply decreased - market participants preferred not to take active action against the background of rallying oil and understanding the possible impact of the implementation of the Decree of the President of the Russian Federation on mandatory foreign exchange earnings on the balance of demand and supply of currency.
In turn, on the last day of the week, the government approved the procedure and minimum norms for exporters subject to the decree: companies, starting from November 16, within 60 days from the date of receipt of funds, credit at least 80% of all foreign currency received to accounts in Russian banks, and within two weeks - to sell at least 90% of revenues on the domestic market. This creates fears that if exporting companies implement the requirements "at a minimum" (we hope not, given the approach of tax payments and low trading volumes), the situation in the foreign exchange market may not improve significantly at least in the coming days.
We believe that our current target range of 95-98.5 rubles will remain relevant in the coming days. We still believe that the dollar is more likely to slide towards its lower boundary.

"""),
        AnalystsModel(name: "Niletto Svik", time_ago: "43 min ago", title: "Weekly Forex market review from October 16 to 20", text: """

Forex market overview by instruments: EUR/USD, USD/CAD, XAU/USD,XAG/USD, GBP/USD, USD/CHF, USD/JPY, NZD/USD, AUD/USD, S&P 500,Dow Jones Industrial Average, NASDAQ, USD/RUB, EUR/RUB, CNY/RUB, USD index, Brent, WTI, natural gas, wheat, corn, coffee, copper, BTC/USD.

Last week brought a number of interesting movements in the foreign exchange market. The quotations of the USD/JPY pair have changed especially actively, thanks to positive economic reports from the United States, which supported the dollar. The EUR/USD pair continued its fall against the background of the difficult economic situation in Europe. Gold (XAU/USD) showed growth due to increasing geopolitical tensions, which contributed to the demand for safe assets.

USD/JPY:
The dollar to yen may continue to rise next week. This may be due to good news about the state of the American economy or positive statements from the American Central Bank. If the course can overcome the level of 150.00, it may reach the level of 152.00.

XAU/USD:
Due to the current geopolitical tensions and the possible soft policy of the American Central Bank, the price of gold may continue to rise. If the price overcomes the level at 1960.00, the next target may be 2000.00.


"""),
        AnalystsModel(name: "Oleg Miami", time_ago: "65 min ago", title: "Russian and American markets, Forex, Metals, Cryptocurrency. Forecast for 16.10 - 20.10", text: """

Elliott wave analytics on instruments: Bitcoin, Ether, RTS, MICEX, Sberbank, Rosneft (MCX:ROSN), Japanese Yen, Euro, Dollar Index, Australian Dollar, New Zealand Dollar, Pound, Canadian Dollar, Franc, Krone, Gold, Silver, Brent Oil, Gas, S&P500 Index, Dow Index, Tesla (NASDAQ:TSLA), Amazon (NASDAQ:AMZN), Nikkei, Dollar ruble, Euro ruble.

Timecodes:

00:00 - Introduction, 02:01 - Ether and Bitcoin. 06:16 - Rosy market. Introduction, 07:55 - Sberbank, 10:36 - Rosneft, 11:34 - MICEX, 12:30 - RTS, 13:08 - Oil, 15:06 - Gas, 16:39 - Russian rubles, 17:30 - Krone. 18:26 - Dollar Index, 20:03 - Euro, 21:20 - Australian Dollar, 22:58 - New Zealand Dollar, 24:18 - Yen, 25:22 - Franc, 27:16 - Pound, 28:20 - Canadian Dollar, 29:11 - Gold and Silver, 31:37 - Tesla, 32:47 - S&P 500, 34:10 - Dow, 35:17 - Nikkei, 36:37 - Amazon, 37:09 - DAX, 38:54 - Apple (NASDAQ:AAPL)

"""),
        AnalystsModel(name: "Artem Dzyuba", time_ago: "63 min ago", title: "The ruble sharply strengthened, but could not continue", text: """
    
The ruble at the beginning of Friday's trading was actively cheaper: the dollar approached yesterday's top of 98 rubles. Soon the Russian currency began to quickly return the lost positions, reaching a moderate plus. By now, the ruble has lost some of its daily achievements.
The mandatory sale of export proceeds is unlikely to provide direct support to the ruble, except psychological, cooling the speculative demand for foreign currency and stimulating its sale by participants who do not fall under this measure. The decision was made recently, it is likely that some period will be necessary to establish the appropriate administrative infrastructure. This is due to the introduction of special officials, representatives of the state in companies, announced within the framework of this currency control rule, who will monitor its compliance.
The Chinese yuan (CNY/RUB) against the ruble is traded in a symbolic plus, unlike small losses of the American currency. Against its background, the Hong Kong dollar (HKD/RUB) paired with the ruble is in a comparable minus, increasing our revaluation to 1.1% against the US dollar compared to their foreign ratio (USD/HKD pair).
The Russian debt market is trying to develop a powerful rebound of the previous session. The RGBI government bond index is rising moderately, correcting the almost non-stop decline in the second half of September. The likely stabilization of the ruble exchange rate is positive for debt instruments. A possible rise in the price of the national currency will reduce the risks of accelerating inflation, which will allow the Central Bank to avoid another increase in the key rate.

"""),
        AnalystsModel(name: "Nikolay Baskov", time_ago: "65 min ago", title: "US dollar: 'flight' with Gold for investors' attention and deals today!", text: """

Many traders, wanting to enter the market at the best price, use different ways to find an entry point, but there is a consensus, and it boils down to the border of the current trend. Thus, knowing the location of the boundary of the current trend at any given time, the trader sees the best price for trading, both in the continuation of this trend and on the change of trend.

I present to your attention the boundaries of current trends in the main quotes for OCTOBER 13, 2023:

EUR/USD: 1.0630 - downtrend boundary
GBP/USD: 1.2325 - downtrend boundary
AUD/USD: 0.6310 - uptrend boundary
NZD/USD: 0.5885 - uptrend boundary
USD/JPY: 149.80 - downtrend boundary
USD/CHF: 0.8990 - uptrend boundary
USD/CAD: 1.3575 - uptrend boundary
USD/RUB: 92.00 - the limit of the upward (long-term) trend
EUR/RUB: 100.50 - the boundary of the upward (long-term) trend
GOLD: 188.00 - the boundary of the uptrend
WTI: 82.00 - uptrend boundary

This video is dedicated to the demonstration of the trading plan for the main quotes (EUR/USD, GBP/USD, AUD/USD, USD/JPY, USD/CHF, USD/CAD, EUR/RUB and USD/RUB) for the next day

"""),
    ]
    
    @AppStorage("like_items") var like_items: [String] = []
    @AppStorage("dislike_items") var dislike_items: [String] = []
    @AppStorage("archive_items") var archive_items: [String] = []
    
    func isHas(model: AnalystsModel, type: FavoritesType) -> Bool {
        
        switch type {
        case .like:
            return like_items.contains(model.title)
        case .dislike:
            return dislike_items.contains(model.title)
        case .archive:
            return archive_items.contains(model.title)
        }
    }
    
    func favoritesManager(model: AnalystsModel, type: FavoritesType) {
        
        switch type {
            
        case .like:
            if like_items.contains(model.title) {
                
                if let indexer = like_items.firstIndex(of: model.title) {
                    
                    like_items.remove(at: indexer)
                }
                
            } else {
                
                like_items.append(model.title)
            }
            
        case .dislike:
            if dislike_items.contains(model.title) {
                
                if let indexer = dislike_items.firstIndex(of: model.title) {
                    
                    dislike_items.remove(at: indexer)
                }
                
            } else {
                
                dislike_items.append(model.title)
            }
            
        case .archive:
            if archive_items.contains(model.title) {
                
                if let indexer = archive_items.firstIndex(of: model.title) {
                    
                    archive_items.remove(at: indexer)
                }
                
            } else {
                
                archive_items.append(model.title)
            }
        }
    }
}
