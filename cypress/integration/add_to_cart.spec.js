describe('add item to cart', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('clicking on the Add button for a product adds it to the cart', () => {
    cy.contains('My Cart (0)')
    cy.get('body > main > section > div > article:nth-child(1) > div > form > button').click()
    cy.contains('My Cart (1)')
  })
})