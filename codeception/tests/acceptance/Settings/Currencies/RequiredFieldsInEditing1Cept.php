<?php

$I = new AcceptanceTester($scenario);
initTest::login($I);
$I->amOnPage('/admin/components/run/shop/currencies');
$I->click('.//*[@id="currency_tr1"]/td[2]/a');
$I->waitForElement('.//*[@id="mod_name"]/label');
$I->fillField(CurrenciesPage::$NameCurrencyEdit, '');
$I->fillField(CurrenciesPage::$IsoCodEdit, '');
$I->fillField(CurrenciesPage::$SymbolEdit, '');
$I->fillField(CurrenciesPage::$Rate, '');
$I->click(CurrenciesPage::$SaveButton);
$I->see('Это поле обязательное.', './/*[@id="cur_ed_form"]/table/tbody/tr/td/div/div[1]/div/label');
$I->see('Это поле обязательное.', './/*[@id="cur_ed_form"]/table/tbody/tr/td/div/div[2]/div/label');
$I->see('Это поле обязательное.', './/*[@id="cur_ed_form"]/table/tbody/tr/td/div/div[3]/div/label');
$I->see('Это поле обязательное.', './/*[@id="mod_name"]/div/label');
