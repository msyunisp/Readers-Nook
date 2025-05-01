# Readers-Nook
<a href="#Home">Home</a>
<a href="#Guide">Guide</a>

<h2>Final Project for CC225</h2>

<ul>Collaborators:
  <li>Russel Benedict Alforque </li>
  <li>Victor Ronnuel David</li>
  <li>Britz Pitogo</li>
  <li>Jesa Mae </li>
  <li>Ryan Andrie Coretico</li>
  <li>Eunice Pialan</li>
  <li>Aerial Abella</li>
</ul>
<h1 id="Home">Reader’s Nook: Sales and Inventory Management for Bookstore that sells Novels</h1>

Overview:
&nbsp; &nbsp; &nbsp;Reader’s Nook is a specialized retail bookstore that sells a wide variety of novels across different genres such as mystery, romance, science fiction, fantasy, and literary fiction. The store operates as a brick-and-mortar business and focuses on physical book sales only. It does not currently engage in online sales or consignment operations. All books are purchased from suppliers, stocked in-store, and sold directly to walk-in customers.

<h1>System Scope</h1>
The Sales and Inventory Management System for Reader’s Nook will cover the following operational and functional areas:

<ul>1. Book Management
<li>Staff can add, edit, and delete book records with comprehensive details such as title, author, ISBN, price, cost, genre, description, and publication data.</li>
<li>Each book is assigned a physical storage location (e.g., aisle/shelf).</li>
<li>Books are organized and searchable by title, author, and genre.</li>
</ul>

<ul>2. Inventory Control
<li>The system maintains real-time stock levels of all novels in the store.</li>
<li>Staff can record incoming stock from suppliers and track inventory movement.</li>
<li>Inventory is automatically updated upon each sale.</li>
<li>Low-stock alerts are generated to prompt timely restocking.</li>
<li>A basic warehouse mapping system helps locate books in the store.</li>
</ul>

<ul>3. Sales Processing
<li>Sales are recorded at the point of purchase, capturing book details, quantity sold, price, cashier, and timestamp.</li>
<li>Supports receipt generation and sales history tracking.</li>
<li>Ensures automatic inventory adjustment with every sale.</li>
</ul>

<ul>4. Supplier and Purchase Order Management
<li>Store can maintain supplier records and associate them with books.</li>
<li>Staff can create, track, and update purchase orders, including their status (e.g., pending, received).</li>
<li>Ensures smooth restocking operations and supply chain tracking.</li>
</ul>

<ul>5. User Roles and Access
<li><ul>The system supports multi-user access with different permission levels:
<lu>Admin – full access</li>
<lu>Cashier – limited to sales</li>
<lu>Inventory Clerk – manages books, inventory, and suppliers</li>
</ul>
<li>Each user is registered with personal and job-related information.</li>
<li>The system maintains logs of user activities for security and auditing.</li>
</ul>

<ul>6. Reports and Analytics
<li>The system provides automated reports on Daily, weekly, and monthly sales</li>
<li>Best- and worst-selling books</li>
<li>Revenue and profit summaries</li>
</ul>

<ul>❌ Out of Scope
<li>No support for online book sales or e-commerce integration.</li>
<li>No handling of digital content (eBooks, audiobooks).</li>
<li>No support for consignment-based book sales or rentals.</li>
</ul>

<h1 id="Guide">Guide</h1>
Install and Setup your XAMPP
You need to clone this repository inside <b>XAMPP->htdocs->phpscripts</b>(you can name it anything but ill be referring to it as phpscripts)
&nbsp; &nbsp; <i>The htdocs directory is where XAMPP's local Apache server looks for files to serve to the web browser.</i>
Try opening the apache server using <b>http://localhost/phpscripts</b>, it will open the index.php file
