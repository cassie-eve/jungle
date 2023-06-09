describe('home page', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('page loads successfully', () => {
    cy.get('h1').should('contain.text', 'The Jungle')
  })
  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible")
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})