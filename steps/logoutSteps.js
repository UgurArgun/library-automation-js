import { Given, When, Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';
import { BrowserUtility } from '../utilities/BrowserUtility.js';
import { PageManager } from "../globalPagesSetup.js";


// WRITE YOUR STEP DEFINITIONS HERE...
When('user is already logged in as {string}', async function (string) {
    await PageManager.loginPage.login(string);
    await BrowserUtility.sleep(2);

});
When('user clicks the profile on top right corner of the page', async function () {
    await PageManager.dashboardPage.userProfileImage.click();

});

When('user clicks the logout button', async function () {
    await PageManager.dashboardPage.logoutButton.click();

});

Then('user should be logged out successfully', async function () {
    await expect(PageManager.page).toHaveTitle("Login - Library");
});