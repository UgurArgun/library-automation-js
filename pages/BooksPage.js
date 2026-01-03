import { BasePage } from "./BasePage.js";

export class BooksPage extends BasePage {
  /**
   * @param {import('playwright').Page} page
   */
  constructor(page) {
    super(page);
    this.bookCategoriesDropdown = page.locator("//select[@id='book_categories']");
    this.recordsDropdown = page.locator('[name="tbl_books_length"]');
    this.tableRows = page.locator("#tbl_books tbody tr");
}
}