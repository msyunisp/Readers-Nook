<?php
    $db_server = "localhost";
    $db_user = "root";
    $db_password = "root";
    $db_name = "readers_nook";
    
    // Create connection
    $conn = mysqli_connect($db_server, $db_user, $db_password, $db_name);

    // Check connection
    if (!$conn)
        echo "Connection failed" ;

    $sql = "SELECT * FROM book";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        echo "<table border='1' cellpadding='8'>";
        echo "<tr>
                <th>ISBN</th>
                <th>Title</th>
                <th>Description</th>
                <th>Price</th>
                <th>Publication Date</th>
                <th>Aisle Location</th>
                <th>Stock Quantity</th>
                <th>Recorded On</th>
                <th>Recorded By</th>
              </tr>";
    
        while($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>{$row['ISBN']}</td>
                    <td>{$row['Title']}</td>
                    <td>{$row['Description']}</td>
                    <td>{$row['Price']}</td>
                    <td>{$row['PublicationDate']}</td>
                    <td>{$row['AisleLocation']}</td>
                    <td>{$row['StockQuantity']}</td>
                    <td>{$row['RecordedOn']}</td>
                    <td>{$row['RecordedBy']}</td>
                  </tr>";
        }
        echo "</table>";
    } else {
        echo "0 results";
    }
    
    $conn->close();
?>