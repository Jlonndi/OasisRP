Config = {}
Translation = {}

Config.Locale = 'en'

Config.CanEverybodyGiveBills = true
Config.PayBillsTime = {h = 21, m = 00}

Config.Key = 163 -- FiveM Key to open the Billing menu

Config.useDiscordWebhooks = false
Config.Webhooks = {
    ['society_police'] = GetConvar("webhook_police_invoice", "Failed to load webhook error!"),
    ['society_example'] = GetConvar("webhook_example", "Failed to load webhook error!"),
} -- You need to set the Convar in the server.cfg: Just add something like this to the server.cfg: 
-- set webhook_example "https://discordapp.com/api/webhooks/........" <- your webhook link

Config.useNewESX = false
Config.useAccountMoney = true
Config.Account = 'bank'

Translation = {

    ['de'] = {
        ['bills'] = 'Rechnungen',
        ['give_bill'] = 'Rechnung ausstellen',
        ['give_bill_desc'] = 'Stelle eine Rechnung aus',
        ['reason'] = 'Grund:',
        ['insert_reason'] = 'Gebe einen Grund ein',
        ['amount'] = 'Betrag:',
        ['insert_amount'] = 'Betrag eingeben',
        ['submit_bill'] = '~g~Rechnung ausstellen',
        ['taxbills'] = 'Rechnungen in Teilzahlung',
        ['taxbills_desc'] = '~r~Offener Betrag ~s~/ ~o~Gesamt',
        ['private'] = 'Privat',

        ['dialog_title'] = 'Rechnung erhalten',
        ['dialog_accept'] = '~g~Rechnung annehmen',
        ['dialog_reject'] = '~r~Rechnung ablehnen',

        ['bill_paid'] = '~g~Die Rechnung i.H.v. ~w~',
        ['bill_paid2'] = '$ ~g~wurde bezahlt.',
        ['society_bill_paid'] = '~g~Eine von dir ausgestellte Rechnung i.H.v. ~w~',
        ['society_bill_paid2'] = '$ ~g~wurde bezahlt.',

        ['not_enough_money'] = '~r~Du hast nicht genügend Geld!',
        ['bill_given'] = '~g~Anfrage für die Rechnung weitergegeben.',
        ['bill_accepted'] = '~g~Deine Rechnung wurde akzeptiert.',
        ['target_bill_accepted'] = '~g~Du hast die Rechnung akzeptiert.',
        ['bill_rejected'] = '~r~Deine Rechnung wurde abgelehnt.',
        ['target_bill_rejected'] = '~r~Du hast die Rechnung abgelehnt.',

        ['discord_new_invoice'] = 'Neue Rechnung',
        ['discord_msg'] = ' hat ',
        ['discord_msg2'] = ' eine Rechnung i.H.v. ',
        ['discord_msg3'] = '$ für ',
        ['discord_msg4'] = ' ausgestellt.',

        ['paid_taxbill'] = 'Ein Teil deiner Rechnungen wurde ~g~bezahlt~s~ : ~g~$',
    },

    ['en'] = {
        ['bills'] = 'Bills',
        ['give_bill'] = 'Issue an invoice',
        ['give_bill_desc'] = 'Issue an invoice to somebody',
        ['reason'] = 'Reason:',
        ['insert_reason'] = 'Enter a reason',
        ['amount'] = 'Amount:',
        ['insert_amount'] = 'Enter an amount',
        ['submit_bill'] = '~g~Confirm',
        ['taxbills'] = 'Part payment invoices',
        ['taxbills_desc'] = '~r~Remaining amount ~s~/ ~o~Total',
        ['private'] = 'Private',

        ['dialog_title'] = 'Received invoice',
        ['dialog_accept'] = '~g~Accept',
        ['dialog_reject'] = '~r~Reject',

        ['bill_paid'] = '~g~The bill of ~w~',
        ['bill_paid2'] = '$ ~g~was paid.',
        ['society_bill_paid'] = '~g~One of your bills of ~w~',
        ['society_bill_paid2'] = '$ ~g~was paid.',

        ['not_enough_money'] = '~r~You do not have enough money!',
        ['bill_given'] = '~g~Request sent for the invoice.',
        ['bill_accepted'] = '~g~Your bill was accepted.',
        ['target_bill_accepted'] = '~g~You have accepted the bill.',
        ['bill_rejected'] = '~r~Your bill was rejected.',
        ['target_bill_rejected'] = '~r~You have rejected the bill.',

        ['discord_new_invoice'] = 'New invoice',
        ['discord_msg'] = ' has given ',
        ['discord_msg2'] = ' a bill with an amount of ',
        ['discord_msg3'] = '$ for ',
        ['discord_msg4'] = '.',

        ['paid_taxbill'] = 'A part of your remaining invoices was ~g~paid~s~ : ~g~$',
    }
}
