<?php

$I = new AcceptanceTester($scenario);
initTest::login($I);
$I->amOnPage('/');
$I->waitForText('Заказать звонок');
$I->click('.isDrop');
$I->waitForElement('.btn-form>button');
$I->fillField('.//*[@id="data-callback"]/label[1]/span[2]/input', '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456781234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567');
$I->fillField('.//*[@id="data-callback"]/label[2]/span[2]/input', '12345678901234567890123456789012345678901234567890');
$I->fillField('.//*[@id="data-callback"]/label[3]/span[2]/textarea', '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456781234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567');
$I->click('.btn-form>button');
$I->waitForElementNotVisible('.//*[@id="ordercall"]');

