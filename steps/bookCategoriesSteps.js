import { Given, When, Then } from "@cucumber/cucumber";
import { expect } from "@playwright/test";
import { BrowserUtility } from "../utilities/BrowserUtility.js";
import { PageManager } from "../globalPagesSetup.js";

When("user clicks Books link", async function () {
  await PageManager.dashboardPage.bookLink.click();
  await BrowserUtility.sleep(2);
});

When("user clicks the book categories drop down box", async function () {
  await PageManager.booksPage.bookCategoriesDropdown.click();
});

Then("user should see {int} book categories", async function (int) {
  const totalOptions = await PageManager.booksPage.bookCategoriesDropdown
    .locator("option")
    .count();
  console.log("Total book categories: " + totalOptions);
  expect(totalOptions).toBe(int);
});

Then(
  "book category name {string} should be included in the categories",
  async function (string) {
    const selectedCategory = await PageManager.booksPage.bookCategoriesDropdown
      .locator("option")
      .allInnerTexts();
    expect(selectedCategory).toContain(string);
  }
);

// TODO: Create step definitions for records dropdown verification
/*      When user clicks to number dropdown of the show records
        And selects the "<record number>"
        Then it shows that there are "record number"
        And it displays the filtered book numbers correctly
        */

Given("user clicks to number dropdown of the show records", async function () {
  await PageManager.booksPage.recordsDropdown.click();
});

When("user selects the {string}", async function (recordNumber) {
  const dropdown = PageManager.booksPage.recordsDropdown;
  await dropdown.selectOption({ value: recordNumber });

  // verify selection actually changed
  await expect(dropdown).toHaveValue(recordNumber);
});

Then("it shows that there are {string}", async function (recordNumber) {
  const selectedRecord =
    await PageManager.booksPage.recordsDropdown.inputValue();
  expect(selectedRecord).toBe(recordNumber);
});

Then("it displays the filtered book numbers correctly for {string}",
    async function (recordNumber) { const n = Number(recordNumber);

    // wait until table redraw finishes (DataTables often redraws async)
    // await expect(PageManager.booksPage.tableRows.first()).toBeVisible();
    await BrowserUtility.sleep(2);

    const visibleRows = await PageManager.booksPage.tableRows.count();
    expect(visibleRows).toBeLessThanOrEqual(n);
  }
);
