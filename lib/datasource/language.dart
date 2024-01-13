class Language {
  static String lang(String lang, String string) {
    if (lang == "SW") {
      switch (string) {
        case 'resendingCode':
          return 'Tuma tena kodi: ';
        case 'invoiceTerms':
          return 'Jaza vigezo na masharti: ';
        case 'invoiceTerms3':
          return 'Vigezo na masharti: ';
        case 'noBankDetails':
          return 'Tafadhali kajaze taarifa za invoice';
        case 'newPass':
          return 'Tafadhali weka nenosiri jipya';
        case 'noDemoToast':
          return 'Huwezi kuweka akaunti ya demo';
        case 'deleteUserToast':
          return 'Umefuta akaunti kikamilifu';
        case 'deleteUser':
          return 'Unataka kufuta akaunti?';
        case 'addUsername':
          return 'Jaza jina la akaunti';
        case 'chooseAccount':
          return 'Chagua akaunti';
        case 'addedAccount':
          return 'Umeongeza akaunti kikamilifu';
        case 'enterUsername':
          return 'Jina la akaunti';
        case 'selectAccount':
          return 'Chagua akaunti';
        case 'addAccount':
          return 'Ongeza akaunti';
        case "selectPhone":
          return "Chagua namba";
        case 'getPic':
          return 'Picha';
        case 'selectbluetooth':
          return 'Chagua bluetooth printa';
        case 'priceCheck':
          return 'Tafadhali weka kiasi kinachozidi 50.00 TZS';
        case 'vfdSearchReport':
          return 'Tafuta jina la mteja';
        case 'changeNewPhone':
          return 'Namba mpya';
        case 'changeCurrentPhone':
          return 'Namba ya sasa';
        case 'changePhone':
          return 'Badili namba ya simu';
        case 'cartAlert':
          return 'Tafadhali ongeza bidhaa kutoka kwenye kurasa ya nyumbani';
        case 'dashAmount':
          return 'Risiti: ';
        case 'tahadhariInfo2':
          return 'Una uhakika unataka kubadili neno siri?';
        case 'invoSub2':
          return 'Taarifa za invoice';
        case 'invoSub1':
          return 'Chagua tarehe ya mwisho wa kulipia';
        case 'invoTitle':
          return 'Hakiki invoice';
        case 'saved':
          return 'Imehifadhiwa kwenye simu yako';
        case 'invoiceTotalAmount':
          return 'Jumla kiasi';
        case 'reportCaption2':
          return 'Karibu kutafuta tena';
        case 'reportCaption':
          return 'Hakuna taarifa iliotafutwa';
        case 'getTaxTotal':
          return 'Kodi jumla:';
        case 'getTotal':
          return 'Kiasi jumla:';
        case 'getEX':
          return 'Bila kodi: ';
        case 'titleVerify':
          return 'Orodha ya bidhaa ';
        case 'qntyVerify':
          return 'Idadi: ';
        case 'totalVerify':
          return 'Bei jumla: ';
        case 'verifyPrint':
          return 'Hakiki risiti';
        case 'errorPrint':
          return 'samahani, jaribu tena!';
        case 'receiptOnly':
          return 'Chapisha risiti';
        case 'setlimitSnack':
          return 'Una uhakika unataka kuweka kikomo kwenye VFD cha \nkiasi:   ';
        case 'setDailylimitSnack':
          return 'Una uhakika unataka kuweka kikomo kwenye VFD cha \n risiti:   ';
        case'dashError':
          return 'Samahani, jaribu tena baadae';
        case 'loginNo':
          return 'Badili namba ya kuingia';
        case 'businessNo':
          return 'Badili namba ya biashara';
        case 'dueAmount':
          return 'Kiasi: ';
        case 'dueInfo':
          return 'Una uhakika unataka kutoa invoice ya';
        case 'toaReceipt':
          return 'Toa risiti';
        case 'toaInvoice':
          return 'Toa invoice';
        case 'accName':
          return 'Jina la akaunti ';
        case 'accNUMBER':
          return 'Namba ya akaunti: ';
        case 'S.L.P':
          return 'S.L.P ';
        case 'receiptButton':
          return 'Tafuta Risiti';
        case 'zreportButton':
          return 'Tafuta Z Report';
        case 'dashboard':
          return 'Dashibodi';
        case 'dashTotal':
          return 'Jumla kiasi:';
        case 'dashTransaction':
          return 'Jumla ya miamala:';
        case 'dashSales':
          return 'Mauzo ya VFD';
        case 'invoiceNotes':
          return 'Noti';
        case 'invoiceTerms':
          return 'Vigezo na masharti';
        case 'invoiceTerms2':
          return 'Tafadhali fanya malipo kabla ya tarehe ya kikomo';
        case 'invoiceMethod':
          return 'Fanya malipo kupitia:';
        case 'invoiceMore':
          return 'Tafadhali tuma cheti cha ukamilimisho baada ya malipo';
        case 'invoicePower':
          return 'Imetolewa kwa:';
        case 'invoiceItem':
          return 'Bidhaa';
        case 'invoiceQuantity':
          return 'Idadi';
        case 'invoiceAmount':
          return 'Kiasi';
        case 'invoiceSub':
          return 'Jumla ndogo: ';
        case 'invoiceTax':
          return 'Kodi: ';
        case 'invoiceTotal':
          return 'Jumla: ';
        case 'dueDate':
          return 'TAREHE YA KIKOMO:';
        case 'invoiceDate':
          return 'TAREHE YA INVOICE:';
        case 'invoiceValidity':
          return 'UHALALI WA INVOICE';
        case 'invoiceBill':
          return 'BILI KWA:';
        case 'dashboard2':
          return 'Angalia ripoti ya miamala ya siku';
        case 'VFdDashboard':
          return 'Ubao';
        case 'fillDateSnack':
          return 'Tafadhali weka tarehe ya mwisho kulipa';
        case'changePhoneSnack':
          return 'Una uhakika unataka kubadili namba ya simu?';
        case 'renameVfdSnack':
          return 'Una uhakika unataka kubadili jina la VFD?';
        case 'accountName':
          return 'Tafadhali ingiza jina la akaunti';
        case 'changePassSnack':
          return 'Una uhakika unataka kubadili neno siri la VFD?';
        case 'changePhone':
          return 'Badili namba ya simu';
        case 'accountName':
          return 'Jina la akaunti';
        case 'renameVfd':
          return 'Badili jina la VFD';
        case 'currentName':
          return 'Jina lililopo';
        case 'newName':
          return 'Jina jipya';
        case 'setLimit':
          return 'Weka kikomo';
        case 'currentLimit':
          return 'Kikomo kilichopo';
        case 'newLimit':
          return 'Kikomo kipya';
        case 'noName':
          return 'Hamna jina';
        case 'vfdLimit' :
          return 'Weka kikomo cha kiasi';
        case 'vfdDailyLimit' :
          return 'Weka kikomo cha siku';
        case 'vfdPassword' :
          return 'Badili neno siri';
        case "paymentSearch":
          return "Tafuta akaunti";
        case 'doneSubmit':
          return 'Tayari';
        case 'receipt':
          return 'Risiti';
        case 'perDay':
          return 'kwa siku';
        case 'paymentTitle':
          return 'Ingiza taarifa za malipo';
        case 'accNumber':
          return 'Akaunti namba';
        case 'paymentMethod':
          return 'Njia ya malipo';
        case 'phoneNumber':
          return 'Namba ya simu';
        case 'paymentInfo':
          return 'Taarifa za invoice';
        case 'chaguaBidhaa':
          return 'Chagua bidhaa au huduma';
        case 'vfdInfo':
          return 'Angalia risiti za accounts zengine na kusitisha huduma ya VFD';
        case 'submitReceiptToast':
          return 'Una uhakika unataka kutoa risiti ya bidhaa au huduma?'
              '\n\n Kiasi: TZS ';
        case 'nameServiceProduct':
          return 'Jina la bidhaa au huduma';
        case "receipt1" :
          return 'Jaza taarifa hapo chini ili uweze kutoa risiti yako';
        case 'noProduct':
          return 'Hakuna bidhaa, tafadhali kaweke bidhaa';
        case 'noCustomer':
          return 'Hakuna taarifa za mteja, tafadhali kajaze taarifa';
        case 'customerSearch' :
          return 'Tafuta jina la mteja';
        case 'customerName':
          return 'Jina la mteja';
        case 'cutomerPhone':
          return 'Namba ya mteja';
        case 'customerTitle':
          return 'Ongeza mteja';
        case 'addCustomer':
          return 'Ongeza mteja';
        case 'LengthTinToast':
          return 'TIN number sio sahihi';
        case 'enterNameToast':
          return 'Ingiza jina la mteja';
        case 'loadingMore':
          return 'Inapakua risiti zingine';
        case 'addProduct':
          return 'Weka bidhaa au huduma';
        case 'tahadhariInfo3':
          return 'Una uhakika unataka kufuta bidhaa?';
        case 'acceptCaution' :
          return 'Ndiyo';
        case 'denyCaution':
          return 'Funga';
        case 'productSub':
          return 'Orodha';
        case "productSearch":
          return "Tafuta huduma au bidhaa";
        case 'tahadhariInfo1':
          return 'Una uhakika unataka kubadili nenosiri?';
        case 'tahadhariInfo1':
          return 'Una uhakika unataka kutoa risiti ya bidhaa zilizochaguliwa?';
        case 'tahadhari':
          return 'Tahadhari';
        case 'badiliButton':
          return 'Badili';
        case 'newNumber':
          return 'Ingiza namba mpya';
        case 'Info1':
          return 'Jina la kampuni';
        case 'Info2':
          return 'TIN';
        case 'Info3':
          return 'VRN';
        case 'Info4':
          return 'S.L.P';
        case 'Info5':
          return 'Mtaa';
        case 'Info6':
          return 'Mkoa';
        case 'Info7':
          return 'Nchi';
        case 'Profile1':
          return 'Taarifa zilizopo chini ni ambazo zimewasilishwa kwenye mamlaka ya mapato TRA';
        case 'Profile6':
          return 'Simu ya biashara';
        case 'Profile2':
          return 'Simu ya kuingia';
        case 'Profile3':
          return 'Badili neno siri';
        case 'Profile4':
          return 'Angalia VFD\u0027s zengine ';
        case 'Profile5':
          return 'Ondoka';
        case 'homeSub1':
          return 'Tengeneza orodha ya bidhaa\n moja au zaidi unazotolea risiti';
        case 'homeTitle2':
          return 'Wasiliana nasi';
        case 'homeSub2':
          return 'Bonyeza hapa kuwasiliana nasi\n kwa msaada zaidi';
        case 'homeTitle3':
          return 'Ongeza wateja';
        case 'homeSub3':
          return 'Tengeneza orodha ya wateja\n wako kurahisisha utoaji risiti';
        case 'homeTitle1':
          return 'Weka bidhaa';
        case 'thirdAvatar':
          return 'Bonyeza hapa';
        case 'secondAvatar':
          return 'Tengeneza risiti kiurahisi';
        case 'firstAvatar':
          return 'Sajili Sherehe';
        case "homePage":
          return 'Karibu';
        case 'thibitisha':
          return 'Thibitisha';
        case 'repeatChangePassword':
          return 'Hakiki nenosiri';
        case 'newChangePassword':
          return 'Nenosiri mpya';
        case 'changePassword':
          return 'Badili nenosiri';
        case'forgotpasswordTitle':
          return 'Umesahau nenosiri?';
        case 'confirmOTP':
          return 'Thibitisha';
        case 'info3OTP':
          return 'Tuma kodi tena';
        case 'info2OTP':
          return 'Haujapokea kodi?';
        case 'infoOTP':
          return 'Ingiza kodi uliyotumiwa kwenye simu \nyako kwa namba';
        case 'titleOTP':
          return 'Thibitisha namba';
        case 'kitambulisho':
          return 'Kitambulisho (NIDA, Passport nk)';
        case 'chetiVAT':
          return 'Cheti cha VAT (Kama umesajiliwa)';
        case 'chetiTIN':
          return 'Cheti cha TIN';
        case 'infoFinish':
          return 'Maliza';
        case 'infoNext':
          return 'Endelea';
        case'enterPhone':
          return 'Ingiza namba yako';
        case'registerTitle2':
          return 'Fungua akaunti bure';
        case 'registerTitle1':
          return 'Jisajili';
        case 'loginTitle':
          return 'Tafadhali ingiza taarifa zako';
        case 'infoSub4':
          return 'Tuma kiurahisi risiti kwa mteja kupitia sms pia toa risiti kwa kutumia EFD printer';
        case 'infoTitle4':
          return 'Tuma, hifadhi au toa risiti';
        case 'infoSub3':
          return 'Kupitia akaunti moja mtu zaidi ya mmoja anaweza kutoa risiti kwa wateja pia unaweza kuwa na akaunti zaidi ya moja kwa biashara moja';
        case 'infoTitle3':
          return 'Tengeneza risiti kwa zaidi ya simu moja';
        case 'infoSub2':
          return 'Toa risit kwa wateja wako kila siku kwa mwaka mzima kwa malipo ya mara moja';
        case 'infoTitle2':
          return 'Risiti bila kikomo mwaka mzima';
        case 'infoSub1':
          return 'Tengeneza risiti kiurahisi kupitia app yetu pia uweze kuwatumia wateja wako kupitia simu yako';
        case 'infoTitle1':
          return 'Tunakusaidia kutoa risiti kiurahisi';
        case "changingPasswordToast":
          return "Nenosiri linabadilishwa, Tafadhali subiri..";
        case "sms_text_part_one":
          return "inashukuru sana kwa kutumia huduma zao";
        case "sms_text_part_two":
          return "Pakua risiti kwa kubofya";
        case "sms_text_part_three":
          return "Toa risiti za TRA kwa simu janja yako, pakua SMART EFD APP au tembelea https://www.smartefd.co.tz/";
        case "send_sms_button":
          return "TUMA SMS";
        case "sms_sent_toast":
          return "SMS Imetumwa kikamilifu!";
        case "addProductOrService":
          return "Weka bidhaa/huduma";
        case "manageVfd":
          return "Tazama VFD's Zingine";
        case "customerVfd":
          return "Orodha ya VFD's";
        case "vfdReport":
          return "Ripoti";
        case "vfdReportBtn":
          return "RIPOTI YA VFD";
        case "loading":
          return "Tafadhali subiri...";
        case "chooseLanguage":
          return "Chagua lugha";
        case "changeLanguage":
          return "Badili lugha";
        case "changePassword":
          return "Badili Nenosiri";
        case "languageToast":
          return "Tafadhali, chagua lugha ili kuendelea";
        case "next":
          return "Endelea";
        case "yes":
          return "Ndiyo";
        case "no":
          return "Hapana";
        case "areYouSure":
          return "Hakikisha";
        case "confirmTitle":
          return "Hakiki";
        case "confirmDesc":
          return "Una uhakika unataka kutoa risiti hii ya Tsh";
        case "confirmDescSelect":
          return "Una uhakika unataka kutoa risiti ya bidhaa zilizochaguliwa";
        case "exitApp":
          return "unataka kutoka Smart EFD?";
        case "loginButton":
          return "Ingia";
        case "registerButton":
          return "Jisajili";
        case "loginButton":
          return "Ingia";
        case "signUp":
          return "Jisajili";
        case "welcomeBackText":
          return "Karibu tena ! Ingia na hati zako";
        case "reports":
          return "Ripoti";
        case "receipt":
          return "Risiti";
        case "profile":
          return "Wasifu";
        case "dateFrom":
          return "Tarehe ya kwanza";
        case "dateTo":
          return "Tarehe ya mwisho";
        case "congratulation":
          return "Hongera";
        case "phone":
          return "Namba ya simu";
        case "password":
          return "Nenosiri";
        case "confirmPassword":
          return "Rudia nenosiri";
        case "haveNoAccount":
          return "Hauna akaunti?";
        case "clickToRegister":
          return "Jisajili sasa";
        case "haveAccount":
          return "Tayari una akaunti?";
        case "clickToSignIn":
          return "INGIA";
        case "clickHere":
          return "Bonyeza hapa";
        case "createAccountItsFree":
          return "Fungua akaunti, ni bure!";
        case "enterTinToast":
          return "TIN haiwezi kuwa wazi";
        case "tinLengthToast":
          return "TIN uliyoingiza sio sahihi";
        case "enterPhoneToast":
          return "Jaza nambari ya simu";
        case "enterPasswordToast":
          return "Tafadhali jaza nenosiri";
        case "enterConfirmPasswordToast":
          return "Tafadhali rudia nenosiri";
        case "passwordsDoNotMatch":
          return "Umekosea nenosiri la sasa, tafadhali rudia tena";
        case "invalidPhoneNumberToast":
          return "Namba ya simu sio sahihi";
        case "accountExpired":
          return "Akaunti imeisha muda wake";
        case "search":
          return "RIPOTI YA RISITI";
        case "fillInDateFrom":
          return "Ingiza tarehe ya kwanza";
        case "fillInDateTo":
          return "Ingiza tarehe ya mwisho";
        case "regId":
          return "Namba ya usajiri";
        case "vrn":
          return "Namba ya VRN";
        case "phone":
          return "Simu";
        case "address":
          return "Posta";
        case "street":
          return "Mtaa";
        case "city":
          return "Mkoa";
        case "country":
          return "Nchi";
        case "signOut":
          return "Toka";
        case "addProduct":
          return "Chagua bidhaa/huduma";
        case "listProductsSelected":
          return "Hakuna Bidhaa/Huduma iliyochaguliwa";
        case "addedProducts":
          return "Bidhaa/Huduma zilizochaguliwa";
        case "productSelectText":
          return "[--Chagua--]";
        case "productSelectedToast":
          return "Bidhaa/Huduma hii imeshachaguliwa";
        case "product":
          return "Bidhaa au huduma";
        case "addProductTitle":
          return "Weka Bidhaa/Huduma";
        case "addProductToast":
          return "Weka bidhaa/huduma";
        case "noDataFound":
          return "Hakuna taarifa iliyopatikana!";
        case "taxGroup":
          return "Kundi la kodi";
        case "productDesc":
          return "Bidhaa";
        case "qnty":
          return "Idadi (Mf. 10)";
        case "qntyToast":
          return "Tafadhali jaza idadi ya bidhaa";
        case "amount":
          return "Bei ya kimoja (Tsh)";
        case 'customerNameOption':
          return "Jina la mteja(Sio lazima)";
        case "customerName":
          return "Jina la mteja (Sio lazima)";
        case "customerPhone":
          return "Simu ya Mteja (Sio lazima)";
        case "sendSMS":
          return "- Tuma SMS";
        case "customerTIN":
          return "TIN ya mteja (Sio lazima)";
        case "customerVRN":
          return "VRN ya mteja (Sio lazima)";
        case "submitButton":
          return "Toa risiti";
        case "doneButton":
          return "Tayari";
        case "enterAmountToast":
          return "Tafadhali jaza kiasi";
        case "enterProductToast":
          return "Tafadhali jaza bidhaa";
        case "totalSales":
          return "Mauzo Jumla (Tsh)";
        case "totalTax":
          return "Total VAT";
        case "tax":
          return "VAT";
        case "save":
          return "Hifadhi & Tuma";
        case "print":
          return "Chapisha";
        case "searchPrinter":
          return "Inatafuta..";
        case "printAllReceiptBtn":
          return "Printi Risiti Zote";
        case "vfdSerialNo":
          return "VFD serial No";
        case "vfdReceiptList":
          return "VFD Risiti";
        case "cancel":
          return "Ghairi";
        case "saveToGallery":
          return "Hifadhi kwenye Galari";
        case "servicePricing":
          return "Gharama ya huduma";
        case "close":
          return "Funga";
        case "weWillCommunicate":
          return "Asante kwa kujiunga na Smart EFD.";
        case "forMoreInfo":
          return "Kwa mawasiliano, taarifa zaidi na kutuma viambatanisho unaweza kutupigia au whatsapp kwa";
        case "successCreateAccount":
          return "Umefanikiwa kutengeneza akaunti yako";
        case "whatIsNeeded":
          return "Kinachohitajika";
        case "charges":
          return "Malipo";
        case "freeSubscribeText":
          return "Kujiunga na huduma ya Smart EFD ni bure";
        case "paymentText":
          return "Mhudumu wetu atawasiliana na wewe kukupa maelekezo ya jinsi ya kulipa";
        case "payNumberPay":
          return "Lipa kwa kutumia LIPA NAMBA XXXX";
        case "whatIsNeededDesc":
          return "Cheti cha TIN, Cheti cha VAT (Kama umesajiliwa), na Kitambulisho";
        case "downloadLetter":
          return "Pakua barua hapa";
        case "issueReceipt":
          return "Toa risiti mwaka mzima \nAkaunti moja kwa simu zako zote";
        case "annually":
          return "Kila mwaka";
        case "saveMoney":
          return "Okoa pesa";
        case "year":
          return "Mwaka";
        case "loginRegisterTitle":
          return "Rahisi na Nafuu";
        case "TINDigits":
          return "TIN inatakiwa kuwa na idadi ya namba 9";
        case "noRecordFoundToast":
          return "Hakuna taarifa iliyopatikana";
        case "noPrinteround":
          return "Tafadhali washa kifaa cha kuchapisha";
        case "blueMessage":
          return "Tafadhali washa bluetooth, washa lokesheni na unganisha na printa yako kisha ujaribu tena kuprint";
        case "helpMessage":
          return "Kwa masaada piga";
        case "share":
          return "Shea";
        case "currentPassword":
          return "Nenosiri la sasa";
        case "newPassword":
          return "Nenosiri mpya";
        case "reEnterNewPassword":
          return "Hakiki nenosiri ";
        case "enterCurrentPasswordToast":
          return "Tafadhali ingiza nenosiri la sasa";
        case "enterNewPasswordToast":
          return "Tafadhali ingiza nenosiri mpya";
        case "repeatNewPasswordToast":
          return "Tafadhali rudia nenosiri mpya";
        case "passwordMatchSignUpToast2":
          return "Nenosiri mpya hazijafanana";
        case "passwordChangedSuccessfully":
          return "Nenosiri limebadilishwa kikamilifu!";
        case "passwordChangedFailed":
          return "Nenosiri halijabalishwa kikamilifu!";
        case "okButton":
          return "Sawa";
        case "shareMessage":
          return "Tuma";
        case "tryDemo":
          return "Jaribu kutumia";
        case "checking":
          return "Inahakikisha ..";
        case "successChecking":
          return "Imefanikiwa ..";
        case "verifyingCode":
          return "Tafadhali subiri, inathibitisha nambari ..";
        case "codeVerifiedSuccessfully":
          return "Nambari ya kuthibitisha imefaulu";
        case "processingRequest":
          return "Tafadhali subiri..";
        case "verificationCodeTitle":
          return "Nambari ya uthibitisho";
        case "verificationCodePhoneEnding":
          return "Nambari ya kuthibitisha imetumwa kwa nambari ya simu inayoisha";
        case "verificationCodeEmailEnding":
          return "au kwa barua pepe";
        case "clearAll":
          return "Anza upya";
        case "enterVerificationCodeToast":
          return "Tafadhali ingiza nambari ya uthibitisho";
        case "resetPasswordTitle":
          return "Weka upya Nenosiri";
        case "newPass":
          return "nenosiri mpya";
        case "reEnterNewPass":
          return "Hakikisha nenosiri mpya";
        case "passwordChangeSuccess":
          return "Umefanikiwa kubadili neno siri";
        case "passwordChangeFailure":
          return "Haijafanikiwa. \n'\n Ombi lako la kuweka upya neno la siri halikufaulu. Tafadhali jaribu tena";
        case "enterNewPassToast":
          return "Tafadhali ingiza nenosiri mpya";
        case "enterRepeatNewPassToast":
          return "Tafadhali rudia nenosiri jipya";
        case "passwordMatchSignUpToast":
          return "Nenosiri hazijafanana";
        case "forgotPassword":
          return "Umesahau nenosiri?";
        case "clickToEnterVerificationCode":
          return "Bonyeza kuingiza nambari ya uthibitishaji";
        case "resetPassword":
          return "Weka Upya Nenosiri";
        case "invalidVerificationCode":
          return "Namba ya uthibitisho sio sahihi";
        case "okButton":
          return "SAWA";
        case "changeCustomerPhone":
          return "Badili Namba ya Simu";
        case "internetConnectionToast":
          return "Tafadhali unganisha na intaneti kuendelea.!";
        case "confirmDelete":
          return "Una uhakika unataka kufuta taarifa hii?";
        case "confirmActivate":
          return "Una uhakika unataka kuwezesha VFD hii?";
        case "confirmDeactivate":
          return "Una uhakika unataka kuzima VFD hii?";
        case "devicesList":
          return "Orodha ya Vifaa";
        case "removeDevice":
          return "Ondoa Kifaa";
        case "areYouSureYouWantToRemoveThisDevice":
          return "Una uhakika unataka kuondoa hiki kifaa?";
        case "yes":
          return "Ndiyo";
        case "no":
          return "Hapana";
        case "deviceRemovedSuccesfully":
          return "Kifaa Kimeondolewa";
        case "accept":
          return "Nafahamu";
        case "reject":
          return "Sifahamu";
        default:
          return "";
      }
    }

    if (lang == "EN") {
      switch (string) {
        case 'invoiceTerms':
          return 'Enter terms and conditions: ';
        case 'invoiceTerms3':
          return 'Terms and conditions: ';
        case 'resendingCode':
          return 'Send code in: ';
        case 'noBankDetails':
          return 'Please fill invoice details';
        case 'newPass':
          return 'Enter a new password please';
        case 'noDemoToast':
          return 'You cannot add a demo account';
        case 'deleteUserToast':
          return 'You have deleted account successfully';
        case 'deleteUser':
          return 'You want to delete user?';
        case 'addUsername':
          return 'Enter username';
        case 'chooseAccount':
          return 'Choose an account';
        case 'addedAccount':
          return 'Account has been added successfully';
        case 'enterUsername':
          return 'Username';
        case 'selectAccount':
          return 'Switch account';
        case 'addAccount':
          return 'Add account';
        case 'getPic':
          return 'Photo';
        case 'selectbluetooth':
          return 'Select bluetooth printer';
        case 'priceCheck':
          return 'Please enter amount greater than 50.00 TZS';
        case 'vfdSearchReport':
          return 'Search customer name';
        case 'cartAlert':
          return 'Please add products from your homescreen';
        case 'dashAmount':
          return 'Receipt: ';
        case 'invoSub2':
          return 'Invoice information';
        case 'invoSub1':
          return 'Choose due date';
        case 'invoTitle':
          return 'Verify invoice';
        case 'saved':
          return 'saved on your phone';
        case 'reportCaption2':
          return 'You\u0027re welcome to search again';
        case 'reportCaption':
          return 'No search done';
        case 'getTaxTotal':
          return 'Total tax:';
        case 'getTotal':
          return 'Total amount: ';
        case 'getEX':
          return 'Tax Exc: ';
        case 'titleVerify':
          return 'Product list ';
        case 'verifyPrint':
          return 'Verify receipt';
        case 'totalVerify':
          return 'Total price: ';
        case 'qntyVerify':
          return 'Quantity: ';
        case 'errorPrint':
          return 'sorry, Please try again!';
        case 'receiptOnly':
          return 'Print rreceipt';
        case'dashError':
          return 'Sorry, please try again later';
        case 'loginNo':
          return 'Change login number';
        case 'businessNo':
          return 'Change business number';
        case 'dueAmount':
          return 'Amount: ';
        case 'dueInfo':
          return 'Are you sure you want to make an invoice of';
        case 'toaReceipt':
          return 'Print receipt';
        case 'toaInvoice':
          return 'Print invoice';
        case 'accNUMBER':
          return 'Account number: ';
        case 'S.L.P':
          return 'P.O.Box';
        case 'receiptButton':
          return 'Search Receipt';
        case 'zreportButton':
          return 'Search Z Report';
        case 'dashboard':
          return 'Dashboard';
        case 'dashTotal':
          return 'Total amount';
        case 'dashTransaction':
          return 'Transaction count:';
        case 'dashSales':
          return 'VFD sales';
        case 'invoiceNotes':
          return 'Notes';
        case 'invoiceTerms':
          return 'Term and conditions';
        case 'invoiceTerms2':
          return 'Please make the payment by the due date';
        case 'invoiceMethod':
          return 'Make payments through:';
        case 'invoiceMore':
          return 'Please send the confirmation slip after payment';
        case 'invoicePower':
          return 'Powered by:';
        case 'invoiceItem':
          return 'Item';
        case 'invoiceQuantity':
          return 'Quantity';
        case 'invoiceAmount':
          return 'Amount';
        case 'invoiceTotalAmount':
          return 'Total amount';
        case 'invoiceSub':
          return 'Sub Total: ';
        case 'invoiceTax':
          return 'Tax: ';
        case 'invoiceTotal':
          return 'Total: ';
        case 'dueDate':
          return 'DUE DATE:';
        case 'invoiceDate':
          return 'INVOICE DATE:';
        case 'invoiceValidity':
          return 'INVOICE VALIDITY:';
        case 'invoiceBill':
          return 'BILL TO:';
        case 'dashboard2':
          return 'Check your daily transaction report';
        case 'VFdDashboard':
          return 'Dashboard';
        case 'fillDateSnack':
          return 'Please fill in payment due date';
        case'changePhoneSnack':
          return 'Are you sure you want to change phone number?';
        case 'setlimitSnack':
          return 'Are you sure you want to set VFD limit to\n\n Amount: ';
        case 'setDailylimitSnack':
          return 'Are you sure you want to set VFD limit to\n\n  ';
        case 'setLimit':
          return 'Please set current limit';
        case 'renameVfdSnack':
          return 'Are you sure you want to change VFD name?';
        case 'accountNameSnack':
          return 'Please enter account name';
        case 'changePassSnack':
          return 'Are you sure you want to change VFD password?';
        case 'changeNewPhone':
          return 'New phone number';
        case 'changeCurrentPhone':
          return 'Current phone number';
        case 'changePhone':
          return 'Change phone number';
        case 'accountName':
          return 'Account name';
        case 'renameVfd':
          return 'Change VFD name';
        case 'currentName':
          return 'Current name';
        case 'newName':
          return 'New name';
        case 'setLimit':
          return 'Set Limit';
        case 'currentLimit':
          return 'Current limit';
        case 'newLimit':
          return 'New Limit';
        case 'noName':
          return 'No name';
        case 'vfdLimit' :
          return 'Set amount limit';
        case 'vfdDailyLimit' :
          return 'Set daily limit';
        case 'vfdPassword' :
          return 'Change password';
        case 'doneSubmit':
          return 'Done';
        case 'paymentTitle':
          return 'Add payment details';
        case 'accNumber':
          return 'Account number';
        case 'accName':
          return 'Account name';
        case 'receipt':
          return 'receipt';
        case 'paymentMethod':
          return 'Payment method';
        case 'phoneNumber':
          return 'Phone number';
        case 'paymentInfo':
          return 'Invoice details';
        case 'chaguaBidhaa':
          return 'Choose product or service';
        case 'vfdInfo':
          return 'Check the receipts for other accounts and disable other VFDs';
        case 'submitReceiptToast':
          return 'Are you sure you want to submit a receipt of products or services?'
              '\n\n Amount: Tshs ';
        case 'nameServiceProduct':
          return 'Product or service name';
        case "receipt1" :
          return 'Fill the details below to make a receipt';
        case 'noProduct':
          return 'No products added, please add products';
        case 'noCustomer':
          return 'No customer details, please fill the details';
        case 'customerSearch' :
          return 'Search for customer name';
        case 'customerNameOption':
          return 'Customer name(Optional)';
        case 'customerName':
          return 'Customer name';
        case 'cutomerPhone':
          return 'Phone number';
        case 'customerTitle':
          return 'Add customer';
        case 'addCustomer':
          return 'Add customer';
        case 'LengthTinToast':
          return 'Invalid TIN number';
        case 'enterNameToast':
          return 'Please enter customer name';
        case 'loadingMore':
          return 'Loading other receipts';
        case 'addProduct':
          return 'Add product or service';
        case 'tahadhariInfo3':
          return 'Are you sure you want to delete product?';
        case 'acceptCaution' :
          return 'Yes';
        case 'denyCaution':
          return 'Cancel';
        case 'productSub':
          return 'Items';
        case 'tahadhariInfo2':
          return 'Are you sure you want to change your password?';
        case 'tahadhariInfo1':
          return 'Are you sure you want to print a receipt of selected products?';
        case 'tahadhari':
          return 'Caution';
        case 'badiliButton':
          return 'Change';
        case 'newNumber':
          return 'Enter your new number';
        case 'Info1':
          return 'Company name';
        case 'Info2':
          return 'TIN';
        case 'Info3':
          return 'VRN';
        case 'Info4':
          return 'P.O.Box';
        case 'Info5':
          return 'Street';
        case 'Info6':
          return 'Region';
        case 'Info7':
          return 'Country';
        case 'Profile1':
          return 'The information below are the ones submitted to the revenue authority TRA';
        case 'Profile6':
          return 'Business phone number';
        case 'Profile2':
          return 'Login phone number';
        case 'Profile3':
          return 'Change Password';
        case 'Profile4':
          return 'Check other VFD\u0027s  ';
        case 'Profile5':
          return 'Log out';
        case 'homeSub1':
          return 'Make a list of more than one product \nor service for generating receipts';
        case 'homeTitle2':
          return 'Contact us';
        case 'homeSub2':
          return 'Press here to contact us for further\n assistance';
        case 'homeTitle3':
          return 'Add customers';
        case 'homeSub3':
          return 'Make a list of customers for easy \nreceipt generation';
        case 'homeTitle1':
          return 'Add product';
        case 'thirdAvatar':
          return 'Press here';
        case 'perDay':
          return 'per day';
        case 'secondAvatar':
          return 'Make receipts easily';
        case 'firstAvatar':
          return 'Fast Receipt';
        case "homePage":
          return 'Welcome';
        case 'thibitisha':
          return 'Confirm';
        case 'repeatChangePassword':
          return 'Confirm password';
        case 'newChangePassword':
          return 'New password';
        case 'changePassword':
          return 'Change password';
        case'forgotpasswordTitle':
          return 'Forgot password?';
        case 'confirmOTP':
          return 'Confirm';
        case 'info3OTP':
          return 'Resend code';
        case 'info2OTP':
          return 'Didn\u0027t get code?';
        case 'infoOTP':
          return 'Enter the code that has been \nsent to your phone number';
        case 'titleOTP':
          return 'Confirm number';
        case 'kitambulisho':
          return 'Identity card (NIDA, Passport nk)';
        case 'chetiVAT':
          return 'VAT certificate (If registered)';
        case 'chetiTIN':
          return 'TIN certificate';
        case 'infoFinish':
          return 'Finish';
        case 'infoNext':
          return 'Next';
        case'enterPhone':
          return 'Enter your phone number';
        case'registerTitle2':
          return 'Open your account for free';
        case 'registerTitle1':
          return 'Register';
        case 'loginTitle':
          return 'Please enter your credentials';
        case 'infoSub4':
          return 'Easily send the receipt to your customer through sms but also you can print through the EFD printer';
        case 'infoTitle4':
          return 'Send, store and print receipts';
        case 'infoSub3':
          return 'From a single account multiple'
              ' users can generate receipts through the app but also you can make different accounts for each user for the same business';
        case 'infoTitle3':
          return 'Make receipts through more than one phone';
        case 'infoSub2':
          return 'Give receipts to your customer daily throughout the year just from a one time subscription';
        case 'infoTitle2':
          return 'Unlimited receipts yearly';
        case 'infoSub1':
          return 'Make receipts easily through our app and share with your customers through your mobile phone';
        case 'infoTitle1':
          return 'We help you generate TRA receipts easily ';
        case "changingPasswordToast":
          return "Changing your password, please wait...";
        case "sms_text_part_one":
          return "thanks you for using their services";
        case "sms_text_part_two":
          return "Download your receipt by clicking";
        case "sms_text_part_three":
          return "Issue TRA receipts with your smart phone. Download SMART EFD APP or visit https://www.smartefd.co.tz/";
        case "send_sms_button":
          return "SEND SMS";
        case "sms_sent_toast":
          return "SMS sent successfully!";
        case "addProductOrService":
          return "Add product/service";
        case "manageVfd":
          return "View Other VFD's";
        case "customerVfd":
          return "Manage Other VFD's";
        case "vfdReport":
          return "Report";
        case "vfdReportBtn":
          return "VFD REPORT";
        case "loading":
          return "Please wait...";
        case "chooseLanguage":
          return "Choose language";
        case "share":
          return "Share";
        case "changeLanguage":
          return "Change language";
        case "changePassword":
          return "Change Password";
        case "languageToast":
          return "Please select language to continue";
        case "next":
          return "Continue";
        case "yes":
          return "Yes";
        case "no":
          return "No";
        case "areYouSure":
          return "Are you sure";
        case "exitApp":
          return "You want to exit Smart EFD?";
        case "confirmTitle":
          return "Confirm";
        case "confirmDesc":
          return "Are you sure you want to issue receipt of Tsh";
        case "confirmDescSelect":
          return "Confirm issue receipt for selected products/services";
        case "loginButton":
          return "Login";
        case "registerButton":
          return "Sign Up";
        case "signUp":
          return "Sign Up";
        case "welcomeBackText":
          return "Welcome back ! Login with your credentials";
        case "reports":
          return "Reports";
        case "receipt":
          return "Receipt";
        case "profile":
          return "Profile";
        case "dateFrom":
          return "First date";
        case "dateTo":
          return "Last date";
        case "congratulation":
          return "Congratulation";
        case "phone":
          return "Phone";
        case "password":
          return "Password";
        case "confirmPassword":
          return "Confirm Password";
        case "haveNoAccount":
          return "Have no account?";
        case "clickToRegister":
          return "Sign up";
        case "haveAccount":
          return "Have an account?";
        case "clickToSignIn":
          return "SIGN IN";
        case "clickHere":
          return "press here";
        case "createAccountItsFree":
          return "Create an Account,Its free";
        case "enterTinToast":
          return "Enter TIN number";
        case "tinLengthToast":
          return "Invalid TIN, Please enter a valid TIN";
        case "enterPhoneToast":
          return "Please enter Phone number";
        case "enterPasswordToast":
          return "Enter password";
        case "enterConfirmPasswordToast":
          return "Enter confirm password";
        case "passwordsDoNotMatch":
          return "Wrong current password";
        case "invalidPhoneNumberToast":
          return "Invalid phone provided";
        case "accountExpired":
          return "Account Expired";
        case "search":
          return "RECEIPT REPORT";
        case "fillInDateFrom":
          return "Fill in first date";
        case "fillInDateTo":
          return "Fill in last date";
        case "regId":
          return "Reg ID";
        case "vrn":
          return "VRN Number";
        case "phone":
          return "Phone";
        case "address":
          return "Address";
        case "street":
          return "Street";
        case "city":
          return "City";
        case "country":
          return "Country";
        case "signOut":
          return "Sign Out";
        case "addProduct":
          return "Add product(s)";
        case "listProductsSelected":
          return "No product/service selected";
        case "addedProducts":
          return "LIST OF PRODUCTS/SERVICE";
        case "productSelectText":
          return "[--Select--]";
        case "productSelectedToast":
          return "Product/serveice already selected. Please, select another product/service";
        case "paymentSearch":
          return "Search for an account";
        case "productSearch":
          return "Search for service or product";
        case "product":
          return "Product or service";
        case "addProductTitle":
          return "Add Product/Service";
        case "addProductToast":
          return "Enter product / service";
        case "noDataFound":
          return "No data found!";
        case "productDesc":
          return "Product";
        case "taxGroup":
          return "Tax Group";
        case "qnty":
          return "Quantity (Eg. 10)";
        case "qntyToast":
          return "Please fill in product quantity";
        case "amount":
          return "Unit Cost (Tsh)";
        case "customerName":
          return "Customer Name (Optional)";
        case "customerPhone":
          return "Customer Phone (Optional)";
        case "sendSMS":
          return "- Send SMS";
        case "customerTIN":
          return "Customer TIN (Optional)";
        case "customerVRN":
          return "Customer VRN (Optional)";
        case "submitButton":
          return "Submit";
        case "doneButton":
          return "Done";
        case "enterAmountToast":
          return "Enter amount";
        case "enterProductToast":
          return "Product/Service can\'t be empty";
        case "totalSales":
          return "Total Sales";
        case "totalTax":
          return "Total VAT";
        case "tax":
          return "VAT";
        case "save":
          return "Save & Share";
        case "print":
          return "Print";
        case "searchPrinter":
          return "Search printer..";
        case "printAllReceiptBtn":
          return "Print All Receipt";
        case "vfdSerialNo":
          return "VFD serial No";
        case "vfdReceiptList":
          return "VFD Receipt List";
        case "cancel":
          return "Cancel";
        case "saveToGallery":
          return "Save to Gallery";
        case "servicePricing":
          return "Service Pricing";
        case "close":
          return "Close";
        case "weWillCommunicate":
          return "Thank you for using Smart EFD.";
        case "forMoreInfo":
          return "For more information or sending required \ndocuments you can contact us via";
        case "successCreateAccount":
          return "You have successfully set up your account";
        case "whatIsNeeded":
          return "What is needed";
        case "charges":
          return "Charges";
        case "freeSubscribeText":
          return "Subscribing to the Smart EFD service is free";
        case "paymentText":
          return "Customer care will call you for the payment process";
        case "payNumberPay":
          return "Pay using PAY NUMBER XXXX";
        case "whatIsNeededDesc":
          return "TIN Certificate, VAT Certificate (If registered), Signatory identity card";
        case "downloadLetter":
          return "Download the letter here";
        case "issueReceipt":
          return "Issue year-round receipt \nOne account for all your phones";
        case "annually":
          return "Annually";
        case "saveMoney":
          return "Save money";
        case "year":
          return "Year";
        case "loginRegisterTitle":
          return "Easy and affordable";
        case "TINDigits":
          return "TIN should be 9 numbers";
        case "noRecordFoundToast":
          return "No record found";
        case "noPrinteround":
          return "No printer found";
        case "blueMessage":
          return "Please turn on your bluetooth, turn on your location and pair with your printer device. Then try again to print!";
        case "helpMessage":
          return "For any Inquery, call us here";
        case "currentPassword":
          return "Current password";
        case "newPassword":
          return "New password";
        case "reEnterNewPassword":
          return "Confirm new password";
        case "enterCurrentPasswordToast":
          return "Please enter current password";
        case "enterNewPasswordToast":
          return "Please enter new password";
        case "repeatNewPasswordToast":
          return "Please repeat new password";
        case "passwordMatchSignUpToast":
          return "Passwords do not match";
        case "passwordChangedSuccessfully":
          return "Password changed successfully!";
        case "passwordChangedFailed":
          return "Failed changing your password, please try again!";
        case "okButton":
          return "Ok!";
        case "shareMessage":
          return "Share";
        case "tryDemo":
          return "Try Demo";
        case "checking":
          return "Checking ..";
        case "successChecking":
          return "Success ..";
        case "verifyingCode":
          return "Verifying code ...";
        case "codeVerifiedSuccessfully":
          return "Code verified successfully";
        case "processingRequest":
          return "Processing..";
        case "verificationCodeTitle":
          return "Verification code";
        case "verificationCodePhoneEnding":
          return "Verification code sent to phone number ending";
        case "verificationCodeEmailEnding":
          return "or to email";
        case "clearAll":
          return "Clear all";
        case "resetPasswordTitle":
          return "Reset Password";
        case "enterVerificationCodeToast":
          return "Please, enter verification code.";
        case "newPass":
          return "new password";
        case "reEnterNewPass":
          return "Re-enter new password";
        case "passwordChangeSuccess":
          return "You have successfully changed your password";
        case "passwordChangeFailure":
          return "Failure \n\n Your passsword reset request failed. Please try again.";
        case "enterNewPassToast":
          return "Please enter new password";
        case "enterRepeatNewPassToast":
          return "Please repeat your new password";
        case "passwordMatchSignUpToast2":
          return "New passwords  do not match";
        case "forgotPassword":
          return "Forgot Password?";
        case "clickToEnterVerificationCode":
          return "Click to enter verification Code";
        case "resetPassword":
          return "Reset Password";
        case "invalidVerificationCode":
          return "Invalid Verification Code";
        case "okButton":
          return "Ok";
        case "changeCustomerPhone":
          return "Change Phone Number";
        case "internetConnectionToast":
          return "Please check your internet connection to continue.!";
        case "confirmDelete":
          return "Are you you want to delete this item?";
        case "confirmActivate":
          return "Are you you want to activate this VFD?";
        case "confirmDeactivate":
          return "Are you you want to de-activate this VFD?";
        case "selectPhone":
          return "Select phone number";
        case "devicesList":
          return "Devices List";
        case "areYouSureYouWantToRemoveThisDevice":
          return "Are you sure you want to remove this device?";
        case "yes":
          return "Yes";
        case "no":
          return "No";
        case "deviceRemovedSuccesfully":
          return "Device removed successfully.";
        case "accept":
          return "Nafahamu";
        case "reject":
          return "Sifahamu";

        default:
          return "";
      }
    }

    return "";
  }
}
