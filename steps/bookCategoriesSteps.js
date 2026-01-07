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
/*
 Scenario: Verify users can see all filtered pages
        When user clicks to book categories dropdown menu
        And clicks the page numbers at the bottom of the page
        Then it displays the relevant pages with correct numbers
        And it displays only the filtered books


And("clicks the page numbers at the bottom of the page", async function () {
    await PageManager.booksPage.paginationButtons.click();
    });
*/

/*
       And selects the "<favorite book>" category
        Then it displays the favorite books under the Category column
        And it displays the filtered book category in the dropdown menu
        And it displays the filtered book numbers correctly
*/
When('selects the {string} category', async function (favoriteBook) {
    const dropdown = PageManager.booksPage.bookCategoriesDropdown;
    await dropdown.selectOption({ label: favoriteBook });
    await dropdown.click();
    this.selectedCategory = favoriteBook;
    // verify selection actually changed
    await expect(dropdown.locator("option:checked")).toHaveText(favoriteBook);
});

Then('it displays the favorite books under the Category column', async function () {
    const headerTexts = await PageManager.booksPage.page
        .locator("#tbl_books thead th")
        .allInnerTexts();
    const categoryIndex = headerTexts.findIndex(
        (text) => text.trim() === "Category"
    );
    const columnIndex = categoryIndex >= 0 ? categoryIndex + 1 : 4;
    const categoryCells = PageManager.booksPage.tableRows.locator(
        `td:nth-child(${columnIndex})`
    );
    const expectedCategory = this.selectedCategory;
    if (expectedCategory && expectedCategory !== "ALL") {
        await expect
            .poll(
                async () => {
                    const texts = (await categoryCells.allInnerTexts()).map((t) =>
                        t.trim()
                    );
                    if (texts.length === 0) return false;
                    return texts.every((text) => text === expectedCategory);
                },
                { timeout: 5000 }
            )
            .toBe(true);
    } else {
        const rowCount = await categoryCells.count();
        for (let i = 0; i < rowCount; i++) {
            const cellText = await categoryCells.nth(i).innerText();
            expect(cellText).toBeDefined();
        }
    }
});

Then('it displays the filtered book category in the dropdown menu', async function () {
    const selectedCategory =
        await PageManager.booksPage.bookCategoriesDropdown.inputValue();
    expect(selectedCategory).toBeDefined();
}); 
