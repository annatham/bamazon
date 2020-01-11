var mysql = require("mysql");
var inquirer = require("inquirer");

// create the connection information for the sql database
var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "Anna",

  // Your password
  password: "",
  database: "bamazonDB"
});

// connect to the mysql server and sql database
connection.connect(function(err) {
  if (err) throw err;
  // run the start function after the connection is made to prompt the user
  readProducts();
});

function readProducts() {
    console.log("Displaying all products...\n");
    connection.query("SELECT * FROM products", function(err, res) {
      if (err) throw err;
      // Log all results of the SELECT statement
      console.log(res);
      start();
    });
}
// function which prompts the user for what action they should take
function start() {
    connection.query("SELECT * FROM products", function(err, results) {
        if (err) throw err;
    inquirer
      .prompt([
        {
          name: "choice",
          type: "rawlist",
          choices: function() {
            var choiceArray = [];
            for (var i = 0; i < results.length; i++) {
              choiceArray.push(results[i].item_id);
            }
            return choiceArray;
          },
          message: "Which item would you like to purchases?"
        },
        {
          name: "purchaseByID",
          type: "input",
          message: "How many items would you like to purchase?"
        }
      ])
      .then(function(answer) {
        // get the information of the chosen item
        var chosenItem;
        for (var i = 0; i < results.length; i++) {
          if (results[i].product_name === answer.purchaseByID) {
            chosenItem = results[i];
          }
        }

        // determine if bid was high enough
        if (chosenItem.stock_quantity < parseInt(answer.quantity)) {
          // if item is stocked, update db
          connection.query(
            "DELETE FROM products SET ? WHERE ?",
            [
              {
                stock_quantity: stock_quantity - answer.quantity
              }
            ],
            function(error) {
              if (error) throw err;
              console.log("Total cost is " + chosenItem.price);
              start();
            }
          );
        }
        else {
          // not enough product and start over
          console.log("Insufficient quantity!");
          start();
        }
      });
  });
};
