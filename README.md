
# Crypto4FunKit 📦

**Crypto4FunKit is a Swift Package for people who want to implement easily cryptocurrencies and NFT informations, chart of the crypto's price, and news.**

<p float="left">
   <img src="https://github.com/Harry-KNIGHT/ImageGifVideoForReadme/blob/main/gifs/ChartViewGif.gif" width="300" height= "649"/>	
   <img src="https://github.com/Harry-KNIGHT/ImageGifVideoForReadme/blob/main/gifs/CryptoListViewGif.gif" width="300" height= "649"/>
</p>
<p float="left">
   <img src="https://github.com/Harry-KNIGHT/ImageGifVideoForReadme/blob/main/gifs/NFTlistgif.gif" width="300" height= "649"/>
   <img src="https://github.com/Harry-KNIGHT/ImageGifVideoForReadme/blob/main/gifs/NewsViewGif.gif" width="300" height= "649"/>
</p>

## FetchCrypto

*fetchCryptoCurrency()* function allows you to fetch 100 cryptocurrencies data as image, currentPrice, price percantage value (24h) and more.

In your ViewModel, initialise a **@Published** empty array corresponsing to **CryptoCurrencyModel** for get the good type returning from the **fetchCryptoCurrency()** function.

```
import Crypto4FunKit

class CryptoViewModel: ObservableObject {
@Published public var cryptoCurrencies: [CryptoCurrencyModel] = [CryptoCurrencyModel]()

	@MainActor func getCryptos() async throws {
		 do {
			 cryptoCurrencies = try await CryptoApi.fetchCryptoCurrency()
		 } catch {
			 print("Error")
		 }
	 }
 }
```
#### Then, you have to use .task on your List view.
```
struct CryptoCurrencyListView: View {
	@EnvironmentObject var crypto: CryptoViewModel

    var body: some View {
		List {
			ForEach(crypto.cryptoCurrencies, id: \.id) { crypto in
				NavigationLink(destination: CurrencyChartView(cryptoCurrency: crypto)) {
					CryptoListRowCellView(cryptoCurrency: crypto)
				}
			}
		}
		.task {
			do {
				try await crypto.getCryptos()
			} catch {
				print("Error \(error.localizedDescription)")
			}
		}
    }
}
```

## FetchCryptoChart

*fetchChart(_ id: String, from firstDate: Double, to today: Double = Date().timeIntervalSince1970)* function allows you to fetch an [[Double]] of crypto price from the id and date in Epoch format.

In your ViewModel, initialise a **@Published** empty array of **[[Double]]** for get the good data for your chart.

```
import Crypto4FunKit

class FetchChartViewModel: ObservableObject, FetchChart {
	@Published var prices: [[Double]] = [[Double]]()
	
	@MainActor func getChart(_ id: String, from firstDate: Double, to today: Double = Date().timeIntervalSince1970) async throws {
		do {
			let data = try await ChartApi.fetchChart(id, from: firstDate)
			prices = data.prices
		} catch {
			print("Error \(error.localizedDescription)")
		}
	}
}

```
#### Then, you have to use use @EnvironmentObject for get your ViewModel data in prices array and use .task on your chart view. 

```
.task {
	do {
		try await fetchChart.getChart(cryptoCurrency.id, from: Date().timeIntervalSince1970 - (Double(EpochUnixTime.month.rawValue) ?? 0))
	} catch {
		print("Error")
	}
}
```



## Authors

- [@Harry-Knight](https://www.github.com/harry-knight)
- [@NylNeuville](https://github.com/NylNeuville)

## Formation

**Follow Swift Basics formation from Mickaël MAS Apple certified trainer for improve your swift learning: [Swift Basics Formation](https://www.apprendre-swiftui.fr/offre-swift-basics?sa=sa0025889476017fbbabc3366b1fa16ab30f469b99)**

![Logo](https://user-images.githubusercontent.com/63256761/185762269-af1fd215-21bc-4072-baa3-8aa553955a28.png)


