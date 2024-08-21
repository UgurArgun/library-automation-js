import { BasePage } from "./BasePage.js";

export class BooksPage extends BasePage {
  /**
   * @param {import('playwright').Page} page
   */
  constructor(page) {
    super(page);
    this.bookCategoriesDropdown = page.locator("//select[@id='book_categories']");

}
}