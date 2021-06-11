Locales = {
    -- NUI
    Nui = {
        -- LeftNav
        leftNav = {
            actions = 'Actions',
            savingAccountCont = 'Saving Account',
            creditCardsCont = 'Credit/Debit Cards',
            cryptoCurrencyCont = "Crypto Currency <sup class='text-danger'>HOT</sup>",
            statisticsCont = 'Statistics',
            loggedInTxt = 'Logged As',
            accountIdTxt = 'Account ID:',
        },

        -- Modals
        modals = {
            error = 'Error!',
            success = 'Success!',
            confirm = 'Confirm',
            cancel = 'Cancel',
            continue = 'Continue',

            widtrawModal = {
                header = 'Enter amount to withdraw',
                willget = 'You will get',
                fees = 'Withdrawal fees are currently',
            },

            depoModal = {
                header = 'Enter amount to deposit',
                willget = 'You will deposit',
            },

            transferModal = {
                header = 'Enter amount to transfer',
                willget = 'They will get',
                fees = 'Transfer fees are currently',
            },
            
            cryptosModal = {
                header = 'Enter amount to sell (In $)',
                willget = 'You will sell',
            },
            
            cryptobModal = {
                header = 'Enter amount to buy (In $)',
                willget = 'You will buy',
            }
        },
        
        -- Main Page
        accBalance = 'Account Balance',
        accRevenueLast = 'Revenue (Last 24 Hours)',
        accCards = 'Active Cards',
        accRevenue = 'Account Revenue',
        accQActions = 'Quick Actions',
        Withdraw = 'Withdraw',
        Deposit = 'Deposit',
        Transfer = 'Transfer',
        accCrypt = 'Crypto Currency',
        accCryptBalance = 'BALANCE:',
        accCryptWaller = 'Your Wallet',

        -- Crypto
        cryptPrice = 'BBCOIN PRICE',
        cryptPriceLast = 'BBCoin Price (Last 30 Days)',
        cryptBalance = 'BBCOIN BALANCE',

        -- Saving 
        svingNoAcc = "You don't have Saving Account yet",
        svingCreate = "CREATE ONE",
        svingBalance = "Saving Account Balance",
        svingActions = "Saving Account Actions",

        -- Stats
        stsWithLast = 'Withdrew (Last 24 Hours)',
        stsDepoLast = 'Deposited (Last 24 Hours)',
        stsHeader = 'Statements',
        stsTable = {
            'Account',
            'Source',
            'Action',
            'Amount',
            'Description'
        },

        -- ATM
        atmEnterPin = 'Enter The CreditCard Pin [4 Digits]',
        atmCards = 'Your cards',
        atmBalance = 'Current Balance',

        -- v1.0.3 UPDATE
        daysT = 'Days',
        yesterdayT = 'Yesterday',
        todayT = 'Today',
        currentCashAmount = 'CURRENT CASH AMOUNT',
        currentCash = 'CURRENT CASH',
        popup = {
            toAccess = "To access the",
            bank = 'Banking Menu',
            atm = 'ATM Menu'
        },
    },

    Server = {
        sWithdrawnS = '$ Withdrawn from your account',
        sWithdrawnT = '$ Withdrawn to your Main Account.',
        sDepoT = '$ Deposited to your account.',
        sDepoS = '$ Deposited to your Saving Account',
        sTransT = '$ Transfered to ',
        sTrans_ERR_SRC = 'Error occurred, Source doesn\'t match?',
        sTrans_ERR_IBAN = 'Error occurred, Iban doesn\'t exists',
        sCardNew = 'Created New Credit Card',
    
        sATMWith = 'You withdrew $',
        sATM_ERR_IBAN = 'Wrong IBAN',
        sATM_ERR_LIMIT = 'You passed the Daily Limit',
        sATM_ERR_AMOUNT = 'Wrong amount',
    }
}
