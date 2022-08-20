
# Crypto4FunKit 📦

**Crypto4FunKit is a Swift Package for people who want to add cryptocurrencies and NFT informations, chart of the crypto's price, and news.**


## API Reference


### fetchCryptoCurrency()
```http
  GET https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=%271h%2C%2024h%2C%207d
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `None` | `CryptoCurrencyModel` |Get the current price of any cryptocurrencies in any supported currencies that you need 🤑 |


### fetchChart(_ id: String, from firstDate: Double, to today: Double = Date().timeIntervalSince1970)

```http
  GET https://api.coingecko.com/api/v3/coins/bitcoin/market_chart/range?vs_currency=usd&from=1392577232&to=1422577232
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id` `from date` `to today` | `String` `Double` `Double` | Get historical market data include price, market cap, and 24h volume within a range of timestamp (granularity auto) 📈|


### fetchNews()

```http 
    GET https://cryptocurrency-news-tracker.herokuapp.com/news
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `none`      | `NewsResponseElement` |  Get news about cryptocurrencies 🗞 |

### fetchNFT(_ timeRange: NftTimeRange)

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `NftTimeRange` | `NFTResponseElement` |  Get NFT with time parameters for see daily, weekly... NFT projects growing or crashing 💥 |



## Authors

- [@Harry-Knight](https://www.github.com/harry-knight)
- [@NylNeuville](https://github.com/NylNeuville)

## Formation

**Follow Swift Basics formation from Mickaël MAS Apple certified trainer for improve your swift learning: [Swift Basics Formation](https://www.apprendre-swiftui.fr/offre-swift-basics?sa=sa0025889476017fbbabc3366b1fa16ab30f469b99)

![Logo](https://user-images.githubusercontent.com/63256761/185762269-af1fd215-21bc-4072-baa3-8aa553955a28.png)


