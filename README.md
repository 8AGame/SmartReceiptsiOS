# Smart Receipts

> Save time tracking expenses and get back to what matters

![SmartReceipts](SmartReceipts/Images.xcassets/AppIcon.appiconset/icon180.png)

[![Build Status](https://travis-ci.com/wbaumann/SmartReceiptsiOS.svg?branch=master)](https://travis-ci.com/wbaumann/SmartReceiptsiOS)

Turn your phone into a receipt scanner and expense report generator with [Smart Receipts](https://www.smartreceipts.co/)! With Smart Receipts, you can track your receipts and easily generate beautiful PDF and CSV reports.

Download Smart Receipts on the Apple AppStore:

- [Smart Receipts](https://itunes.apple.com/us/app/smart-receipts/id905698613?ls=1&mt=8). The free version of the app, but it also supports an in-app purchase subscription.

The free and plus versions versions are identical, except the plus version offers the following enhancements:

- The paid version has no ads
- The paid version supports automatic backups to Google Drive
- The paid version automatically processes exchange rate conversions
- The paid version allows you to automatically break down prices by category/payment method in your reports
- The paid version allows you to edit/customize the pdf report footer (by default, it is "Report Generated with Smart Receipts")

## Table of Contents

- [Smart Receipts](#smart-receipts)
  - [Table of Contents](#table-of-contents)
  - [Guide](#guide)
  - [Features](#features)
  - [Install](#install)
  - [Donate](#donate)
  - [Contribute](#contribute)
  - [Continuous Integration](#continuous-integration)
  - [License](#license)

## Guide

Curious about how Smart Receipts works? Check out our usage guide:

- [https://www.smartreceipts.co/guide](https://www.smartreceipts.co/guide)

Or watch out [YouTube video series](https://www.youtube.com/watch?v=bd9RcOq0nAE&list=PLXMTwjaz9mUJMQN2Y3IXNc_vxjWCKIc66).

## Features

- [X] Create expense report "folders" to categorize your receipts
- [X] Take receipt photos with your camera's phone
- [X] Import existing pictures on your device
- [X] Import PDF receipts 
- [X] Save receipt price, tax, and currency
- [X] Tag receipt names, categories, payment method, comments, and other metadata
- [X] Create/edit/delete all receipt categories
- [X] Track distance traveled for mileage reimbursement
- [X] Automatic exchange rate processing
- [X] Smart prediction based on past receipts
- [X] Generate PDF, CSV, & ZIP reports
- [X] Fully customizable report output
- [ ] Automatic backup support via Google Drive
- [X] OCR support for receipt scans
- [ ] Graphical breakdowns of spending per category
- [ ] Cross-organization setting standardization

## Install

To install, clone or pull down this project. Once you the code on your machine, be sure to install [cocoapods](https://cocoapods.org/) and then run the following command:

```bash
pod install
```

Please note that it will **NOT** work out of the box, so you will need to add the following files to ensure it will compile:

- `SmartReceipts/GoogleService-Info.plist`. This needs to be added to both the free and plus favors at the root level in order for Firebase to function. Please [refer to the Firebase documentation](https://firebase.google.com/) for more details.
- `SmartReceipts/Service Account.json`. This is is used for Firebase crash reporting.
- `SmartReceipts/GADConstants.m`. This is required to display AdMob advertisments. Replace this with an empty string to prevent ads from loading successfully.
- `SmartReceipts/Secrets.swift`. This is used for low usage "secret" keys that are secret enough that I do not wish to place them in GitHub but are not so secret that they need to be removed from the compiled IPA entirely.

Once these files are included, you should be able to successfully compile, build, unit test, and run the app!

## Donate

If you like our project, please consider donating:

- **BTC:** [3MGikseSB69cGjUkJs4Cqg93s5s8tv38tK](https://www.blockchain.com/btc/address/3MGikseSB69cGjUkJs4Cqg93s5s8tv38tK)
- **ETH:** [0xd5F9Da6a4F9c93B12588D89c7F702a0f7d92303D](https://etherscan.io/address/0xd5F9Da6a4F9c93B12588D89c7F702a0f7d92303D)

## Contribute

Contributions are always welcome! Please [open an issue](https://github.com/wbaumann/SmartReceiptsiOS/issues/new) to report a bug or file a feature request to get started.  

## Continuous Integration

We currently use Travis-CI for our continuous integration in order perform tests against new commits, allowing us to avoid potential regressions. You can monitor the current build status here:

- [https://travis-ci.com/wbaumann/SmartReceiptsLibrary](https://travis-ci.com/wbaumann/SmartReceiptsLibrary)

As we have save a few local API keys (e.g. for ads), we use encrypt a few files in our travis repository. You generate your own encrypted set as follows (note: please install the [Travis CLI client](https://github.com/travis-ci/travis.rb) first):

```bash
$ travis login --pro
$ tar cvf secrets.tar SmartReceipts/GADConstants.m SmartReceipts/GoogleService-Info.plist SmartReceipts/Supporting\ Files/Secrets.swift SmartReceipts/ServiceAccount.json
$ travis encrypt-file secrets.tar --add --pro
$ rm -f secrets.tar
```

This should automatically update our `.travis.yml` for the build.

## License

```none
The GNU Affero General Public License (AGPL)

Copyright (c) 2012-2017 Smart Receipts LLC (Will Baumann)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
```
