describe('home page', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('able to log in with valid credentials successfully', () => {
    cy.get('#navbarSupportedContent > ul:nth-child(2) > li:nth-child(3) > a').click()
    cy.get('#email').type('bananas@gmail.com')
    cy.get('#password').type('123Password')
    cy.get('body > main > div > div > form > input.btn.btn-secondary').click()
    cy.contains('Logout')
  })
})