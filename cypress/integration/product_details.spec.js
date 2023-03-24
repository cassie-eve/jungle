describe('individual product page', () => {
  beforeEach(() => {
    cy.visit('/')
    cy.get('body > main > section > div > article:nth-child(1)').click()
  })

  it('page loads successfully', () => {
    cy.url().should('include', '/products/')
  })

})