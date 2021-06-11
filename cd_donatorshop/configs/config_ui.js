// The name of your currency
const CONFIG = {
    credit_sign:"$"
}
// Use locales to adjust the UI to your language
const LOCALE = {
    "user_information":"User information",
    "donator_shop":"Donator Shop",

    "balance":"Balance: ",
    "total":"Total: ",

    "your_order":"Your order",

    "button_remove":"Remove",
    "button_add":"Add",
    "button_checkout":"Checkout",
    "button_order":"Order",
    "button_back":"Back",
    "button_close":"Close",

    "alert_no_items":"You haven't got this item in your order list.",
    "alert_no_balance":"You have insufficient balance on your account!",
    "alert_remove_ltz":"You cannot remove {{n}} items",

    "tooltip_copy":"Click to copy!"
}
// Pages are links at the bottom of the donator shop which allow users to view custom-made data.
// We suggest pages to explain how to make a purchase, how to claim it, introduce them to your terms and conditions, refund policies and so on.
const PAGES = [
    {
        "title":"How To",
        "body":"",
    },
    {
        "title":"Terms of Service",
        "body":"",
    },
    {
        "title":"Refund Policy",
        "body":"",
    },
    {
        "title":"Privacy Policy",
        "body":"",
    },
    // This is an example of what can be done.
    // Feel free to remove it if you wish :)
    {
        "title":"About",
        "body":`<h1 class="display-4">Donatorshop <small class="text-muted">by Codesign</small></h1>
        <p class="text-center">
        Codesign is a team of developers creating and distributing UI-based scripts.<br/>Our work is tested, upgraded, and improved daily!<br/>View more on our Discord, or send us a message at codesign.scripts@gmail.com 
      </p>
      <ul class="list-group list-group-flush text-dark shadow">
  <li class="list-group-item">Current version: <span class="text-muted">v1.0.0</span></li>
  <li class="list-group-item">Version date: <span class="text-muted">30.01.2021.</span></li>
  <li class="list-group-item">Release date: <span class="text-muted">30.01.2021.</span></li>
  <li class="list-group-item">Website link <a href="https://codesign.pro">https://codesign.pro</a></li>
  <li class="list-group-item">Discord link <a href="https://discord.gg/codesign">https://discord.gg/codesign</a></li>
</ul><p class="small text-muted text-right">Codesign Scripts 2021 &copy; All Rights Reserved</p>`,
    }
]