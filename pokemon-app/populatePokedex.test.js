const pokemonModule = require('./populatePokedex');

test("convertEntries will transform Pokemon JSON when called with valid data", () => {
    // Arrange
    const jsonData = {
        id: "456",
        name: 'cyndaquil',
        types: [ 
            { 
                slot: 1, 
                type: { name: 'fairy', url: 'https://pokeapi.co/api/v2/type/18/' }
            } 
        ],
    };

    const expectedOutput = {
        name: "Bob",
        id: "456",
        type: "Fairy"
    };

    // Act
    const actualOutput = pokemonModule.convertEntry("Bob", jsonData);

    // Assert
    expect(actualOutput).toStrictEqual(expectedOutput);
});
