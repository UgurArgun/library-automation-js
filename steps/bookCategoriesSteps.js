import { Given, When, Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';
import { BrowserUtility } from '../utilities/BrowserUtility.js';
import { PageManager } from "../globalPagesSetup.js";

When('user clicks Books link', async function () {
    await PageManager.dashboardPage.bookLink.click();
    await BrowserUtility.sleep(2);

});

When('user clicks the book categories drop down box', async function () {
    await PageManager.booksPage.bookCategoriesDropdown.click();
});

Then('user should see {int} book categories', async function (int) {
    const totalOptions = await PageManager.booksPage.bookCategoriesDropdown.locator("option").count();
    console.log(totalOptions.toString());
    expect(totalOptions).toBe(int);
});

Then('book category name {string} should be included in the categories', async function (string) {
    const selectedCategory = await PageManager.booksPage.bookCategoriesDropdown.locator("option").allInnerTexts();
    expect(selectedCategory).toContain(string);
});